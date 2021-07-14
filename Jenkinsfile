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

    stage('Deploy billing App') {
      steps {
        withCredentials(bindings: [
                      string(credentialsId: 'kubernetes-jenkins-server-account', variable: 'api_token')
                      ]) {
            sh '/kubectl --token $api_token --server https://10.10.11.100:6443 --insecure-skip-tls-verify=true apply -f /php/kubernetes/deployment_docker_php_apache.yaml '
          }

        }
      }

    }
  }