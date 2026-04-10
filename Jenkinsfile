pipeline {
    agent { label 'agent' }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/kjrashmi20/-CI-CD-Automation-with-Docker-and-Kubernetes.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t prt-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f prt-container || true
                docker run -d -p 8081:80 --name prt-container prt-app
                '''
            }
        }
    }
}
