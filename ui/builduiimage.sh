#!/usr/bin/env bash

rm -rf ./chanceauto
cp -R /Users/wuhuidong/Documents/Workspace/chanceauto ./
rm -rf ./chanceauto/node_modules
rm -rf ./chanceauto/.idea
rm -rf ./chanceauto/output
mkdir ./chanceauto/output
docker build -t blockchain-03.cn.ibm.com:83/toolchain/chanceautouiimage --no-cache .
