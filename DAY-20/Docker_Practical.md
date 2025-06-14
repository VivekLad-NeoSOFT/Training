# Containerize an application

## Prerequisites

- Latest version of Docker.
- Git client
- IDE or a text editor to edit files.

## Get the app

- Clone the [getting-started-app repository](https://github.com/docker/getting-started-app/tree/main) using the following command:

  `git clone https://github.com/docker/getting-started-app.git`

## Build the app's image

To build the image, you'll need to use a Dockerfile. A Dockerfile is simply a text-based file with no file extension that contains a script of instructions. Docker uses this script to build a container image.

1. In the `getting-started-app `directory, the same location as the `package.json` file, create a file named `Dockerfile` with the following contents:

```
# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "src/index.js"]
EXPOSE 3000
```

2. Build the image using the following command:

`docker build -t getting-started .`

## Start an app container

1. Run your container using the `docker run` command and specify the name of the image.

`docker run -d -p 127.0.0.1:3000:3000 getting-started`
