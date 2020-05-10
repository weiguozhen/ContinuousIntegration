node('Centos'){
    stage('构建'){
        //把代码从git上面clone下来
        checkout scm
    }
    stage('部署'){
        //执行运行脚本 run.sh
        sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'
	//sh '(source /etc/profile;source ~/.bash_profile;sh /opt/apache-tomcat-7.0.77/bin/startup.sh)'
	sh 'JENKINS_NODE_COOKIE=dontKillMe nohup sh /opt/apache-tomcat-7.0.77/bin/startup.sh >/tmp/run.log 2>&1 &'
    }
}
