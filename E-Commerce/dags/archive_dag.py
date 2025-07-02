# from airflow.sdk import DAG
# from airflow.providers.standard.operators.python import PythonOperator
# from airflow.providers.standard.operators.empty import EmptyOperator
# from datetime import datetime, timedelta
# from helper.archive import archive_old_bronze_data

# # Import your archive function (assuming it's in a place Python can find, e.g., plugins or dags folder)
# # For this example, let's assume archive_old_bronze_data is defined in this file or imported correctly.
# # from your_archive_module import archive_old_bronze_data (if it's in a separate module)

# # Re-define or import the archive_old_bronze_data function here if not imported
# import os
# # (Paste the archive_old_bronze_data function definition from Step 8 here)


# ARCHIVE_BASE_PATH = '/opt/data_lake/archive'
# BRONZE_BASE_PATH = '/opt/data_lake/bronze'
# RETENTION_DAYS_BRONZE = 365  # Archive Bronze data older than 1 year

# default_args_archive = {
#     'owner': 'airflow',
#     'depends_on_past': False,
#     'email_on_failure': False,
#     'start_date': datetime(2024, 1, 1),
#     'retries': 1,
#     'retry_delay': timedelta(minutes=5),
# }

# with DAG(
#     dag_id='data_archival_pipeline',
#     default_args=default_args_archive,
#     description='Monthly Data Archival for Bronze Tier',
#     schedule='@monthly',  # Run monthly
#     catchup=False,
#     tags=['ecommerce', 'archive'],
# ) as archive_dag:

#     start_archive = EmptyOperator(task_id='start_archival')

#     archive_bronze_orders_task = PythonOperator(
#         task_id='archive_bronze_orders',
#         python_callable=archive_old_bronze_data,
#         op_kwargs={
#             'base_bronze_path': BRONZE_BASE_PATH,
#             'archive_bronze_path': os.path.join(ARCHIVE_BASE_PATH, 'bronze'),
#             'retention_days': RETENTION_DAYS_BRONZE,
#             'table_name': 'orders'
#         }
#     )

#     archive_bronze_customers_task = PythonOperator(
#         task_id='archive_bronze_customers',
#         python_callable=archive_old_bronze_data,
#         op_kwargs={
#             'base_bronze_path': BRONZE_BASE_PATH,
#             'archive_bronze_path': os.path.join(ARCHIVE_BASE_PATH, 'bronze'),
#             'retention_days': RETENTION_DAYS_BRONZE,
#             'table_name': 'customers'
#         }
#     )

#     # Add tasks for other tables or tiers (Silver, Gold) if needed

#     end_archive = EmptyOperator(task_id='end_archival')

#     start_archive >> [archive_bronze_orders_task,
#                       archive_bronze_customers_task] >> end_archive
