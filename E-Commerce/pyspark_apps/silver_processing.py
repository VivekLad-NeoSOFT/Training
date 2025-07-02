from pyspark.sql import SparkSession
from pyspark.sql.functions import col, to_timestamp
from pyspark.sql.types import (
    StructField,
    StructType,
    DoubleType,
    DateType,
    IntegerType,
    StringType,
)
import sys


def process_orders_to_silver(
        spark: SparkSession,
        bronze_base_path: str,
        silver_base_path: str,
        processing_date: str
):
    '''Cleans and transforms raw orders data to the Silver layer.'''
    year, month, day = processing_date.split('-')
    raw_orders_path = f'{bronze_base_path}/mysql/orders/{year}/{month}/{day}'
    silver_orders_path = f'{silver_base_path}/orders_cleaned/{processing_date}'

    print(f'Reading raw orders from: {raw_orders_path}')
    schema = StructType([
        StructField('order_id', IntegerType(), True),
        StructField('customer_id', IntegerType(), True),
        StructField('product_id', IntegerType(), True),
        StructField('order_date', DateType(), True),
        StructField('total_amount', DoubleType(), True),
        StructField('order_status', StringType(), True)
    ])
    try:
        df_orders = spark.read.json(raw_orders_path, schema=schema)
        df_orders.show()

        df_orders_cleaned = df_orders.withColumn('order_date', to_timestamp(col('order_date'))) \
                                     .withColumn('total_amount', col('total_amount').cast('decimal(10,2)'))

        df_orders_silver = df_orders_cleaned.select(
            col('order_id').cast('int'),
            col('customer_id').cast('int'),
            col('product_id').cast('int'),
            col('order_date'),
            col('total_amount'),
            col('order_status'),
        )
        df_orders_silver.show()

        print(f'Writing cleaned orders to: {silver_orders_path}')
        df_orders_silver.write.mode('overwrite').json(silver_orders_path)
        print(f'Successfully processed orders to Silver: {silver_orders_path}')

    except Exception as e:
        print(f'Error processing orders to Silver: {e}')
        raise


if __name__ == '__main__':
    if len(sys.argv) != 4:
        print('Usage: silver_processing.py <bronze_base_path> <silver_base_path> <processing_date YYYY-MM-DD>')
        sys.exit(-1)

    bronze_path = sys.argv[1]
    silver_path = sys.argv[2]
    date_arg = sys.argv[3]

    spark = SparkSession.builder.appName('SilverProcessing').getOrCreate()

    process_orders_to_silver(
        spark,
        bronze_path,
        silver_path,
        date_arg
    )

    spark.stop()
