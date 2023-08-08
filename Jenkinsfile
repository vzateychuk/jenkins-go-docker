def builds = [
    [name: "data", srcDir: './src/services/data'],
    [name: "meta", srcDir: './src/services/meta'],
    [name: "http", srcDir: './src/services/http']
]

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
                    echo "Hello world!"
                }
            }
        }

        stage('Build application binaries') {
            steps {
                script {

                    def parallelBuld = builds.collectEntries {
                        b -> [ "${build.name}", {echo "building: ${build.name}, source: ${${build.name}}"}]
                    }

                    parallel parallelBuld
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