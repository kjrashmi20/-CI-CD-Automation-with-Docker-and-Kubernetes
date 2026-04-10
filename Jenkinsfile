pipeline {
    agent { label 'agent' }

    stages {

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t prt-app .
                '''
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

    post {
        success {
            echo 'CI/CD Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}
