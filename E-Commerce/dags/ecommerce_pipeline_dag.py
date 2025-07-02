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

POSTGRES_JDBC_URL = 'jdbc:postgresql://postgres_dw:5432/ecommerce_warehouse'
POSTGRES_USER = 'admin'
POSTGRES_PASSWORD = 'p@ssw0rd'

# Tables
MYSQL_TABLES = ['orders', 'customers', 'products']


@dag(
    dag_id='ecommerce_data_pipeline',
    default_args={'owner': 'airflow', 'depends_on_past': False},
    description='Daily E-commerce Data Pipeline',
    # schedule='@daily',
    schedule=None,
    start_date=datetime(2024, 1, 1),
    tags=['ecommerce', 'medallion']
)
def ecommerce_data_pipeline():
    # Dynamically generate SparkSubmitOperator tasks (Bronze Layer)
    # /opt/bitnami/spark/apps/bronze_ingestion.py jdbc:mysql://mysql_source:3306/ecommerce_daily admin p@ssw0rd customers /opt/data_lake/bronze
    bronze_tasks = []
    for table in MYSQL_TABLES:
        bronze_task = SparkSubmitOperator(
            task_id=f'ingest_{table}_to_bronze',
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

    bronze_tasks


ecommerce_data_pipeline()
