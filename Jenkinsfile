## Docker Build and Push Stage
## replace  siddharth67 with your dockerhub username

pipeline {
  agent any

  stages {

    stage('Build Artifact - Maven') {
      steps {
        sh "mvn clean package -DskipTests=true"
        archive 'target/*.jar'
      }
    }

##    stage('Docker Build and Push') {
##      steps {
##        withDockerRegistry([credentialsId: "dockerhub", url: ""]) {
##          sh 'printenv'
##          sh 'docker build -t hashcerts/numeric-app:""$GIT_COMMIT"" .'
##          sh 'docker push hashcerts/numeric-app:""$GIT_COMMIT""'
##        }
##      }
##    }
  }
}