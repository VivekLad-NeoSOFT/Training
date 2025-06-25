FROM bitnami/spark:4.0.0

# Switch to root to create a new user
USER root
RUN apt update
# Create a non-root user safely (check if it already exists, avoid UID conflict)
RUN useradd -r -u 1001 -m -s /bin/bash spark || true
RUN mkdir -p /opt/ecommerce_data_lake
RUN chown spark:spark /opt/ecommerce_data_lake 
# RUN useradd -r -u 1001 -m -s /bin/bash spark || true && \
#     apt-get update && apt-get install -y sudo && \
#     usermod -aG sudo spark

# Set USER environment variable so Spark UI shows the name
# ENV USER=spark

# Switch to the new user
USER spark
