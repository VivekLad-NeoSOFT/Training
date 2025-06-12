# Apache Airflow - 2

## Connections

Airflow’s **Connection** object is used for storing credentials and other information necessary for connecting to external services.

Connections may be defined in the following ways:

- in environment variables

- in an external Secrets Backend

- in the Airflow metadata database (using the CLI or web UI)

### Storing connections in environment variables

Airflow connections may be defined in environment variables.

The naming convention is `AIRFLOW_CONN_{CONN_ID}`, all uppercase (note the single underscores surrounding CONN). So if your connection id is `my_prod_db` then the variable name should be `AIRFLOW_CONN_MY_PROD_DB`.

The value can be either JSON or Airflow’s URI format.

#### JSON format

Example:

```
export AIRFLOW_CONN_MY_PROD_DATABASE='{
    "conn_type": "my-conn-type",
    "login": "my-login",
    "password": "my-password",
    "host": "my-host",
    "port": 1234,
    "schema": "my-schema",
    "extra": {
        "param1": "val1",
        "param2": "val2"
    }
}'
```

#### URI format

Example:

```
export AIRFLOW_CONN_MY_PROD_DATABASE='my-conn-type://login:password@host:port/schema?param1=val1&param2=val2'
```

#### Secrets Backend

You can store Airflow connections in external secrets backends like HashiCorp Vault, AWS SSM Parameter Store, and other such services.

## Sensors

Sensors are a special type of Operator that are designed to do exactly one thing - wait for something to occur. It can be time-based, or waiting for a file, or an external event, but all they do is wait until something happens, and then succeed so their downstream tasks can run.

Because they are primarily idle, Sensors have two different modes of running so you can be a bit more efficient about using them:

- `poke` (default): The Sensor takes up a worker slot for its entire runtime

- `reschedule`: The Sensor takes up a worker slot only when it is checking, and sleeps for a set duration between checks

The `poke` and `reschedule` modes can be configured directly when you instantiate the sensor; generally, the trade-off between them is latency. Something that is checking every second should be in `poke` mode, while something that is checking every minute should be in `reschedule` mode.

Much like Operators, Airflow has a large set of pre-built Sensors you can use, both in core Airflow as well as via our providers system.
