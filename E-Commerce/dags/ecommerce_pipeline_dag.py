from airflow.decorators import dag
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime

# Common Paths
BRONZE_BASE_PATH = '/opt/data_lake/bronze'
SILVER_BASE_PATH = '/opt/data_lake/silver'
GOLD_BASE_PATH = '/opt/data_lake/gold'
PYSPARK_APP_BASE_PATH = '/opt/pyspark_apps'

# DB Connection Info
MYSQL_JDBC_URL = 'jdbc:mysql://mysql_source:3306/ecommerce_daily'
MYSQL_USER = 'admin'
MYSQL_PASSWORD = 'p@ssw0rd'

POSTGRES_JDBC_URL = 'jdbc:postgresql://postgres:5432/ecommerce_warehouse'
POSTGRES_USER = 'admin'
POSTGRES_PASSWORD = 'password'

# Tables
MYSQL_TABLES = ['orders', 'customers', 'products']


@dag(
    dag_id='ecommerce_data_pipeline',
    default_args={'owner': 'airflow', 'depends_on_past': False},
    description='Daily E-commerce Data Pipeline',
    schedule='@daily',
    # schedule=None,
    start_date=datetime(2024, 1, 1),
    tags=['ecommerce', 'medallion']
)
def ecommerce_data_pipeline():
    # Dynamically generate SparkSubmitOperator tasks (Bronze Layer)
    # /opt/bitnami/spark/apps/bronze_ingestion.py jdbc:mysql://mysql_source:3306/ecommerce_daily admin p@ssw0rd customers /opt/data_lake/bronze
    bronze_tasks = []
    for table in MYSQL_TABLES:
        bronze_task = SparkSubmitOperator(
            task_id=f'bronze_ingestion_{table}',
            application=f'{PYSPARK_APP_BASE_PATH}/bronze_ingestion.py',
            conn_id='dp_conn',
            application_args=[
                MYSQL_JDBC_URL,
                MYSQL_USER,
                MYSQL_PASSWORD,
                table,
                BRONZE_BASE_PATH,
            ],
            jars='/opt/bitnami/spark/jars/mysql-connector-j-9.2.0.jar',
            verbose=True,
        )
        bronze_tasks.append(bronze_task)

    silver_task = SparkSubmitOperator(
        task_id='silver_processing',
        application=f'{PYSPARK_APP_BASE_PATH}/silver_processing.py',
        conn_id='dp_conn',
        application_args=[
            BRONZE_BASE_PATH,
            SILVER_BASE_PATH,
            '{{ ds }}'
        ],
        verbose=True,
    )

    gold_task = SparkSubmitOperator(
        task_id='gold_aggregation',
        application=f'{PYSPARK_APP_BASE_PATH}/gold_aggregation.py',
        conn_id='dp_conn',
        application_args=[
            SILVER_BASE_PATH,
            GOLD_BASE_PATH,
            '{{ ds }}'
        ],
        verbose=True,
    )

    load_gold_to_dwh = SparkSubmitOperator(
        task_id='sales_summary_to_postgres_dw',
        application=f'{PYSPARK_APP_BASE_PATH}/load_to_warehouse.py',
        conn_id='dp_conn',
        application_args=[
            f'{GOLD_BASE_PATH}/sales_daily_summary/' + '{{ds}}',
            POSTGRES_JDBC_URL,
            POSTGRES_USER,
            POSTGRES_PASSWORD,
            'facts.fact_sales_summary',
            '{{ ds }}'
        ],
        jars='/opt/bitnami/spark/jars/postgresql-42.7.7.jar',
        verbose=True,
    )

    bronze_tasks >> silver_task >> gold_task >> load_gold_to_dwh


ecommerce_data_pipeline()
