pipeline{
    agent{label 'Centos'}
    environment {

        gitpullerr = 'noerr'
        sendmail = 'yes'
        git_url = 'git@192.168.8.110:/git/reps/pipeline.git'
        git_key = '50e27d86-37e0-4a5b-82db-4ea5ea9492bf'
        git_branch = 'dev'
    }
    triggers { pollSCM('* * * * *') }
    stages {
        stage('构建') {
            steps {
                checkout scm
                //checkout([$class: 'GitSCM', branches: [[name: ${git_branch}]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: ${git_key}, url: ${git_url}]]])
            }
        }

        stage('部署'){
            steps {
                sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'
                echo "$gitpullerr"
            }
        }
        stage('测试'){
	    agent{label 'master'}
            steps{
                sh 'rm -rf /Users/wgz/.jenkins/workspace/ContinuousIntegration/web'
	        sh 'git clone https://github.com/weiguozhen/web.git'
	        sh 'cd web && sh ./run.sh'
            }
        }

    }
    post{
        success {
            script {
                if (sendmail == 'yes') {
//                 emailext body: 'test', replyTo: 'wgz18516820311@163.com', subject: 'test', to: '1272235678@qq.com'
           emailext attachmentsPattern: '/web/*.html',body: '''<body leftmargin="8" marginwidth="0" topmargin="8" marginheight="4"
    offset="0">
    <table width="95%" cellpadding="0" cellspacing="0"
        style="font-size: 11pt; font-family: Tahoma, Arial, Helvetica, sans-serif">
        <tr>
            <td><br />
            <b><font color="#0B610B">构建信息</font></b>
            <hr size="2" width="100%" align="center" /></td>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>构建名称：${JOB_NAME}</li>
                    <li>构建结果: <span style="color:green"> ${BUILD_STATUS}</span></li>
                    <li>构建编号：${BUILD_NUMBER}  </li>
                    <li>GIT 地址：${git_url}</li>
                    <li>GIT 分支：${git_branch}</li>
                    <li>变更记录: ${CHANGES,showPaths=true,showDependencies=true,format="<pre><ul><li>提交ID: %r</li><li>提交人：%a</li><li>提交时间：%d</li><li>提交信息：%m</li><li>提交文件：<br />%p</li></ul></pre>",pathFormat="         %p <br />"}
                </ul>
            </td>
        </tr>
    </table>
</body>
</html>
''', replyTo: 'wgz18516820311@163.com',subject: 'test', to: '1272235678@qq.com'
                }else {
                echo 'scm pull error ignore send mail'
                    }
            }
        }
    }
}