node('Centos'){
    stage('构建'){
        //把代码从git上面clone下来
        checkout scm
    }
    stage('部署'){
        sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'

    }
    stage('测试'){
        //test
	//node中不写参数表示在本地执行，linux上没有环境，在本地要保证有代码文件，将代码checkout下来
	node(){
		sh 'rm -rf /Users/wgz/.jenkins/workspace/ContinuousIntegration/web'
		sh 'git clone https://github.com/weiguozhen/web.git'
		sh 'robot -P ./web /web/tc'
	}
    }
}
