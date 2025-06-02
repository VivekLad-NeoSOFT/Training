# Docker file (`Dockerfile`)

- A Dockerfile is a text file that contains instructions for building a Docker image.
- It specifies the base image, adds files, runs commands, and configures the environment.
- Each instruction in a Dockerfile creates a new layer in the image.
- Docker uses the Dockerfile to build an image when you run the docker build command.

# Docker Compose (`docker-compose.yml`)

- Docker Compose is a tool for defining and running multi-container Docker applications.
- It uses a YAML file (`docker-compose.yml` or `compose.yaml`) to define the services, networks, and volumes that make up your application.
- With a single command (`docker compose up`), you can start all the services defined in the Compose file.
- Docker Compose simplifies the management of complex applications with multiple interconnected containers.

# Docker Image:

- A Docker image is a read-only template used to create Docker containers.
- It contains the application code, libraries, dependencies, and other resources needed to run the application.
- Images are built from Dockerfiles and stored in a registry, such as Docker Hub.
- When you run a Docker container, it starts from a Docker image.
- An image is like a snapshot of your application's environment.
