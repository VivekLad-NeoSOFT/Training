# Apache Airflow

## What is Airflow?

Apache Airflow is an open-source platform for **developing**, **scheduling**, and **monitoring** batch-oriented workflows. Airflow’s extensible Python framework enables you to build workflows connecting with virtually any technology. A web-based UI helps you visualize, manage, and debug your workflows. You can run Airflow in a variety of configurations — from a single process on your laptop to a distributed system capable of handling massive workloads.

## Workflows

Airflow workflows are defined entirely in Python. This **"workflows as code"** approach brings several advantages:

- **Dynamic**: Pipelines are defined in code, enabling dynamic dag generation and parameterization.

- **Extensible**: The Airflow framework includes a wide range of built-in operators and can be extended to fit your needs.

- **Flexible**: Airflow leverages the **Jinja** templating engine, allowing rich customizations.

## Dags

A DAG is a model that encapsulates everything needed to execute a workflow. Some DAG attributes include the following:

- **Schedule**: When the workflow should run.
- **Tasks** : tasks are discrete units of work that are run on workers.
- **Task Dependencies**: The order and conditions under which tasks execute.
- **Callbacks**: Actions to take when the entire workflow completes.
- **Additional Parameters**: And many other operational details.

### Example DAG:

```
from datetime import datetime

from airflow.sdk import DAG, task
from airflow.providers.standard.operators.bash import BashOperator

# A DAG represents a workflow, a collection of tasks
with DAG(dag_id="demo", start_date=datetime(2022, 1, 1), schedule="0 0 * * *") as dag:
    # Tasks are represented as operators
    hello = BashOperator(task_id="hello", bash_command="echo hello")

    @task()
    def airflow():
        print("airflow")

    # Set dependencies between tasks
    hello >> airflow()
```

- A dag named "demo", scheduled to run daily starting on January 1st, 2022. A dag is how Airflow represents a workflow.

- Two tasks: One using a BashOperator to run a shell script, and another using the @task decorator to define a Python function.

- The >> operator defines a dependency between the two tasks and controls execution order.

## Why Airflow?

Airflow is a platform for orchestrating batch workflows. It offers a flexible framework with a wide range of built-in operators and makes it easy to integrate with new technologies.

#### Benifits:

- **Version control**: Track changes, roll back to previous versions, and collaborate with your team.

- **Team collaboration**: Multiple developers can work on the same workflow codebase.

- **Testing**: Validate pipeline logic through unit and integration tests.

- **Extensibility**: Customize workflows using a large ecosystem of existing components — or build your own.

## Why not Airflow?

Airflow is designed for finite, batch-oriented workflows. While you can trigger DAGs using the CLI or REST API, Airflow is not intended for continuously running, event-driven, or streaming workloads.

## How it works?

Airflow is a platform that lets you build and run workflows. A workflow is represented as a DAG (a Directed Acyclic Graph), and contains individual pieces of work called Tasks, arranged with dependencies and data flows taken into account.

A DAG specifies the dependencies between tasks, which defines the order in which to execute the tasks. Tasks describe what to do, be it fetching data, running analysis, triggering other systems, or more.

## Airflow components

Airflow’s architecture consists of multiple components.

- **Scheduler**: A scheduler, which handles both triggering scheduled workflows, and submitting Tasks to the executor to run. The executor, is a configuration property of the scheduler, not a separate component and runs within the scheduler process. There are several executors available out of the box, and you can also write your own.

- **DAG Processer**: A dag processor, which parses DAG files and serializes them into the metadata database.

- **Webserver**: A webserver, which presents a handy user interface to inspect, trigger and debug the behaviour of dags and tasks.

- **DAG folder**: A folder of DAG files, which is read by the scheduler to figure out what tasks to run and when to run them.

- **Metadata database**: A metadata database, which Airflow components use to store state of workflows and tasks.

## Operators

An Operator is conceptually a template for a predefined Task, that you can just define declaratively inside your DAG.

**Example:**

```
with DAG("my-dag") as dag:
    ping = HttpOperator(endpoint="http://example.com/update/")
    email = EmailOperator(to="admin@example.com", subject="Update complete")

    ping >> email
```

Airflow has a very extensive set of operators available, with some built-in to the core or pre-installed providers.

#### Some popular operators from core include:

- **BashOperator** - executes a bash command

- **PythonOperator** - calls an arbitrary Python function

- Use the `@task` decorator to execute an arbitrary Python function. It doesn’t support rendering jinja templates passed as arguments.

## Tasks

A Task is the basic unit of execution in Airflow. Tasks are arranged into Dags, and then have upstream and downstream dependencies set between them in order to express the order they should run in.

#### There are three basic kinds of Task:

- **Operators**: Predefined task templates that you can string together quickly to build most parts of your dags.

- **Sensors**: a special subclass of Operators which are entirely about waiting for an external event to happen.

- **`@task`**: A TaskFlow-decorated @task, which is a custom Python function packaged up as a Task.

#### Relationships

The key part of using Tasks is defining how they relate to each other - their dependencies, or as we say in Airflow, their upstream and downstream tasks. You declare your Tasks first, and then you declare their dependencies second.

There are two ways of declaring dependencies:

1. Using the `>>` and `<<` (**bitshift**) operators.

**Example**:

`first_task >> second_task >> [third_task, fourth_task]`

2. Or the more explicit set_upstream and set_downstream methods.

```
first_task.set_downstream(second_task)
third_task.set_upstream(second_task)
```

#### Task Instances

An instance of a Task is a specific run of that task for a given DAG. They are also the representation of a Task that has state, representing what stage of the lifecycle it is in.

**The possible states for a Task Instance are**:

- **none**: The Task has not yet been queued for execution (its dependencies are not yet met)

- **scheduled**: The scheduler has determined the Task’s dependencies are met and it should run

- **queued**: The task has been assigned to an Executor and is awaiting a worker

- **running**: The task is running on a worker (or on a local/synchronous executor)

- **success**: The task finished running without errors

- **restarting**: The task was externally requested to restart when it was running

- **failed**: The task had an error during execution and failed to run

- **skipped**: The task was skipped due to branching, LatestOnly, or similar.

- **upstream_failed**: An upstream task failed and the Trigger Rule says we needed it

- **up_for_retry**: The task failed, but has retry attempts left and will be rescheduled.

- **up_for_reschedule**: The task is a Sensor that is in reschedule mode

- **deferred**: The task has been deferred to a trigger

- **removed**: The task has vanished from the DAG since the run started

## Configuration Options

The first time you run Airflow, it will create a file called `airflow.cfg` in your `$AIRFLOW_HOME` directory (`~/airflow` by default). This is in order to make it easy to “play” with airflow configuration.

However, for production case you are advised to generate the configuration using command line:

`airflow config list --defaults`

## Variables

Variables are Airflow’s runtime configuration concept - a general key/value store that is global and can be queried from your tasks, and easily set via Airflow’s user interface, or bulk-uploaded as a JSON file.

To use them, just import and call get on the Variable model:

```
from airflow.sdk import Variable

# Normal call style
foo = Variable.get("foo")

# Auto-deserializes a JSON value
bar = Variable.get("bar", deserialize_json=True)

# Returns the value of default (None) if the variable is not set
baz = Variable.get("baz", default=None)
```
