pipeline {
    agent any
    tools{
        jdk 'java17'
        maven 'maven3'
    }
    environment{
       SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sunil3gs98/secretsanta-generator'
            }
        }
        stage('Code-Compile') {
            steps {
                sh "mvn clean compile"
                
            }
        }
        stage('Test cases') {
            steps {
                sh "mvn test"
                
            }
        }
        
        stage('Build Application') {
            steps {
                sh "mvn clean package"
            }
        }
        
        
        
       
        
        
        
        
        
         
        
        
    }
}
