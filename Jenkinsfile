
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Terraform') {
            steps {
                sh '''
                    if ! command -v terraform >/dev/null 2>&1; then
                        apt-get update
                        apt-get install -y curl unzip
                        curl -fsSLo /tmp/terraform.zip \
                          https://releases.hashicorp.com/terraform/1.16.5/terraform_1.16.5_linux_amd64.zip
                        unzip -o /tmp/terraform.zip -d /tmp/terraform-bin
                    else
                        mkdir -p /tmp/terraform-bin
                        cp "$(command -v terraform)" /tmp/terraform-bin/terraform
                    fi
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    export PATH="/tmp/terraform-bin:$PATH"
                    terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    export PATH="/tmp/terraform-bin:$PATH"
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    export PATH="/tmp/terraform-bin:$PATH"
                    terraform plan -input=false
                '''
            }
        }
    }
}
