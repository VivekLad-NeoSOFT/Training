from datetime import datetime

from airflow.decorators import dag
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator


@dag(
    start_date=datetime(2024, 1, 1),
    schedule=None,
    catchup=False,
)
def my_dag1():

    submit_job = SparkSubmitOperator(
        task_id="submit_job",
        conn_id="my_spark_conn",
        application="include/scripts/read.py",
        verbose=True,
    )

    submit_job


my_dag1()
