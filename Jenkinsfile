pipeline {
  agent any
  stages {
    stage('clone repository') {
      steps {
        sh '''java -version
mvn --version
git --version'''
      }
    }

    stage('------------ Deploy php apache docker ------------- ') {
      steps {
        withCredentials(bindings: [
                      string(credentialsId: 'kubernete-jenkis-server-account', variable: 'api_token')
                      ]) {
            sh 'kubectl --token $api_token --server https://10.10.11.100:6443 --insecure-skip-tls-verify=true apply -f deployment_docker_php_apache.yaml '
          }

        }
      }

    }
  }
© 2021 GitHub, Inc.