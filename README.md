# LMS Minikube Deployment
![image](https://www.google.com/url?sa=i&url=https%3A%2F%2Faws.plainenglish.io%2Fkubernetes-minikube-101-d61947b9e091&psig=AOvVaw09UnhIIXnqz0x-PZi7AIF1&ust=1705074903630000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMjzn5XZ1YMDFQAAAAAdAAAAABAD)


## STEP-1: Launch Server
- Guide - https://minikube.sigs.k8s.io/docs/start/
- Requirements —-------t2.medium instance in AWS
- 2 CPUs or more
- 2GB of free ram memory
- 30GB of free disk space

## STEP-2: Install Softwares

### Update system
- sudo apt update
### Docker setup
- Visit: https://get.docker.com/
- curl -fsSL https://get.docker.com -o install-docker.sh
- sudo sh install-docker.sh
- sudo usermod -aG docker ubuntu
- newgrp docker
- docker -v 

### Kubectl setup
- Visit: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
- curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
- sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
- chmod +x kubectl
- sudo mv kubectl /usr/local/bin/kubectl
- kubectl version

### Minikube setup
- Visit: https://minikube.sigs.k8s.io/docs/start/
- curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
- sudo install minikube-linux-amd64 /usr/local/bin/minikube
- minikube version
- minikube status
- minikube start

## STEP-3: Create K8S Manifest files
- Code: git clone -b minikube https://github.com/DL-Murali/lms.git
- cd ~/lms/k8s

## STEP-4: Deploy K8S files

### Database:
- to encrypt the password
- **echo -n Qwerty123 | base64**
- **encrypted-pw**

#### Postgresql k8s deployment
- kubectl apply -f pg-secret.yml  
  - to check secret: kubectl describe secret postgres-secret
      
- kubectl apply -f pg-deployment.yml
- kubectl apply -f pg-cluster-ip.yml

### Docker login:
- generate PAT in docker hub
- My Account -> settings -> New Access Token
- login to your server
- docker login -u muralialakuntla3
- password: dckr_pat_T_****************

### Backend:
- cd ~/lms/api
- docker build -t muralialakuntla3/lms-be .
- docker push muralialakuntla3/lms-be
- kubectl apply -f be-configmap.yml
  - to check configmap: kubectl describe configmap backend-config-map
- kubectl apply -f be-deployment.yml
- kubectl apply -f be-service.yml

#### to check backend use port-forward cmd
- kubectl port-forward service/lms-be-service 32100:3000 --address 0.0.0.0
- check in browser: **pub-ip:32100
  
### Frontend:
#### Connect frontend with backend  : 
- cd ~/lms/webapp
- sudo vi .env
  - update backend-ip:32100 address

#### frontend deployment
- docker build -t muralialakuntla3/lms-fe .
- docker push muralialakuntla3/lms-fe
- kubectl apply -f fe-deployment.yml
- kubectl apply -f fe-service.yml

#### to check backend use port-forward cmd
- kubectl port-forward service/lms-fe-service 32200:80 --address 0.0.0.0
- check in browser: pub-ip:32200
