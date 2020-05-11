node('Centos'){
    stage('构建'){
        //把代码从git上面clone下来
        checkout scm
    }
    stage('部署'){
        sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'

    }
    stage('测试'){
	node(){
	    sh 'source /etc/profile && sh 'robot -P . tc'
	}
    }
}
