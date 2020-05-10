node('Centos'){
    stage('构建'){
        sh '''
		export EXEC=/home/wgz/usr/apache-tomcat-7/bin/catalina.sh
                $EXEC stop
                sleep 5
                JENKINS_NODE_COOKIE=dontKillMe nohup $EXEC start &
		sleep 30
	'''    }
}
