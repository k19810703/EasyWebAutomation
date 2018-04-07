#debug模式
#FROM selenium/standalone-firefox-debug:2.53.0
#普通模式
FROM selenium/standalone-firefox-debug:3.8.1
ADD ./webautotest /usr/src/
EXPOSE 5900
USER root
VOLUME ["/usr/src/output","/usr/src/input","/usr/src/download"]
