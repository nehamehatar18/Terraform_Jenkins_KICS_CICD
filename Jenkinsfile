pipeline {
    agent any

    environment {
        // Add the directory where kics is installed to the PATH
        PATH = "/usr/local/bin:${env.PATH}" // Adjust if your kics binary is located elsewhere
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
                    export PATH=$PATH:/root/kics/bin
                    source ~/.bash_profile
                    # Add any other commands you want to run after this
                    # For example, running your KICS tool
                    kics --version
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
