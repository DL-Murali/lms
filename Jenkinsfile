pipeline {
    agent any
    stages {
        stage('Sonar Analysis') {
            steps {
                echo 'Analyze code..'
	        sh 'cd webapp && sudo docker run  --rm -e SONAR_HOST_URL="http://13.238.195.245:9000" -e SONAR_LOGIN="sqp_db2297661f9a8b4a664aee572053f841004f374b"  -v ".:/usr/src" sonarsource/sonar-scanner-cli -Dsonar.projectKey=lms'
            }
        } 
	stage('Build') {
            steps {
                echo 'Build..'
		sh 'cd webapp && npm install && npm run build'
            }
        }
        stage('Release LMS') {
           steps {
               script {
                   echo "Releasing.."
                   def packageJSON = readJSONfile:'webapp/package.json'
                   def packageJSONVersion = packageJSON.version
	           echo "${packageJSONVersion}"
	           sh "zip webapp/dist-${packageJSONVersion}.zip -r webapp/dist"
	           sh "curl -v -u admin:Sathish@1989 --upload-file webapp/dist-${packageJSONVersion}.zip http://13.238.195.245:8081/repository/lms/"
             } 
        } 
     }
        stage('Deploy') {
            steps {
                script {
                    echo "Deploying.."
             }
        }  
     }
  }  
}


