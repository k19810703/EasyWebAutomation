FROM ibmcom/ibmnode:6
ADD chanceauto /usr/src/
ADD startapp.sh /
RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends libxml2 \
    && cd /usr/src \
    && npm install
VOLUME ["/usr/src/public/output","/usr/src/public/input"]
EXPOSE 6001
CMD ["bash","startapp.sh"]
