# Apache Spark

## Definition:

Apache Spark is an open source analytics engine used for big data workloads. It can handle both batches as well as real-time analytics and data processing workloads.

Spark provides native bindings for the Java, Scala, Python, and R programming languages.

## Hadoop Vs Spark:

| Hadoop                                                                 | Spark                                                                                                              |
| ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Processing data using MapReduce in Hadoop is slow.                     | Spark processes data faster than MapReduce.                                                                        |
| Performs batch processing of data                                      | Performs both batch processing and real-time processing.                                                           |
| Hadoop has more lines of code, since it is written in java.            | Spark has fewer lines of code as it is implemented in scala.                                                       |
| Hadoop supports Kerberos authentication, which is difficult to manage. | Spark supports authentication via shared secret. It can also run on YARN, leveraging the capabilities of Kerberos. |

## Spark features

- Fast processing
- In-memory computing
- Flexible
- Fault tolerance
- Better analytics

## Components of Spark

- Spark Core - This is the foundational component of Spark, providing the underlying execution engine for the platform.
- Spark SQL - This component enables Spark to work with structured and semi-structured data. It provides a SQL engine and DataFrames for querying and processing data.
- Spark streaming - This component allows Spark to process real-time streaming data.
- Mlib - MLlib provides a library of machine learning algorithms and APIs for building machine learning pipelines on top of Spark.
- GraphX - This component enables graph processing and computation within the Spark ecosystem.
