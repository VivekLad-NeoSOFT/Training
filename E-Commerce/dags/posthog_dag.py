from airflow import DAG
from datetime import datetime, timedelta
from airflow.providers.standard.operators.python import PythonOperator
from posthog import Posthog
from pyspark.sql import SparkSession

posthog = Posthog(
    'phc_hpzeVSaCL2AkaZ6Iksr7oQtWeAERiAwUnhguGlX8d0o',
    host='https://us.i.posthog.com'
)


def send_posthog_events(gold_path: str = None, **kwargs):
    if gold_path is None:
        processing_date = kwargs['ds']
        gold_path = f'/opt/data_lake/gold/sales_daily_summary/{processing_date}'

    spark = SparkSession.builder.appName('GoldToPostHog').getOrCreate()

    try:
        posthog.capture(
            distinct_id='debug',
            event='airflow_test_event',
            properties={'test': 'checking UI visibility'}
        )

        df = spark.read.json(gold_path)
        print(f'Read gold data from {gold_path}')

        for row in df.collect():
            print(f'Processing row: {row}')
            props = {
                'sale_date': row['sale_date'],
                'total_revenue': row['total_revenue'],
                'total_orders': row['total_orders'],
                'average_order_value': row['average_order_value'],
                'source': 'gold_layer'
            }
            posthog.capture(
                distinct_id=row['sale_date'],
                event='product_daily_performance',
                properties=props
            )
            print(f'Event sent for sale_date: {row['sale_date']}')
    except Exception as e:
        print(f'Error sending events: {str(e)}')
        raise
    finally:
        spark.stop()


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 6, 6),
    'retry_delay': timedelta(minutes=5),
}


def get_gold_path(**context):
    processing_date = context['ds']
    return f'/opt/data_lake/gold/sales_daily_summary/{processing_date}'


with DAG(
    'gold_to_posthog_pipeline',
    default_args=default_args,
    # schedule='@daily',
    # schedule='None',
    catchup=False,
    tags=['analytics', 'gold', 'posthog']
) as dag:

    get_gold_path_task = PythonOperator(
        task_id='get_gold_path',
        python_callable=get_gold_path,
    )

    send_posthog_event = PythonOperator(
        task_id='send_posthog_event',
        python_callable=send_posthog_events,
    )

    get_gold_path_task >> send_posthog_event
