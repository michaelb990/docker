# Based off of evarga/jenkins-slave

# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu:10.04
MAINTAINER Michael Brown <michael.brown@socrata.com>

# Add environment variables to make internet connections work.
ENV build_proxy http://proxy.aws-us-west-2-infrastructure.socrata.net:3128
# ENV build_proxy_env "export http_proxy=${build_proxy} https_proxy=${build_proxy} ftp_proxy=${build_proxy}"

# Make sure the package repository is up to date, upgrade out of date packages.
# Change repositories to point to old-releases as lucid is EOL
# RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN eval ${build_proxy_env} && \
    apt-get update && \
    apt-get -y upgrade

# Install software dependencies.
RUN eval ${build_proxy_env} && \
    apt-get install -y python-software-properties && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y openssh-server git-core

# Configure SSH server.
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Add this to enable JDK 7 on lucid.
ADD jdk7.tar.gz /usr/lib/jvm
RUN mv /usr/lib/jvm/jdk1.7* /usr/lib/jvm/jdk1.7 && \
    ln -fs /usr/lib/jvm/jdk1.7/bin/java /usr/bin/java

# Add user jenkins to the image and set password.
RUN useradd jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /home/jenkins && \
    chown jenkins:jenkins /home/jenkins && \
    chsh -s /bin/bash jenkins

# Ruby-specific dependencies (TODO: pull out into language specific slaves)
RUN eval ${build_proxy_env} && \
    apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
    libncurses5-dev libffi-dev libgdbm3 libgdbm-dev wget curl
ADD rbenv-install.sh /home/jenkins/rbenv-install.sh
RUN eval ${build_proxy_env} && \
    sudo -Eu jenkins /home/jenkins/rbenv-install.sh

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
