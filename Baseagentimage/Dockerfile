#debug模式
#FROM selenium/standalone-firefox-debug:3.4.0
#普通模式
FROM selenium/standalone-firefox:3.8.1
USER root
RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends fonts-wqy-microhei ttf-wqy-zenhei
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8 \
  && dpkg-reconfigure --frontend noninteractive locales \
  && apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    language-pack-en \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
