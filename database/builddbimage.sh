#!/usr/bin/env bash

rm -rf ./chanceauto
git clone -b $1 ssh://git@blockchain-03.cn.ibm.com:9000/wuhd/chanceauto.git
cd ./chanceauto/DB
docker build -t blockchain-03.cn.ibm.com:83/library/webautodb:$1 --no-cache .
cd ..
cd ..
rm -rf ./chanceauto
