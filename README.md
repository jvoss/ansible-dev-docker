# Ansible Development Docker
![Docker image](https://github.com/jvoss/ansible-dev-docker/workflows/Docker%20image/badge.svg)

The purpose of this docker container is to create containerized and repeatable 
Ansible environments for developing playbooks. Everytime the image is built, a 
clean, fully updated environment is created.

This image is built on Ubuntu for specifically for interactive useability while
developing playbooks.

## Building an image

1. Clone to local machine
   
    `git clone https://github.com/jvoss/ansible-dev-docker.git`

2. Change directory

    `cd ansible-dev-docker`

3. Build the image
   
    `docker build -t ansible-dev-docker .`

## Usage

This container is intended to have your ansible workspace mounted to
`/ansible`. When the image is started interactively, the user is presented
at a bash shell in this working directory.

Containerized environments can be started and named using the following
example:

`docker run -it -v /local-path/to/playbooks:/ansible --name ansible-dev1 ansible-dev-docker`
