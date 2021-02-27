# Ansible Development Docker
![Docker image](https://github.com/jvoss/ansible-dev-docker/workflows/Docker%20image/badge.svg)

The purpose of this docker container is to create containerized and repeatable 
Ansible environments for developing playbooks. Everytime the image is built, a 
clean environment is created.

This image is built on Alpine Linux to minimize size while developing playbooks.

## Using Docker Hub

1. Pull from Docker Hub

    `docker pull jpvoss/ansible-dev-docker:3.0.0`

    Use tag to specify desired version of Ansible. 
    See [Docker Hub Tags](https://hub.docker.com/r/jpvoss/ansible-dev-docker/tags)
    for details.

## Building an image

1. Clone to local machine
   
    `git clone https://github.com/jvoss/ansible-dev-docker.git`

2. Change directory

    `cd ansible-dev-docker`

3. Build the image

    - Option A: With the latest version of Ansible:
   
        `docker build -t ansible-dev-docker .`

    - Option B: With a specific version of Ansible:

        `docker build -t ansible-dev-docker . --build-arg ANSIBLE_VERSION=2.9.18`

## Usage

This container is intended to have your ansible workspace mounted to
`/ansible`. When the image is started interactively, the user is presented
at a bash shell in this working directory.

Ephemeral environments can be started using the following example:

`docker run -it -rm -v /local-path/to/playbooks:/ansible ansible-dev-docker`
