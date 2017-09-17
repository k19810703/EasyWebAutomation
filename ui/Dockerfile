FROM blockchain-03.cn.ibm.com:83/library/node:6.10.0
ADD chanceauto /usr/src/
ADD startapp.sh /
ADD package.json /usr/src/chanceauto/
RUN cd /usr/src \
    && rm -rf input \
    && rm -rf output \
    && mkdir input \
    && mkdir output \
    && npm install
VOLUME ["/usr/src/public/output","/usr/src/public/input"]
EXPOSE 6001
CMD ["bash","startapp.sh"]
