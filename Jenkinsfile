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
                    // Replace with your local path or Jenkins workspace path
                    def scanDir = "${env.WORKSPACE}"  // Use Jenkins workspace for scanning

                    // Run KICS scan in Docker and output to the same directory
                    sh """
                    docker run -t -v ${scanDir}:${scanDir} checkmarx/kics scan -p ${scanDir} -o ${scanDir}/
                    """
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
