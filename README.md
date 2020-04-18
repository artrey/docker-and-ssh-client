# Docker with ssh client

[![Docker Pulls](https://img.shields.io/docker/pulls/artrey/docker-and-ssh-client.svg)](https://hub.docker.com/r/artrey/docker-and-ssh-client/)
[![GitHub issues](https://img.shields.io/github/issues/artrey/docker-and-ssh-client.svg)](https://github.com/artrey/docker-and-ssh-client/issues)
[![GitHub stars](https://img.shields.io/github/stars/artrey/docker-and-ssh-client.svg?style=social&label=Star)](https://github.com/artrey/docker-and-ssh-client)

This docker image installs ssh client (ssh agent) on top of the `docker` image.
This is very useful for CI pipelines, which leverage "Docker in Docker".

## Usage instructions for GitLab CI

You may use it like this in your `.gitlab-ci.yml` file.

```yaml
image: artrey/docker-and-ssh-client

services:
  - docker:dind

before_script:
  - docker info
  - eval "$(ssh-agent -s)"
  - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
  - mkdir -p ~/.ssh
  - chmod 700 ~/.ssh
  - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

some_action:
  stage: deploy
  script:
    - ssh -o StrictHostKeyChecking=no "$SERVER_USER"@"$SERVER_ADDRESS" '<action on server>'
```
