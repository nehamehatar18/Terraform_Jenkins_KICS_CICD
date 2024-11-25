pipeline {
    agent any

    environment {
        // Add the directory where kics is installed to the PATH
        PATH = "/root/kics/bin:${env.PATH}" // Adjust if your kics binary is located elsewhere
    }
    
    stages {
        stage('Checkout Terraform Project') {
            steps {
                git branch: 'main', url: 'https://github.com/NeeharikaRN/Terraform_Jenkins_KICS_CICD.git'
            }
        }

        stage('Verify KICS Installation') {
            steps {
                script {
                    sh '''
                    ./scripts/kics_version.sh
                    '''
                }
                }
            }
        
        
        
        stage('KICS SCAN') {
            steps {
                script {
                        sh './scripts/kics_scan.sh'
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
                        sh 'archiveArtifacts allowEmptyArchive: true, artifacts: 'kics-result-tf-cicd.json''
                }
            }
        }
        

    }
}
