node('Centos'){
    stage('构建'){
        //把代码从git上面clone下来
        checkout scm
    }
    stage('构建'){
        sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'

    }
}
