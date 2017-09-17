#!/usr/bin/env bash

cp -R /Users/wuhuidong/Documents/Workspace/chanceauto ./
rm -rf ./node_modules
cp -p ./mysql_util.js ./chanceauto/util/
cp -p ./package.json ./chanceauto/
docker build -t webautouiimage --no-cache .
