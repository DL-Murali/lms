pipeline {
    agent any
    stages {
        stage('Sonar Analysis') {
            steps {
                echo 'Analyze code..'
            }
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
		    echo 'Releasing..'
		    def packageJSON = readJSON file: 'webapp/package.json'
                    def packageJSONVersion = packageJSON.version
		    echo "${packageJSONVersion}"
                    sh "zip webapp/dist-${packageJSONVersion}.zip -r webapp/dist"
		    sh "curl -v -u admin:Sathish@1989 --upload-file webapp/dist-${packageJSONVersion}.zip http://54.252.31.46:8081/repository/lms/"
            }
        }
    }
        stage('Deploy LMS') {
            steps {
	        script {
		    echo 'Deploying..'
		    def packageJSON = readJSON file: 'webapp/package.json'
                    def packageJSONVersion = packageJSON.version
                    echo "${packageJSONVersion}"
		    sh "curl -u admin:Sathish@1989 -X GET \'http://54.252.31.46:8081/repository/lms/dist-${packageJSONVersion}.zip\' --output dist-'${packageJSONVersion}'.zip"
		    sh 'sudo rm -rf /var/www/html/*'
		    sh "sudo unzip -o dist-'${packageJSONVersion}'.zip"
		    sh "sudo cp -r dist/* /var/www/html"
             }
         }
    }
}}
