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
	    sh 'rm -rf /Users/wgz/.jenkins/workspace/ContinuousIntegration/web'
	    sh 'git clone https://github.com/weiguozhen/web.git'
	    sh 'cd web && sh ./run.sh'
	}
    }
}
