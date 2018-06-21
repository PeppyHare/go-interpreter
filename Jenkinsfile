pipeline {
  agent any
  stages {
    stage('Tests') {
      steps {
        sh '''#!/bin/bash -ex
sudo apt-get install -y golang-go
bash ./runtests.sh
'''
      }
    }
  }
}
