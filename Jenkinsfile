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
                        sh 'kics version'
                    }
                }
            }
        }
        
        
        stage('KICS SCAN') {
            steps {
                script {
                        sh 'kics scan --path *.tf -q /root/kics/assets/queries --report-formats "html,json" -o ./output  --output-name kics-result-tf-cicd'
                    }
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
