FROM phusion/baseimage:0.10.0
MAINTAINER Travis Vignon <travis@lookitsatravis.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV NPM_CONFIG_LOGLEVEL info

# System upgrade
RUN apt-get -qqy update && \
    apt-get -qqy upgrade; \
    apt-get -qqy --no-install-recommends install \
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
      libffi-dev \
      tzdata \
      wget; \
    apt-get clean -y; \
    apt-get autoremove -y

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

RUN echo "America/Chicago" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

ONBUILD CMD /bin/bash
