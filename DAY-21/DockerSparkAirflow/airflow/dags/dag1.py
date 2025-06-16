# airflow/dags/spark_example.py
from airflow.sdk import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime

with DAG("spark_submit_example",
         start_date=datetime(2023, 1, 1),
         schedule_interval="@once",
         catchup=False) as dag:

    spark_job = SparkSubmitOperator(
        task_id="spark_pi",
        application="/opt/airflow/dags/spark_jobs/pi.py",
        conn_id="spark_default",
        verbose=True
    )
