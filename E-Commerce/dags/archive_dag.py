from datetime import datetime, timedelta
import shutil
import os

from airflow.sdk import dag
from airflow.providers.standard.operators.python import PythonOperator


def archive_old_data(
        base_path: str,
        archive_path: str,
        retention_days: int,
        table_name: str,
        include_mysql=True
):
    '''Archives data older than retention_days for a given table.'''
    if include_mysql:
        source_table_path = os.path.join(base_path, 'mysql', table_name)
        archive_table_path = os.path.join(archive_path, 'mysql', table_name)
    else:
        source_table_path = os.path.join(base_path, table_name)
        archive_table_path = os.path.join(archive_path, table_name)

    os.makedirs(archive_table_path, exist_ok=True)
    cutoff_date = datetime.now() - timedelta(days=retention_days)

    for partition_dir in os.listdir(source_table_path):
        partition_path = os.path.join(source_table_path, partition_dir)
        if not os.path.isdir(partition_path):
            continue

        partition_date = datetime.strptime(
            partition_dir.split('/')[-1],
            '%Y-%m-%d'
        )

        # Check if this date is old enough to archive
        if partition_date <= cutoff_date:
            dest_path = os.path.join(archive_table_path, partition_dir)

            # Clean up existing archive path if it exists
            if os.path.exists(dest_path):
                print(f'Removing existing archive folder: {dest_path}')
                shutil.rmtree(dest_path)

            print(f'Archiving {partition_path} -> {dest_path}')
            shutil.move(partition_path, dest_path)

            # Extra cleanup if source still exists
            if os.path.exists(partition_path):
                print(f'Force removing leftover path: {partition_path}')
                shutil.rmtree(partition_path)

    print(f'Archiving completed for {table_name}.')


ARCHIVE_BASE_PATH = '/opt/data_lake/archive'
BRONZE_BASE_PATH = '/opt/data_lake/bronze'
SILVER_BASE_PATH = '/opt/data_lake/silver'
GOLD_BASE_PATH = '/opt/data_lake/gold'
MYSQL_TABLES = ['orders', 'customers', 'products']

RETENTION_DAYS_BRONZE = 0
RETENTION_DAYS_SILVER = 0
RETENTION_DAYS_GOLD = 0


@dag(
    dag_id='ecommerce_data_archival',
    default_args={'owner': 'airflow', 'depends_on_past': False},
    description='Daily Data Archival',
    # schedule='@daily',
    schedule=None,
    start_date=datetime(2024, 1, 1),
    tags=['archive']
)
def ecommerce_data_archival_pipeline():
    bronze_archival_tasks = []
    for table in MYSQL_TABLES:
        bronze_task = PythonOperator(
            task_id=f'archive_bronze_{table}',
            python_callable=archive_old_data,
            op_args=[
                BRONZE_BASE_PATH,
                ARCHIVE_BASE_PATH,
                RETENTION_DAYS_BRONZE,
                table,
                True
            ]
        )
        bronze_archival_tasks.append(bronze_task)

    silver_archival_tasks = []
    for table in ['orders']:
        silver_task = PythonOperator(
            task_id=f'archive_silver_{table}',
            python_callable=archive_old_data,
            op_args=[
                SILVER_BASE_PATH,
                os.path.join(ARCHIVE_BASE_PATH, 'silver'),
                RETENTION_DAYS_SILVER,
                f'{table}_cleaned',
                False,
            ]
        )
        silver_archival_tasks.append(silver_task)

    bronze_archival_tasks


ecommerce_data_archival_pipeline()
