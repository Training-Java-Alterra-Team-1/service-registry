pipeline {
    agent any
    tools{
        maven 'maven_3.8.6'
    }
	environment{
		LOCAL_IMAGE = 'registry-sistem-akademik:0.0.1'
		REPO_IMAGE = 'jalalazhmatkhan/sistem-akademik'
		REMOTE_USER = 'ec2-user'
		REMOTE_HOST = 'ec2-13-127-197-5.ap-south-1.compute.amazonaws.com'
	}
    stages{
    	stage('environment'){
    	    steps{
    	        sh 'java -version'
    	        sh 'mvn -v'
//     	        sh 'docker version'
    	    }
    	}
        stage('Build'){
            steps {
//             	withCredentials([
//             		string(credentialsId:'jasypt_secret', variable:'secret')
//             	]){
                	sh 'mvn clean compile install'
//             	}
            }
        }
        stage('Test'){
            steps {
//             	withCredentials([
//             		string(credentialsId:'jasypt_secret', variable:'secret')
//             	]){
                	sh 'mvn test'
//             	}
            }
        }
		
		stage('Publish Image'){
            steps {
// 				withCredentials([
//             		usernamePassword(credentialsId:'docker', usernameVariable:'username', passwordVariable:'password')
//             	]){
					sh 'mvn jib:dockerBuild'
// 					sh 'docker tag ${LOCAL_IMAGE} ${REPO_IMAGE}'
// 					sh 'docker push ${REPO_IMAGE}'
// 				}
            }
        }

//         stage('Deploy'){
//             steps {
//                 withCredentials([
//                     usernamePassword(credentialsId:'docker', usernameVariable:'username', passwordVariable:'password')
//                 ]){
//                     sh 'scp deploy.sh ${REMOTE_USER}@${REMOTE_HOST:~/}'
//                     sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod +x deploy.sh"'
//                     sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} ./deploy.ssh'
//                 }
//             }
//         }

    }
}
