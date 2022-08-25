pipeline {
    agent any
    tools{
        maven 'maven_3.8.6'
    }
	environment{
		LOCAL_IMAGE = 'jalalazhmatkhan/service-registry:0.0.1'
		REPO_IMAGE = 'jalalazhmatkhan/service-registry:0.0.1'
		REMOTE_USER = 'ec2-user'
		REMOTE_HOST = '172.31.34.22'
	}
    stages{
    	stage('environment'){
    	    steps{
    	        sh 'java -version'
    	        sh 'mvn -v'
    	        sh 'docker version'
    	    }
    	}
        stage('Build'){
            steps {
                	sh 'mvn clean compile install'
            }
        }
        stage('Test'){
            steps {
                	sh 'mvn test'
            }
        }
		
		stage('Publish Image'){
            steps {
				withCredentials([
            		usernamePassword(credentialsId:'dockerhub-jalalazhmatkhan', usernameVariable:'USERNAME', passwordVariable:'PASSWD')
            	]){
            	    sh 'docker login -u $USERNAME -p $PASSWD'
					sh 'mvn jib:dockerBuild'
                    sh 'docker tag $LOCAL_IMAGE $REPO_IMAGE'
                    sh 'docker push $REPO_IMAGE'
					sh 'docker push ${REPO_IMAGE}'
				}
            }
        }

        stage('Deploy'){
            steps {
                    sh 'ssh $REMOTE_USER@$REMOTE_HOST docker pull $REPO_IMAGE'
                    sh 'ssh $REMOTE_USER@$REMOTE_HOST docker ps -q --filter ancestor=$REPO_IMAGE | xargs -r docker stop'
                    sh 'ssh $REMOTE_USER@$REMOTE_HOST docker run -d -p 8085:8085 $REPO_IMAGE'
            }
        }

    }
}
