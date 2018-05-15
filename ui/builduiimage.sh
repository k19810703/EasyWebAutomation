#!/usr/bin/env bash

rm -rf ./chanceauto
git clone ssh://git@blockchain-03.cn.ibm.com:9000/wuhd/chanceauto.git
rm -rf ./chanceauto/node_modules
rm -rf ./chanceauto/.idea
rm -rf ./chanceauto/output
mkdir ./chanceauto/output
docker build -t registry.ng.bluemix.net/mycontainter/webautoui:$1 --no-cache .
bx login -a https://api.ng.bluemix.net --apikey 3LPfOEKqJQ1x98R4UmrlPSRutBDoE7wF7aloP-P5VdFN
bx target --cf
bx cr login

docker push registry.ng.bluemix.net/mycontainter/webautoui:$1
rm -rf ./chanceauto
