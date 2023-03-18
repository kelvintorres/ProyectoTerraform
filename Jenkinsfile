pipeline {
  agent any
  stages {
    stage('jenkins') {
      steps {
        sh '''pipeline {
    agent any
    
    stages {
        stage(\'Instalar Terraform\') {
            steps {
                script {
                    sh \'wget https://releases.hashicorp.com/terraform/1.0.10/terraform_1.0.10_linux_amd64.zip\'
                    sh \'unzip terraform_1.0.10_linux_amd64.zip\'
                    sh \'sudo mv terraform /usr/local/bin/\'
                }
            }
        }
        
        stage(\'Ejecutar Terraform\') {
            steps {
                script {
                    sh \'terraform --version\'
                    sh \'terraform init\'
                    sh \'terraform plan\'
                    sh \'terraform apply\'
                }
            }
        }
    }
}
'''
        }
      }

    }
  }