ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}

LABEL maintainer="jvoss@onvox.net"
LABEL description="Containerized Ansible control node for development"

# Optional Ansible version to install (otherwise latest)
# example: docker build . --build-arg ANSIBLE_VERSION=2.10.7
ARG ANSIBLE_VERSION

# Install tools, dependencies, Ansible
# Use single layer to squash build size
RUN apk add --no-cache bash dumb-init git python3 py3-pip su-exec;\
    apk add --no-cache --virtual .build-dependencies \
      cargo \
      gcc \
      libffi-dev \
      make \
      openssl-dev \
      musl-dev \
      python3-dev \
      rust ; \
    if [ -z "$ANSIBLE_VERSION" ] ; \
      then \
        pip3 install ansible; \
      else \
        pip3 install ansible==`echo ${ANSIBLE_VERSION} | sed 's/v//g'` ; \
    fi && pip3 install paramiko; \
    apk del --no-cache --purge .build-dependencies; \
    rm -rf /var/cache/apk/* && rm -rf /root/.cache && rm -rf /root/.cargo; \
    adduser -s /bin/bash -D -h /home/ansible ansible; \
    mkdir /ansible && chown ansible:ansible /ansible 

WORKDIR /ansible

ENTRYPOINT ["/usr/bin/dumb-init", "su-exec",  "ansible"]
CMD ["/bin/bash"]
