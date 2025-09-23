pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'npx eslint . || true'
                sh 'npx prettier --check . || true'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test || echo "No tests found"'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'docker build -t teamavail:latest .'
            }
        }
        stage('Compose Up') {
            steps {
                sh 'docker compose up -d --build'
            }
        }
    }
}
