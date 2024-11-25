pipeline {
    agent any


    
    stages {
        stage('Checkout Terraform Project') {
            steps {
                git branch: 'main', url: 'https://github.com/NeeharikaRN/Terraform_Jenkins_KICS_CICD.git'
            }
        }

        stage('Verify KICS Installation') {
            steps {
                script {
                    sh 'docker pull checkmarx/kics:latest'
                }
                }
            }
        
        
        
        stage('KICS SCAN') {
            steps {
        script {
            // Use Jenkins workspace for scanning
            def scanDir = "${env.WORKSPACE}"

            // Run KICS scan in Docker and output to the same directory
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh """
                    docker run -t -v ${scanDir}:${scanDir} checkmarx/kics scan -p ${scanDir} -o ${scanDir}/
                """
            }

            // Optional: You can add additional logic to handle the scan output (e.g., log or post-process)
            echo 'KICS Scan completed, continuing with pipeline execution.'
        }
                }
            }
        
        
        
        stage('Approval') {
            steps {
                script {
                    input 'Proceed to apply Terraform changes?'
                }
            }
        }
        
        stage('Archive KICS Results') {
            steps {
                script {
                        sh 'cat ${env.WORKSPACE}/kics_report.json'
                }
            }
        }
        

    }
}
