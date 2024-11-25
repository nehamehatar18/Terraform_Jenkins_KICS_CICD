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
                    def command = "kics version"
                    def process = command.execute()
                    process.waitFor()
                    def output = process.text
                    echo "KICS Version: ${output}"
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
