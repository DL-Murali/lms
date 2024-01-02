# Sonar Analysis:
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
