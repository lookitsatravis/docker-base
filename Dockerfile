FROM phusion/baseimage:0.9.18
MAINTAINER Travis Vignon <travis@lookitsatravis.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 5.5.0

# System upgrade
RUN apt-get -qq update && \
    apt-get -qqy upgrade; \
    apt-get -qqy install \
      build-essential \
      software-properties-common \
      openssl \
      ca-certificates \
      git \
      unzip \
      imagemagick \
      curl \
      bison \
      zlib1g-dev \
      libgdbm-dev \
      libreadline6-dev \
      libncurses5-dev \
      libyaml-dev \
      libssl-dev \
      libxslt-dev \
      libxml2-dev \
      libffi-dev; \
    apt-get clean -y; \
    apt-get autoremove -y

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

RUN echo "America/Chicago" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

ONBUILD CMD /bin/bash
