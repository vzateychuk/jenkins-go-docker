@Library("git-shared-library") _ 

pipeline {
    agent any

    options {
        skipStagesAfterUnstable()
    }
    stages {

        stage('Buld Info') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                echo "Build #${env.BUILD_NUMBER}, tag ${env.BUILD_TAG}"
                echo "Jenkins URL ${env.JENKINS_URL}"
                echo "Build URL ${env.BUILD_URL}"
                echo "Job name: ${env.JOB_NAME}"
                echo "Workspace: ${env.WORKSPACE}"
            }
        }

        stage('Hello') {
            steps {
                script {
                    helloWorld(name: "Vovka", dayOfWeek: "Tuesday")
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

    }

    post {
        always {
            echo 'Post Action: Do nothing...'
        }
    }        

}