#!/bin/sh
while [ ! -f "/stop" ]
do
   sleep 15
   echo "start test"
   java -jar /usr/src/webauto.jar /usr/src/automation.ini ${agentname} Linux ${testbrowser} Local Auto
   echo "end test"
done