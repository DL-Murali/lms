# Nexus Practical on LMS
![image](https://user-images.githubusercontent.com/12953323/109366876-d640dc80-7894-11eb-9a4f-10be67c000f4.png)
## Nexus Server Req
- t2.large
- port:8081
- 20 GB
## github releases
- goto github and make 2 tags
- edit package.json -> version: 1.1 & 2.1
- edit index.html -> colour: red & green
- tag v1.1 -- for red deployment
- tag v2.1 -- for green deployment
- release them 
- copy .tar/.zip file link

## Build server
- goto build server 
- download github releases: wget paste-copied-link [ v1.1.tar/v2.1.zip]
- tar -xvf v1.1.tar.gz/v2.1.tar.gz
### install node-16:
- sudo apt update
- curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
- sudo apt-get install -y nodejs

## build lms frontend:
- cd v1.1/webapp or cd v2.1/webapp
- npm install
- npm run build ------> you will get dist folder
- tar -cvf lms-1.1.tar dist

## Nexus Setup:
- install docker: curl -fsSL https://get.docker.com -o install-docker.sh
- sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3
- sudo ss -ntpl

## Browse the public-ip:8081:
- in window top-right you find "Sign in" click on it
- Default username: admin
- password: sudo docker container exec nexus cat /nexus-data/admin.password
- update password

## Setting custom repository:
- click on settings icon [ top-left]
- left side bar click on: Repositories
- Create repository
- raw (hosted)
- name: lms  --> create repository --> click on repo for more details
- refresh page and click on 'Browse' [top-left beside to settings]
- click on created repo: lms

## Nexus Artifacts Handling:
- goto build server and upload artifact files
- curl -v -u **username:password** --upload-file **file-name** **nexus-repo-link**
- curl -v -u admin:amkamk3 --upload-file lms-1.1.tar http://54.183.136.152:8081/repository/lms/
- goto nexus window and check

## Deploying Artifacts from nexus:
- launch deployment servers
- download artifats files from nexus
- curl -u username:password -X GET 'http://20.172.187.108:8081/repository/lms/lms-1.1.tar' --output lms-1.1.tar
- curl -u admin:amkamk3 -X GET 'http://54.183.136.152:8081/repository/lms/lms-1.1.tar' --output webapp.tar
- tar -xvf lms-1.1.tar
- install nginx : sudo apt install nginx -y
- sudo rm -rf /var/www/html/*
- sudo cp -rf dist/* /var/www/html/
- restart nginx: sudo systemctl restart nginx
- check in browser


