#!/bin/bash


export BUILD_ID=172.20.10.5 #必须加
TOMCAT_PID=`ps aux | grep 'tomcat' | grep -v grep | awk '{print $2}'`
if test -z "$TOMCATTHREAD"
then
   echo "TOMCAT NOT START"
else
    kill -9 $TOMCAT_PID
    sleep 6s
    echo 'The tomcat process has been killed'
