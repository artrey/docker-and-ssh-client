ARG DOCKER_IMAGE=docker
ARG DOCKER_VERSION=stable
FROM ${DOCKER_IMAGE}:${DOCKER_VERSION}

ARG DOCKER_IMAGE
ARG DOCKER_VERSION

RUN apk add --no-cache openssh-client

LABEL \
  maintainer="Alexander Ivanov <oz.sasha.ivanov@gmail.com>" \
  description="This docker image installs ssh client (ssh agent) on top of the docker image." \
  licenses="MIT" \
  source="https://github.com/artrey/docker-and-ssh-client" \
  title="Docker image with installed ssh client" \
  version="${DOCKER_IMAGE}:${DOCKER_VERSION} with ssh client"
