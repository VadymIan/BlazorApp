pipeline {
    environment {
    imagename = "mylocaldocker3103/test-project"
    dockerImage = ''
  }

    agent any

    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/VadymIan/BlazorApp.git'
            }
        }
        stage('Building') {
            steps {
		 sh 'dir'
                 sh 'dotnet build /TestProject/TestProject.csproj'
            }
        }
        stage('Running Tests') {
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
		stage('Building Image') {
			steps {
				script {
					dockerImage = docker.build(imagename)
				}
			}
		}
		stage('Pushing Image') {
			steps {
				script {
					dockerImage.push('latest')
				}
			}
		}
    }
}
