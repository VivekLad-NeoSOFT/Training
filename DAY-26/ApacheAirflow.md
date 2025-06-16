# Apache Airflow - 3

## Deferrable Operators & Triggers

Standard Operators and Sensors take up a full worker slot for the entire time they are running, even if they are idle.

For example:  
If you only have 100 worker slots available to run tasks, and you have 100 dags waiting on a sensor that’s currently running but idle, then you cannot run anything else - even though your entire Airflow cluster is essentially idle.

`reschedule` mode for sensors solves some of this, by allowing sensors to only run at fixed intervals, but it is inflexible and only allows using time as the reason to resume, not other criteria.

This is where Deferrable Operators can be used. When it has nothing to do but wait, an operator can suspend itself and free up the worker for other processes by deferring. When an operator defers, execution moves to the triggerer, where the trigger specified by the operator will run. The trigger can do the polling or waiting required by the operator. Then, when the trigger finishes polling or waiting, it sends a signal for the operator to resume its execution. During the deferred phase of execution, since work has been offloaded to the triggerer, the task no longer occupies a worker slot, and you have more free workload capacity. By default, tasks in a deferred state don’t occupy pool slots. If you would like them to, you can change this by editing the pool in question.

Triggers are small, asynchronous pieces of Python code designed to run in a single Python process. Because they are asynchronous, they can all co-exist efficiently in the triggerer Airflow component.

An overview of how this process works:

- A task instance (running operator) reaches a point where it has to wait for other operations or conditions, and defers itself with a trigger tied to an event to resume it. This frees up the worker to run something else.

- The new trigger instance is registered by Airflow, and picked up by a triggerer process.

- The trigger runs until it fires, at which point its source task is re-scheduled by the scheduler.

- The scheduler queues the task to resume on a worker node.

## Using Deferrable Operators

If you want to use pre-written deferrable operators that come with Airflow, such as `TimeSensorAsync`, then you only need to complete two steps:

- Ensure your Airflow installation runs at least one `triggerer` process, as well as the normal `scheduler`

- Use deferrable operators/sensors in your dags

Airflow automatically handles and implements the deferral processes for you.

## XComs

XComs (short for “cross-communications”) are a mechanism that let Tasks talk to each other,
as by default Tasks are entirely isolated and may be running on entirely different machines.

An XCom is identified by a key (essentially its name), as well as the `task_id` and `dag_id` it came from.
They can have any serializable value, but they are only designed for small amounts of data; do not use them to pass around large values, like dataframes.

XComs are explicitly “pushed” and “pulled” to/from their storage using the `xcom_push` and `xcom_pull` methods on Task Instances.

#### To push a value within a task called “task-1” that will be used by another task:

```
# pushes data in any_serializable_value into xcom with key "identifier as string"
task_instance.xcom_push(key="identifier as a string", value=any_serializable_value)
```

#### To pull the value that was pushed in the code above in a different task:

```
# pulls the xcom variable with key "identifier as string" that was pushed from within task-1
task_instance.xcom_pull(key="identifier as string", task_ids="task-1")
```
