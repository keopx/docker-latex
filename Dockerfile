FROM debian:stretch

MAINTAINER keopx <keopx@keopx.net>

# Set frontend. We'll clean this later on!
ENV DEBIAN_FRONTEND noninteractive

# Locale
ENV LOCALE es_ES.UTF-8

ARG UID=1000
ARG GID=1000
ARG UNAME=keopx 

# Set repositories
RUN \
  echo "deb http://ftp.de.debian.org/debian/ stretch main non-free contrib\n" > /etc/apt/sources.list && \
  echo "deb-src http://ftp.de.debian.org/debian/ stretch main non-free contrib\n" >> /etc/apt/sources.list && \
  echo "deb http://security.debian.org/ stretch/updates main contrib non-free\n" >> /etc/apt/sources.list && \
  echo "deb-src http://security.debian.org/ stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
  # Update repositories cache and distribution
  apt-get -qq update && apt-get -qqy upgrade && \  
  apt-get -yqq install \
  curl \
  wget \
  bash-completion \
  sudo \
  texlive-full && \
  apt-get -q autoclean && \
  rm -rf /var/lib/apt/lists/*

# add local user
RUN \
  groupadd -g $UID $GID ; \
  useradd -m -u $UID -g $GID -s /bin/bash $UNAME ; \
  usermod -aG sudo $UNAME; \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers; \
  echo ". /usr/share/bash-completion/bash_completion" >> /home/$UNAME/.bashrc && echo "alias ll='ls -lahs'" >> /home/$UNAME/.bashrc ; \
  echo ". /usr/share/bash-completion/bash_completion" >> ~/.bashrc && echo "alias ll='ls -lahs'" >> ~/.bashrc

  USER keopx

WORKDIR /data
VOLUME ["/data"]
