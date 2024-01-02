# lms docker deployment

## install docker:
- curl -fsSL https://get.docker.com -o install-docker.sh
- sudo sh install-docker.sh
- sudo usermod -aG docker ubuntu
- newgrp docker

## docker network: 

- docker network create -d bridge lmsnetwork

## Database: 
- docker container run -dt --name lmsdb -p 5432:5432 --network lmsnetwork -e POSTGRES_PASSWORD=password postgres

## Backend:

- cd ~/lms/api
- docker build -t backend .
- docker container run -dt --name backend -p 8080:8080 --network lmsnetwork -e DATABASE_URL=postgresql://postgres:password@lmsdb:5432/postgres --name backend -e PORT=8080 -e MODE=local backend
- browse backend: pub-ip:8080/api

## Frontend:

- cd ~/lms/webapp
- Add backend url in .env of webapp 
- docker build -t frontend .
- docker container run -dt --name frontend -p 80:80 frontend
