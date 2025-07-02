from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count, date_format
from pyspark.sql.types import (
    StructField,
    StructType,
    StringType,
    IntegerType,
    DateType,
    DoubleType,
)
import sys


def create_daily_sales_summary(
        spark: SparkSession,
        silver_base_path: str,
        gold_base_path: str,
        processing_date: str
):
    '''Aggregates daily sales summary from Silver data.'''
    silver_orders_path = f'{silver_base_path}/orders_cleaned/{processing_date}'
    gold_sales_summary_path = f'{gold_base_path}/sales_daily_summary/{processing_date}'

    schema = StructType([
        StructField('order_id', IntegerType(), True),
        StructField('customer_id', IntegerType(), True),
        StructField('product_id', IntegerType(), True),
        StructField('order_date', DateType(), True),
        StructField('total_amount', DoubleType(), True),
        StructField('order_status', StringType(), True)
    ])
    print(f'Reading cleaned orders from: {silver_orders_path}')
    try:
        df_orders_silver = spark.read.json(silver_orders_path, schema=schema)
        df_orders_silver.show()

        # Filter for 'completed' or 'shipped' orders for sales summary
        df_sales = df_orders_silver.filter(
            col('order_status').isin(['delivered', 'shipped']))

        df_sales.show()

        df_daily_summary = df_sales.groupBy(date_format('order_date', 'yyyy-MM-dd').alias('sale_date')) \
            .agg(
                sum('total_amount').alias('total_revenue'),
                count('order_id').alias('total_orders')
        ) \
            .withColumn('average_order_value', col('total_revenue') / col('total_orders'))

        print(f'Writing daily sales summary to: {gold_sales_summary_path}')
        df_daily_summary.write \
            .mode('overwrite') \
            .json(gold_sales_summary_path)

        print(
            f'Successfully created daily sales summary: {gold_sales_summary_path}'
        )

    except Exception as e:
        print(f'Error creating daily sales summary: {e}')
    # Add other gold table creation functions, e.g., customer segmentation, product performance


if __name__ == '__main__':
    if len(sys.argv) != 4:
        print('Usage: gold_aggregation.py <silver_base_path> <gold_base_path> <processing_date YYYY-MM-DD>')
        sys.exit(-1)

    silver_path = sys.argv[1]  # e.g., /opt/data_lake/silver
    gold_path = sys.argv[2]   # e.g., /opt/data_lake/gold
    date = sys.argv[3]        # e.g., {{ ds }} from Airflow

    spark = SparkSession.builder.appName('GoldAggregation').getOrCreate()

    create_daily_sales_summary(
        spark,
        silver_path,
        gold_path,
        date
    )
    # Call other gold aggregation functions

    spark.stop()
