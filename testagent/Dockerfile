#debug模式
#FROM selenium/standalone-firefox-debug:2.52.0
#普通模式
FROM selenium/standalone-firefox:2.52.0
USER root
RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends fonts-wqy-microhei ttf-wqy-zenhei
ADD webautotest /usr/src/
RUN cd /usr/src/ \
    && mkdir input \
    && mkdir output
VOLUME ["/usr/src/output","/usr/src/input"]
