import sys
from typing import Any

from pyspark.sql import SparkSession


def load_gold_table_to_postgres(
        spark: SparkSession,
        gold_data_Path: str,
        jdbc_url_psql: str,
        connection_properties_psql: dict[str, Any],
        table: str
):
    '''Loads a Gold Parquet table to a PostgreSQL table.'''
    print(f'Reading Gold data from: {gold_data_Path}')

    try:
        df_gold = spark.read.json(gold_data_Path)
        print(f'Writing data to PostgreSQL table: {table}')

        df_gold.write.mode('overwrite').jdbc(
            url=jdbc_url_psql,
            table=table,
            properties=connection_properties_psql
        )
        print(f'Successfully loaded data to {table}')

    except Exception as e:
        print(
            f'Error loading data to PostgreSQL table {table}: {e}')
        raise


if __name__ == '__main__':
    if len(sys.argv) != 7:
        print('Usage: load_to_warehouse.py <gold_data_path> <jdbc_url_psql> <user> <password> <target_schema.target_table> <processing_date YYYY-MM-DD>')
        sys.exit(-1)

    gold_data_path = sys.argv[1]

    jdbc_url_psql = sys.argv[2]
    user_psql = sys.argv[3]
    password_psql = sys.argv[4]
    table = sys.argv[5]
    date = sys.argv[6]

    spark_session = SparkSession.builder \
        .appName(f'LoadToWarehouse_{table}') \
        .getOrCreate()

    connection_properties_psql = {
        'user': user_psql,
        'password': password_psql,
        'driver': 'org.postgresql.Driver'
    }

    load_gold_table_to_postgres(
        spark_session,
        gold_data_path,
        jdbc_url_psql,
        connection_properties_psql,
        table
    )

    spark_session.stop()
