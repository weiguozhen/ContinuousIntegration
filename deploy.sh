#!/bin/bash
#将项目拷贝到tomcat目录下
cp -r /root/workspace/ContinuousIntegration/Shopping /opt/apache-tomcat-7.0.77/webapps
#登陆数据库删除库导入库
mysql="mysql --defaults-extra-file=/root/.my.cnf"
sq1="drop database if exists db_shopping"
sq2="source /home/wgz/db_shopping.sql"
$mysql -e "$sq1"
$mysql -e "$sq2"
#关闭tomcat服务
shutdown.sh
#开启tomcat服务
startup.sh