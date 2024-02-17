pipeline {
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Git Checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/harshaldhake3/devops-integrate.git']])
                sh 'mvn clean install'
            }
        }
        stage('Docker Image build'){
            steps{
                script{
                    sh 'docker build -t harshaladmin/devops-integrate .'
                }
            }
        }
        stage('Push Image to DockerHUB'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerpwd')]) {
                   sh 'docker login -u harshaladmin -p ${dockerpwd}'
}
                   sh 'docker push harshaladmin/devops-integrate'
                }
            }
        }
    }
}