# Sonar Analysis of LMS
![image](https://assets-eu-01.kc-usercontent.com/c35a8dfe-3d03-0143-a0b9-1c34c7b9b595/4ad0d94c-e860-426e-bba4-b2e2c898f3e8/body-ebb832ef-78c8-47be-90ea-7aa77cb6779b_SonarQube%2BPR%2Banalysis%2Bworkflow.png?w=2352&h=1256&auto=format&fit=crop)
## Server Setup
- note: clone the code first
- sudo apt update
## docker install:
- curl -fsSL https://get.docker.com -o install-docker.sh
- sudo sh install-docker.sh
## sonar container: 
- sudo docker container run -dt --name sonarqube -p 9000:9000 sonarqube

## sonar GUI:
- Browse the Server ip-add:9000 
Default credentials **username: admin & password: admin**
- reset your password

## project setup:
- create a local project
- Name: lms
- Key: lms
- Branch: dev / main
- check: use the global settings
- click on create project

## Analyze your project :
- Goto your project (lms) > overview
- with locally
- Generate the  token for sonarqube 
- Update or add the sonarqube url, token and projectkey in command


## goto workstation and run below cmd

- cd ~/lms
- sudo docker run --rm -e SONAR_HOST_URL="http://65.0.99.56:9000" -e SONAR_LOGIN="sqp_786a42390b59d43166d3a83144ef2eaff89ed41c" -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms
