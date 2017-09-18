#!/usr/bin/env bash

rm -rf ./chanceauto
cp -R /Users/wuhuidong/Documents/Workspace/chanceauto ./
rm -rf ./chanceauto/node_modules
rm -rf ./chanceauto/.idea
rm -rf ./chanceauto/output
mkdir ./chanceauto/output
cp -p ./mysql_util.js ./chanceauto/util/
cp -p ./package.json ./chanceauto/
docker build -t blockchain-03.cn.ibm.com:83/toolchain/webautouiimage --no-cache .