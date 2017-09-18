FROM blockchain-03.cn.ibm.com:83/library/node:6.10.0
ADD chanceauto /usr/src/
ADD startapp.sh /
RUN cd /usr/src \
    && npm install
VOLUME ["/usr/src/public/output","/usr/src/public/input"]
EXPOSE 6001
CMD ["bash","startapp.sh"]
