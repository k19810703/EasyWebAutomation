#!/usr/bin/env bash

rm -rf ./chanceauto
git clone ssh://git@blockchain-03.cn.ibm.com:9000/wuhd/chanceauto.git
rm -rf ./chanceauto/node_modules
rm -rf ./chanceauto/.idea
rm -rf ./chanceauto/output
mkdir ./chanceauto/output
docker build -t blockchain-03.cn.ibm.com:83/library/webautoui:$1 --no-cache .
docker push blockchain-03.cn.ibm.com:83/library/webautoui:$1
rm -rf ./chanceauto
