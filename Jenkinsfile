#!/usr/bin/env groovy
pipeline{
//     agent{label 'Centos'}
    agent{label 'master'}
    environment {
        sendmail = 'yes'
        gitpullerr = 'noerr'
    }
    triggers { pollSCM('* * * * *') }
    stages {
        stage('构建') {
            agent{label 'Centos'}
            steps {
                checkout scm
                //checkout([$class: 'GitSCM', branches: [[name: ${git_branch}]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: ${git_key}, url: ${git_url}]]])
            }
        }

        stage('部署'){
            agent{label 'Centos'}
            steps {
                sh 'cd /root/workspace/ContinuousIntegration/ && sh ./deploy.sh'
            }
        }
        stage('测试'){
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
            sh 'pwd'
            emailext attachmentsPattern: 'web/*.html', body: '''<body leftmargin="8" marginwidth="0" topmargin="8" marginheight="4"
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
                    <div style="font-size:18px">
                        <li>构建名称：${PROJECT_NAME}</li>
                        <li>构建结果: <span style="color:green"> Successful </span></li>
                        <li>构建编号：${BUILD_NUMBER}</li>
                        <li>触发原因：${CAUSE}</li>
                        <li>GIT 地址：https://github.com/weiguozhen/ContinuousIntegration.git</li>
                        <li>GIT 分支：master</li>
                        <li>变更记录: ${CHANGES,showPaths=true,showDependencies=true,format="<pre><ul><li>提交ID: %r</li><li>提交人：%a</li><li>提交时间：%d</li><li>提交信息：%m</li><li>提交文件：<br />%p</li></ul></pre>",pathFormat="         %p <br />"}
                        <li>Failed Test Results: ${FAILED_TESTS}</li>
                        <li><font color="#0B610B">测试结果报告见附件📎</font></li>
                    </div>
                </ul>
            </td>
        </tr>
    </table>
</body>
</html>
''', subject: '${PROJECT_NAME}', to: '1272235678@qq.com,1527183103@qq.com'
                }

           }
        }
        failure {

            script {
                if (gitpullerr == 'noerr') {
                emailext attachmentsPattern: 'web/*.html', body: '''<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body leftmargin="8" marginwidth="0" topmargin="8" marginheight="4"
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
                    <li>构建结果: <span style="color:red"> ${BUILD_STATUS}</span></li>
                    <li>构建编号：${BUILD_NUMBER}  </li>
                    <li>GIT 地址：https://github.com/weiguozhen/ContinuousIntegration.git</li>
                    <li>GIT 分支：master</li>
                    <li>变更记录: ${CHANGES,showPaths=true,showDependencies=true,format="<pre><ul><li>提交ID: %r</li><li>提交人：%a</li><li>提交时间：%d</li><li>提交信息：%m</li><li>提交文件：%p</li></ul></pre>",pathFormat="%p <br />"}
                </ul>
            </td>
        </tr>
        <tr>
            <td><b><font color="#0B610B">构建日志 :</font></b>
            <hr size="2" width="100%" align="center" /></td>
        </tr>
        <tr>
            <td><textarea cols="150" rows="30" readonly="readonly"
                    style="font-family: Courier New">${BUILD_LOG}</textarea>
            </td>
        </tr>
    </table>
</body>
</html>
''', subject: '${PROJECT_NAME}', to: '1272235678@qq.com'
            }else {
                echo 'scm pull error ignore send mail'
            }

        }
        }
    }

}
