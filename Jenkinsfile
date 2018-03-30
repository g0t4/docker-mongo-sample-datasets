pipeline {
  agent {
    docker {
      image 'docker'
    }
    
  }
  stages {
    stage('hello') {
      steps {
        echo 'hello'
        sh '''docker version
docker info'''
      }
    }
  }
  environment {
    DOCKER_HOST = 'tcp://dind:2375'
  }
}