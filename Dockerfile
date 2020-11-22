FROM ubuntu:latest

LABEL maintainer="jvoss@onvox.net"
LABEL description="Containerized Ansible installations for development"

# Disable prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Update
RUN apt update && apt-get upgrade --yes

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       locales \
       libyaml-dev \
       python3-setuptools \
       python3-pip \
       python3-yaml \
       software-properties-common \
       rsyslog systemd systemd-cron sudo iproute2 \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install Ansible
ENV pip_packages "ansible paramiko"
RUN pip3 install $pip_packages

# Initialize workspace
RUN useradd -ms /bin/bash -d /ansible ansible

USER ansible
WORKDIR /ansible
