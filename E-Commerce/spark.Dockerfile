FROM bitnami/spark:4.0.0

# Switch to root to create a new user
USER root

# Create a non-root user safely (check if it already exists, avoid UID conflict)
RUN useradd -r -u 1001 -m -s /bin/bash spark || true

# Set USER environment variable so Spark UI shows the name
ENV USER=spark

# Switch to the new user
USER spark
