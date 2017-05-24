FROM node:6.10.0
RUN mkdir /root/.ssh
ADD ssh_config /etc/ssh/
ADD id_rsa /root/.ssh/
ADD id_rsa.pub /root/.ssh/
RUN cd /usr/src/ \
    && git clone git@github.ibm.com:caiyn/chanceauto.git
ADD startapp.sh /
ADD mysql_util.js /usr/src/chanceauto/util/
ADD package.json /usr/src/chanceauto/
RUN cd /usr/src/chanceauto \
    && rm -rf input \
    && rm -rf output \
    && mkdir input \
    && mkdir output \
    && npm install
VOLUME ["/usr/src/chanceauto/public/output","/usr/src/chanceauto/public/input"]
EXPOSE 6001
CMD ["bash","startapp.sh"]
