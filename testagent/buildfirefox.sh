#!/usr/bin/env bash
rm -rf AutoTest
rm -rf temp
git clone -b $1_2.53.1 ssh://git@blockchain-03.cn.ibm.com:9000/wuhd/AutoTest.git
mkdir temp
cp ./webautotest/* ./temp/
cp ./AutoTest/src/main/resources/Sql.properties ./temp/
docker run -it --rm --name my-maven-project -v $(pwd)/AutoTest:/usr/src/mymaven -w /usr/src/mymaven blockchain-03.cn.ibm.com:83/library/maven:3.3.9-jdk-8-alpine mvn clean install
cp ./AutoTest/target/AutoTest-1.0.jar ./temp/webauto.jar
docker build -t blockchain-03.cn.ibm.com:83/library/webautofirefox:$1-2.53.1 .
rm -rf AutoTest
rm -rf temp
