#!/bin/bash
export BUILD_ID=172.20.10.5 #必须加
#TOMCAT_PID=`ps aux | grep 'tomcat' | grep -v grep | awk '{print $2}'`
TOMCATTHREAD=`ps aux | grep 'tomcat' | grep -v grep`
if test -z "$TOMCATTHREAD"
then
   echo "TOMCAT NOT START"
else
    THREADLIST=(${TOMCATTHREAD// / })
    PID=${THREADLIST[1]}
    kill -9 $PID
    sleep 6s
    echo "The tomcat process has been killed"
fi
    #将项目拷贝到tomcat目录下
    cp -r /root/workspace/ContinuousIntegration/Shopping /home/wgz/usr/apache-tomcat-7.0.77/webapps
    #登陆数据库删除库导入库, 针对我当前环境，实际情况不要这么做
    mysql="mysql --defaults-extra-file=/root/.my.cnf"
    sq1="drop database if exists db_shopping"
    sq2="source /root/workspace/ContinuousIntegration/db_shopping.sql"
    $mysql -e "$sq1"
    $mysql -e "$sq2"
    export EXEC=/opt/apache-tomcat-7.0.77/bin/startup.sh
    nohup $EXEC start >& /tmp/run.log &
#BUILD_ID=dontKillMe
