pipeline {
    agent any
    environment {
        CI = 'true'
        HOME="."
    }
    stages {
        stage('web_build') {
            steps {
                sh 'echo "`date` dancicd $BRANCH_NAME $BUILD_NUMBER" >> /var/lib/jenkins/logs/dancicd_jenkins_web_build.log'
                sh '"$WORKSPACE/scripts/web_build.sh"'
            }
        }
        stage('web_deploy') {
            steps {
                sh 'echo "`date` dancicd $BRANCH_NAME $BUILD_NUMBER " >> /var/lib/jenkins/logs/dancicd_jenkins_web_deploy.log'
                sh '"$WORKSPACE/scripts/web_deploy.sh" dancicdtest-${BRANCH_NAME}${BUILD_NUMBER}'
            }
        }
        stage('test') {
            steps {
                sh 'echo "`date` dancicd $BRANCH_NAME $BUILD_NUMBER " >> /var/lib/jenkins/logs/dancicd_jenkins_test.log'
                sh '$WORKSPACE/jenkins/scripts/test.sh dancicdtest-${BRANCH_NAME}${BUILD_NUMBER}'
            }
        }
    }
}
