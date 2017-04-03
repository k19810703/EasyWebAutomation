FROM selenium/standalone-firefox-debug:2.52.0
RUN apt-get update \
 && apt-get install -y --force-yes --no-install-recommends fonts-wqy-microhei ttf-wqy-zenhei
ADD webautotest /usr/src/
VOLUME ["/usr/src/output","/usr/src/input"]
