pipeline {
  agent {
    node {
      label 'docker'
    }

  }
  stages {
    stage('Clone Code') {
      steps {
        git(url: 'https://github.com/Ohubabs/arsenal.git', branch: 'master')
      }
    }

    stage('Build Image') {
      environment {
        env = 'dev'
      }
      steps {
        container(name: 'build image', shell: 'docker build -t princebabs/arsenal:v1 .')
      }
    }

  }
  environment {
    env = 'dev'
  }
}