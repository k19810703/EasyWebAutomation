FROM node:6.10.0
ADD .git-credentials /root/
RUN cd /usr/src/ \
#    && git rm --cache \
#    && git config --global credential.helper cache \
    && git config --global credential.helper store \
    && git clone https://hub.jazz.net/git/ibmcyn/chanceauto
ADD startapp.sh /
ADD mysql_util.js /usr/src/chanceauto/util/
ADD package.json /usr/src/chanceauto/
RUN cd /usr/src/chanceauto \
    && rm /root/.git-credentials \
    && rm -rf input \
    && rm -rf output \
    && mkdir input \
    && mkdir output \
    && npm install
VOLUME ["/usr/src/chanceauto/public/output","/usr/src/chanceauto/public/input"]
EXPOSE 6001
CMD ["bash","startapp.sh"]
