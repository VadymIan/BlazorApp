pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/VadymIan/BlazorApp.git'
            }
        }
        stage('Build') {
            steps {
                dotnetBuild project: 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject', sdk: '.NET SDK'
            }
        }
        stage('Run Tests') {
            steps {
                bat 'dotnet test --logger "trx;LogFileName=TestResult.trx" C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject\\TestProject.csproj'
            }
            
            post {
                always {
                    ws('C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject\\TestResults')
                    {
                        mstest()
                    }
                    
                }
            }
        }
    }
}