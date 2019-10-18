ARG UBUNTU_VERSION=18.04
ARG PACKAGES=
FROM ubuntu:${UBUNTU_VERSION} as base
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    openssh-server \
    && pip3 --no-cache-dir install --upgrade \
    pip \
    setuptools \
    && ln -s $(which python3) /usr/local/bin/python \
    && mkdir /var/run/sshd \
    && echo 'root:GeekCloud' |chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh 
RUN pip3 install ${PACKAGES}