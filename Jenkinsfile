pipeline {
    agent any

    stages {
        stage(&apos;Checkout&apos;) {
            steps {
                git &apos;https://github.com/VadymIan/BlazorApp.git&apos;
            }
        }
        stage(&apos;Build&apos;) {
            steps {
                dotnetBuild project: &apos;C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject&apos;, sdk: &apos;.NET SDK&apos;
            }
        }
        stage(&apos;Run Tests&apos;) {
            steps {
                bat &apos;dotnet test --logger &quot;trx;LogFileName=TestResult.trx&quot; C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject\\TestProject.csproj&apos;
            }
            
            post {
                always {
                    ws(&apos;C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\BlazorApp\\TestProject\\TestResults&apos;)
                    {
                        mstest()
                    }
                    
                }
            }
        }
    }
}