pipeline {
    agent any


       stages {
        stage('Sonar Analysis')
	    steps {
	        echo 'Analyze Code..'
		sh 'cd webapp && sudo docker run  --rm -e SONAR_HOST_URL="http://54.252.31.46:9000" -e SONAR_LOGIN="sqp_db2297661f9a8b4a664aee572053f841004f374b"  -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms'
		}
       }	
       
        stage('Build') {
            steps {
                echo 'Building..'
	        sh 'cd webapp && npm install && npm run build'
	        }
       }	
    
    }
