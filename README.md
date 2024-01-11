# LMS single server deployment
![image]([https://miro.medium.com/v2/resize:fit:720/format:webp/1*1GIp-R_p2WZb6W4-4cKx5g.png](https://eginnovations.com/blog/wp-content/uploads/2021/09/Amazon-AWS-Cloud-Topimage-1.jpg))
## Sever setup
- sudo apt update
## postgres installation
- sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
- wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
- sudo apt-get update
- sudo apt-get -y install postgresql
- sudo ss -ntpl
## postgres password setup
- sudo su - postgres
- psql
- \password
- enter your password
- \q
- exit
## node installation
- curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
- sudo apt-get install -y nodejs
- node -v
- npm -v
## clone the code
- git clone -b dev https://github.com/DL-Murali/lms.git
## build backend
- cd ~/lms
- cd api/
**- sudo vi .env**
  - MODE=production
  - PORT=8080
  - DATABASE_URL=postgresql://postgres:your-password@localhost:5432/postgres  
- npm install
- sudo npm install -g pm2
- sudo npx prisma db push
- npm run build
- pm2 start build/index.js
- sudo ss -ntpl
- curl http://localhost:8080/api
## build frontend
- cd ~/lms/webapp/
- **vi .env**
- VITE_API_URL=http://public-ip:8080/api  
- npm install
- npm run build
- sudo apt -y update
- sudo apt -y install nginx
- sudo rm -rf /var/www/html/*
- sudo cp -r ~/lms/webapp/dist/* /var/www/html
- sudo systemctl restart nginx 
