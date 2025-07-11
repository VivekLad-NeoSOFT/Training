from typing import Any
from pyspark.sql import SparkSession
import sys
from datetime import datetime


def ingest_table_to_bronze(
        spark: SparkSession,
        jdbc_url: str,
        db_con_props: dict[str, Any],
        table_name: str,
        file_path: str
):
    '''Ingests a MySQL table to the Bronze layer, partitioned by ingestion date.'''
    print(f'Starting ingestion for table: {table_name}')
    try:
        df = spark.read.jdbc(
            url=jdbc_url,
            table=table_name,
            properties=db_con_props
        )
        today = datetime.today()
        year = today.strftime('%Y')
        month = today.strftime('%m')
        day = today.strftime('%d')

        output_file = f'{file_path}/mysql/{table_name}/{year}-{month}-{day}'
        df.show()
        df.write.mode('overwrite').format('json').save(output_file)
        print(f'Successfully ingested {table_name} to {output_file}')

    except Exception as e:
        print(f'Error ingesting table {table_name}: {e}')


if __name__ == '__main__':
    if len(sys.argv) != 6:
        print('Usage: bronze_ingestion.py <jdbc_url> <user> <password> <table_name> <file_path>')
        sys.exit(-1)

    jdbc_url = sys.argv[1]
    user_arg = sys.argv[2]
    password = sys.argv[3]
    table_name = sys.argv[4]
    path = sys.argv[5]

    spark = SparkSession.builder \
        .appName(f'BronzeIngestion_{table_name}') \
        .getOrCreate()

    db_con_props = {
        'user': user_arg,
        'password': password,
        'driver': 'com.mysql.cj.jdbc.Driver'
    }

    ingest_table_to_bronze(
        spark,
        jdbc_url,
        db_con_props,
        table_name,
        path
    )

    spark.stop()
