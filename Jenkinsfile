pipeline {
  agent any
  stages {
    stage('SonarCloud Scan') {
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
            -Dsonar.sources=.'''
            }
        }
      }
    stage("Quality Gate") {
      steps {
        timeout(time: 1, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
            }
      }
    }

  }
}