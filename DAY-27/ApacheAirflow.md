# Apache Airflow - 4

## Writing Triggers

A Trigger is written as a class that inherits from `BaseTrigger`, and implements three methods:

- `__init__`: A method to receive arguments from operators instantiating it. Since `2.10.0`, we’re able to start task execution directly from a pre-defined trigger. To utilize this feature, all the arguments in `__init__` must be serializable.

- `run`: An asynchronous method that runs its logic and yields one or more `TriggerEvent` instances as an asynchronous generator.

- `serialize`: Returns the information needed to re-construct this trigger, as a tuple of the classpath, and keyword arguments to pass to `__init__`.

Following example shows the structure of a basic trigger, a very simplified version of Airflow’s `DateTimeTrigger`:

```
import asyncio

from airflow.triggers.base import BaseTrigger, TriggerEvent
from airflow.utils import timezone


class DateTimeTrigger(BaseTrigger):
    def __init__(self, moment):
        super().__init__()
        self.moment = moment

    def serialize(self):
        return ("airflow.providers.standard.triggers.temporal.DateTimeTrigger", {"moment": self.moment})

    async def run(self):
        while self.moment > timezone.utcnow():
            await asyncio.sleep(1)
        yield TriggerEvent(self.moment)
```

### There’s some design constraints to be aware of when writing your own trigger:

- The `run` method must be asynchronous (using Python’s `asyncio`), and correctly `await` whenever it does a blocking operation.

- `run` must `yield` its `TriggerEvents`, not return them. If it returns before yielding at least one event, Airflow will consider this an error and fail any Task Instances waiting on it. If it throws an exception, Airflow will also fail any dependent task instances.

- You should assume that a trigger instance can run more than once. This can happen if a network partition occurs and Airflow re-launches a trigger on a separated machine. So, you must be mindful about side effects. For example you might not want to use a trigger to insert database rows.

- If your trigger is designed to emit more than one event (not currently supported), then each emitted event must contain a payload that can be used to deduplicate events if the trigger is running in multiple places. If you only fire one event and don’t need to pass information back to the operator, you can just set the payload to `None`.

- A trigger can suddenly be removed from one triggerer service and started on a new one. For example, if subnets are changed and a network partition results or if there is a deployment. If desired, you can implement the `cleanup` method, which is always called after `run`, whether the trigger exits cleanly or otherwise.

- In order for any changes to a trigger to be reflected, the triggerer needs to be restarted whenever the trigger is modified.

- Your trigger must not come from a dag bundle - anywhere else on `sys.path` is fine. The triggerer does not initialize any bundles when running a trigger.

### Trigger Rules

By default, Airflow will wait for all upstream (direct parents) tasks for a task to be successful before it runs that task.

However, this is just the default behaviour, and you can control it using the `trigger_rule` argument to a Task. The options for `trigger_rule` are:

- `all_success` (default): All upstream tasks have succeeded.

- `all_failed`: All upstream tasks are in a `failed` or `upstream_failed` state.

- `all_done`: All upstream tasks are done with their execution.

- `all_skipped`: All upstream tasks are in a skipped state.

- `one_failed`: At least one upstream task has failed (does not wait for all upstream tasks to be done).

- `one_success`: At least one upstream task has succeeded (does not wait for all upstream tasks to be done).

- `one_done`: At least one upstream task succeeded or failed.

- `none_failed`: All upstream tasks have not `failed` or `upstream_failed` - that is, all upstream tasks have succeeded or been skipped.

- `none_failed_min_one_success`: All upstream tasks have not `failed` or `upstream_failed`, and at least one upstream task has succeeded.

- `none_skipped`: No upstream task is in a `skipped` state - that is, all upstream tasks are in a `success`, `failed`, or `upstream_failed` state.

- `always`: No dependencies at all, run this task at any time.

## Branching

You can make use of branching in order to tell the DAG not to run all dependent tasks, but instead to pick and choose one or more paths to go down. This is where the `@task.branch` decorator come in.

