pipeline {
    agent any
    
        stage('Sonar Analysis') {
            steps {
                echo 'Analyze code..'
                sh 'cd webapp && sudo docker run  --rm -e SONAR_HOST_URL="http://54.252.31.46:9000" -e SONAR_LOGIN="sqp_db2297661f9a8b4a664aee572053f841004f374b"  -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms'
            }
        
	stage('Build') {
            steps {
                echo 'Building..'
		sh 'cd webapp && npm install && npm run build'
            }
        }
        
	stage('Release LMS') {
           steps {
               script {
                   echo "Releasing.."
                   def packageJSON = readJSON file: 'webapp/package.json'
                   def packageJSONVersion = packageJSON.version
	           echo "${packageJSONVersion}"
	           sh "zip webapp/dist-${packageJSONVersion}.zip -r webapp/dist"
	           sh "curl -v -u admin:Sathish@1989 --upload-file webapp/dist-${packageJSONVersion}.zip http://54.252.31.46:8081/repository/lms/"
             } 
             }  
        }
    }
    }
    }
