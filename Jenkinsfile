node('Centos'){
    stage('构建'){
        sh '''
		export EXEC=/home/wgz/usr/apache-tomcat-7/bin/startup.sh
               	$EXEC start
		sleep 30
	'''    }
}
