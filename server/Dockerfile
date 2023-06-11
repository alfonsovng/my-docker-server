FROM ubuntu:22.04

RUN yes | unminimize && \
    apt-get install -y sudo openssh-server iproute2 iputils-ping nano man-db rsyslog dialog apt-utils bash-completion && \
    service ssh start && \
    printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d && \
    ln -s /etc/init.d/named /etc/init.d/bind9 && \
    # promt en vermell (01;31m)
    echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "'  >> /root/.bash_profile && \
    echo "RUNLEVEL=1" >> /etc/environment

ARG DEFAULT_USER
ARG DEFAULT_PASSWORD

RUN useradd -rm -d /home/$DEFAULT_USER -s /bin/bash -g sudo -u 1001 -p $DEFAULT_PASSWORD $DEFAULT_USER && \
    # promt en lila (01;35m)
    echo 'export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "'  >> /home/$DEFAULT_USER/.bash_profile