The `@task.branch` decorator is much like `@task`, except that it expects the decorated function to return an ID to a task (or a list of IDs). The specified task is followed, while all other paths are skipped. It can also return None to skip all downstream tasks.

The task_id returned by the Python function has to reference a task directly downstream from the `@task.branch` decorated task.

The `@task.branch` can also be used with XComs allowing branching context to dynamically decide what branch to follow based on upstream tasks.

## Setup and teardown

In data workflows it’s common to create a resource (such as a compute resource), use it to do some work, and then tear it down. Airflow provides setup and teardown tasks to support this need.

### Key features of setup and teardown tasks:

- If you clear a task, its setups and teardowns will be cleared.

- By default, teardown tasks are ignored for the purpose of evaluating dag run state.

- A teardown task will run if its setup was successful, even if its work tasks failed. But it will skip if the setup was skipped.

- Teardown tasks are ignored when setting dependencies against task groups.

- Teardown will also be carried out if the DAG run is manually set to “failed” or “success” to ensure resources will be cleaned-up.

## Latest Only

Airflow’s DAG Runs are often run for a date that is not the same as the current date - for example, running one copy of a DAG for every day in the last month to backfill some data.

There are situations, though, where you don’t want to let some (or all) parts of a DAG run for a previous date; in this case, you can use the `LatestOnlyOperator`.

This special Operator skips all tasks downstream of itself if you are not on the “latest” DAG run (if the wall-clock time right now is between its execution_time and the next scheduled execution_time, and it was not an externally-triggered run).

Example:

```
import datetime

import pendulum

from airflow.providers.standard.operators.empty import EmptyOperator
from airflow.providers.standard.operators.latest_only import LatestOnlyOperator
from airflow.sdk import DAG
from airflow.utils.trigger_rule import TriggerRule

with DAG(
    dag_id="latest_only_with_trigger",
    schedule=datetime.timedelta(hours=4),
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=["example3"],
) as dag:
    latest_only = LatestOnlyOperator(task_id="latest_only")
    task1 = EmptyOperator(task_id="task1")
    task2 = EmptyOperator(task_id="task2")
    task3 = EmptyOperator(task_id="task3")
    task4 = EmptyOperator(task_id="task4", trigger_rule=TriggerRule.ALL_DONE)

    latest_only >> task1 >> [task3, task4]
    task2 >> [task3, task4]
```

## Depends On Past

You can also say a task can only run if the previous run of the task in the previous DAG Run succeeded. To use this, you just need to set the `depends_on_past` argument on your Task to `True`.

Note that if you are running the DAG at the very start of its life—specifically, its first ever automated run—then the Task will still run, as there is no previous run to depend on.

## Hooks

A Hook is a high-level interface to an external platform that lets you quickly and easily talk to them without having to write low-level code that hits their API or uses special libraries. They’re also often the building blocks that Operators are built out of.

They integrate with Connections to gather credentials, and many have a default `conn_id`; for example, the PostgresHook automatically looks for the Connection with a `conn_id` of `postgres_default` if you don’t pass one in.

## TaskFlow

If you write most of your dags using plain Python code rather than Operators, then the TaskFlow API will make it much easier to author clean dags without extra boilerplate, all using the `@task` decorator.

TaskFlow takes care of moving inputs and outputs between your Tasks using XComs for you, as well as automatically calculating dependencies - when you call a TaskFlow function in your DAG file, rather than executing it, you will get an object representing the XCom for the result (an XComArg), that you can then use as inputs to downstream tasks or operators.

Example:

```
from airflow.sdk import task
from airflow.providers.smtp.operators.smtp import EmailOperator

@task
def get_ip():
    return my_ip_service.get_main_ip()

@task(multiple_outputs=True)
def compose_email(external_ip):
    return {
        'subject':f'Server connected from {external_ip}',
        'body': f'Your server executing Airflow is connected from the external IP {external_ip}<br>'
    }

email_info = compose_email(get_ip())

EmailOperator(
    task_id='send_email_notification',
    to='example@example.com',
    subject=email_info['subject'],
    html_content=email_info['body']
)
```
