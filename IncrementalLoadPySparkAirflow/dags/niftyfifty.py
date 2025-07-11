from datetime import datetime
from typing import Any

from nsepython import nsefetch
from airflow.decorators import dag, task
from pyspark.sql import SparkSession
from pyspark.sql.types import (
    StructType,
    StructField,
    StringType,
    DoubleType,
    TimestampType,
    DateType
)


@dag(
    start_date=datetime(2024, 1, 1),
    # schedule=timedelta(minutes=20),
    schedule=None,
    catchup=False,
    tags=['nifty50']
)
def niftyfifty_dag():

    @task.pyspark(conn_id='spark_conn', multiple_outputs=True)
    def extract() -> dict[str, str | list[dict]]:
        URL = 'https://www.nseindia.com/api/equity-stockIndices?index=NIFTY%2050'
        try:
            data = nsefetch(URL)
            timestamp = data.get('timestamp', '')
            chart = data.get('data', [])
            return {'timestamp': timestamp, 'data': chart}
        except Exception as e:
            print(f'Error fetching data: {e}')
            return {'timestamp': '', 'data': []}

    @task.pyspark(conn_id='spark_conn')
    def transform(data: dict[str, Any]):
        flatten = []
        if data.get('timestamp') and data.get('data'):
            for row in data.get('data', {}):
                if row.get('priority') == 0:
                    new_row = {}
                    new_row['symbol'] = row.get('symbol')
                    new_row['identifier'] = row.get('identifier')
                    new_row['open'] = float(row.get('open'))
                    new_row['dayHigh'] = float(row.get('dayHigh'))
                    new_row['dayLow'] = float(row.get('dayLow'))
                    new_row['lastPrice'] = float(row.get('lastPrice'))
                    new_row['previousClose'] = float(row.get('previousClose'))
                    new_row['change'] = float(row.get('change'))
                    new_row['pChange'] = float(row.get('pChange'))
                    new_row['totalTradedVolume'] = float(
                        row.get('totalTradedVolume')
                    )
                    new_row['totalTradedValue'] = float(
                        row.get('totalTradedValue')
                    )
                    new_row['yearHigh'] = float(row.get('yearHigh'))
                    new_row['yearLow'] = float(row.get('yearLow'))
                    new_row['companyName'] = row.get('meta').get('companyName')
                    new_row['industry'] = row.get('meta').get('industry')
                    new_row['listingDate'] = datetime.strptime(
                        row.get('meta').get('listingDate'),
                        '%Y-%m-%d'
                    )
                    new_row['timestamp'] = datetime.strptime(
                        data.get('timestamp'),
                        '%d-%b-%Y %H:%M:%S'
                    )
                    new_row['extracted_at'] = datetime.now()
                    flatten.append(new_row)
        return flatten

    @task.pyspark(conn_id='spark_conn')
    def load(arr: list[dict], spark: SparkSession):
        spark = SparkSession.builder \
            .master("spark://spark-master:7077") \
            .config("spark.jars", "/usr/local/airflow/jars/mysql-connector-java-8.0.28.jar") \
            .getOrCreate()

        schema = StructType([
            StructField('symbol', StringType(), True),
            StructField('identifier', StringType(), True),
            StructField('open', DoubleType(), True),
            StructField('dayHigh', DoubleType(), True),
            StructField('dayLow', DoubleType(), True),
            StructField('lastPrice', DoubleType(), True),
            StructField('previousClose', DoubleType(), True),
            StructField('change', DoubleType(), True),
            StructField('pChange', DoubleType(), True),
            StructField('totalTradedVolume', DoubleType(), True),
            StructField('totalTradedValue', DoubleType(), True),
            StructField('yearHigh', DoubleType(), True),
            StructField('yearLow', DoubleType(), True),
            StructField('companyName', StringType(), True),
            StructField('industry', StringType(), True),
            StructField('listingDate', DateType(), True),
            StructField(
                'timestamp',
                TimestampType(),
                True
            ),
            StructField('extracted_at', TimestampType(), True)
        ])

        df = spark.createDataFrame(arr, schema)
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        output_path = f'file:///tmp/nifty_50_{timestamp}.parquet'
        df.write.mode('overwrite').parquet(output_path)
        print('Data loaded successfully into parquet.')

        # df.write\
        #     .format('jdbc') \
        #     .option('url', 'jdbc:mysql://mysql-source:3308/sourcedb') \
        #     .option('driver', 'com.mysql.cj.jdbc.Driver') \
        #     .option('dbtable', 'niftfifty') \
        #     .option('user', 'root') \
        #     .option('password', 'p@ssw0rd') \
        #     .mode('overwrite') \
        #     .save()

        df.write.jdbc(
            url='jdbc:mysql://mysql-source:3308/sourcedb',
            table='niftfifty',
            mode='append',
            properties={
                'user': 'admin',
                'password': 'p@ssw0rd',
                'driver': 'com.mysql.cj.jdbc.Driver'
            }
        )

    data = extract()
    flatten_arr = transform(data)
    load(flatten_arr)


niftyfifty_dag()
