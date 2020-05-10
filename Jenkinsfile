node('Centos'){
    stage('构建'){
        //把代码从git上面clone下来
        checkout scm
    }
    stage('部署'){
        //执行运行脚本 run.sh
        sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'
	sh '''
		export EXEC=/opt/apache-tomcat-7.0.77/bin/catalina.sh
                $EXEC stop
                sleep 5
                JENKINS_NODE_COOKIE=dontKillMe $EXEC start
	'''
    }
}
