#!/bin/sh
while [ ! -f "/stop" ]
do
   sleep 15
   echo "start test"
   java -jar /usr/src/webauto.jar /usr/src/config/automation.ini cloud_agent1 Linux Firefox Local Auto
   echo "end test"
done