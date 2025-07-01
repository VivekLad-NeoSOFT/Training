FROM apache/airflow:3.0.2
USER root
RUN apt update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean;

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

COPY deps.txt /requirements.txt
USER airflow
RUN pip install --no-cache-dir -r /requirements.txt