# Terraform
![image](https://spaceliftio.wpcomstaging.com/wp-content/uploads/2023/03/terraform-architecture-diagram.png)

# Install Terraform Plugins in Vscode
- HASHICORP TERRAFORM
- HCL TERRAFORM
- THESE PLUGINS WILL HELP FOR AUTO CORRESCTION 
## STEP-1: Launch Terraform Server
- Guide - https://minikube.sigs.k8s.io/docs/start/
- Requirements —-------t2.medium instance in AWS
- 2 CPUs or more
- 2GB of free ram memory
- 30GB of free disk space

## STEP-2: Install Softwares

### Update system
- sudo apt update
  
### Install terraform
- visit: https://developer.hashicorp.com/terraform/install
- wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
- echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
- sudo apt update && sudo apt install terraform
  
### Install aws cli
- sudo apt  install awscli -y
- aws configure
- aws s3 ls

## STEP-3: Deploy Infra and Server
- git clone -b terraform https://github.com/DL-Murali/lms.git
- cd lms/terraform/
- sudo vi provider.tf    --> update your access and secret key details
- terraform init
- terraform validate
- terraform plan
- terraform apply

### To save terraform output details 
- terraform output -json > output.json
- cat output.json   ---> to see saved values
