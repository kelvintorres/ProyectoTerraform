pipeline {
  agent any
  stages {
    stage('jenkins') {
      steps {
        sh ''' pipeline {
  agent any
  stages {
    stage(\'Instalar y Ejecutar Terraform\') {
      steps {
        sh \'./script.sh\'
      }
    }
  }
}
'''
        }
      }

    }
  }