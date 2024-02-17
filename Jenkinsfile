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
        stage('Deploy') {
            steps {
                echo 'Deploy..'
            }
        }
    }
}
