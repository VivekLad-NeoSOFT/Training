FROM bitnami/spark:4.0.0
USER root
RUN useradd -r -u 1001 -m -s /bin/bash spark || true
ENV USER=spark
USER spark
