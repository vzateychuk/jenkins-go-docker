@Library("git-shared-library") _ 

def rootDir = pwd()
def exampleModule = load "${rootDir}@script/example.groovy"

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

        stage('Invoke global shared lib: Hello') {
            steps {
                script {
                    helloWorld(name: "Vovka", dayOfWeek: "Tuesday")
                }
            }
        }

        stage('Invoke folder shared lib: exampleMethod') {
            steps {
                script {
                    exampleModule.exampleMethod()
                }
            }
        }

    }

    post {
        always {
            echo 'Post Action: Do nothing...'
        }
    }        

}