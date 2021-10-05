pipeline {
    environment { 
        registry = "arkdocr/jenkins" 
        registryCredential = 'docker'
        dockerImage = '' 
    }
    agent any
    stages {
      stage('SonarCloud Scanning') {
        environment {
                SCANNER_HOME = tool 'SonarQubeScanner'
                SONAR_TOKEN = credentials('SonarCloudOne')
                ORGANIZATION = "abd-xon"
                PROJECT_NAME = "abd-xon_notejam-jenkins"
      }
      steps {
        withSonarQubeEnv(installationName: 'SonarCloudOne', credentialsId: 'SonarCloudOne') {
            sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.organization=$ORGANIZATION \
            -Dsonar.java.binaries=build/classes/java/ \
            -Dsonar.projectKey=$PROJECT_NAME \
            -Dsonar.branch.name=main \
            -Dsonar.branch.target=dev \
            -Dsonar.sources=.'''
            }
        }
      }
    stage("Quality Gate") {
      steps {
        timeout(time: 1, unit: 'HOURS') {
            waitForQualityGate abortPipeline: true
          }
       }
    }
    stage('Building Docker Image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
     stage('Push to Dockerhub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                    dockerImage.push() 
                    }
                } 
            }
        }
  }
}
