pipeline {
  agent any

  stages {

    stage('Build Artifact - Maven') {
      steps {
        sh "mvn clean package -DskipTests=true"
        archive 'target/*.jar'
      }
    }

    stage('Docker Build and Push') {
      steps {
	    script {
			docker.withDockerRegistry([credentialsId: "dockerhub", url: "https://registry.hub.docker.com"]) {
			  sh 'printenv'
			  sh 'docker build -t hashcerts/numeric-app:""$GIT_COMMIT"" .'
			  sh 'docker push hashcerts/numeric-app:""$GIT_COMMIT""'
			}
		}
      }
    }
  }
}