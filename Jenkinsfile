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
            def scanDir = "${WORKSPACE}"  // Use the correct workspace variable

            // Run KICS scan in Docker and capture output, even if the stage fails, mark it as successful
            catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
                sh """
                    docker run -t -v ${scanDir}:${scanDir} checkmarx/kics scan -p ${scanDir} -o ${scanDir}/kics_report --output-name kics-result-terraform
                """
            }

            echo "KICS Scan completed, continuing with pipeline execution."
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
                        sh 'cat ${WORKSPACE}/kics_report/kics-result-terraform.json'
                }
            }
        }
        

    }
}
