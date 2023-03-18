 pipeline {
    agent any
    stages {
        stage('Dar permisos de ejecución al script') {
            steps {
                sh 'sudo chmod +x script.sh'
            }
        }
        stage('Instalar y Ejecutar Terraform') {
            steps {
                sh 'sudo ./script.sh'
            }
        }
    }
}
