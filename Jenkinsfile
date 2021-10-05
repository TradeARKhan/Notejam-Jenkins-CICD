pipeline {
       environment {
         SCANNER_HOME = tool 'SonarQubeScanner'
         SONAR_TOKEN = credentials('SonarCloudOne')
         ORGANIZATION = "abd-xon"
         PROJECT_NAME = "abd-xon_notejam-jenkins"
         BRANCH_NAME = "dev"
         CHANGE_BRANCH = "test"
         }
  agent any
  stages {
      stage('SonarQube branch analysis') {
        when {
            not {
                changeRequest()
                }
            }
        steps {
        withSonarQubeEnv(installationName: 'SonarCloudOne', credentialsId: 'SonarCloudOne') {
            sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.organization=$ORGANIZATION \
            -Dsonar.java.binaries=build/classes/java/ \
            -Dsonar.projectKey=$PROJECT_NAME \
            -Dsonar.branch.name=$BRANCH_NAME \
            -Dsonar.sources=.'''
            }
          }
        }
        stage('SonarQube other analysis') {
        when {
              changeRequest()
              }
        steps {
        withSonarQubeEnv(installationName: 'SonarCloudOne', credentialsId: 'SonarCloudOne') {
            sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.organization=$ORGANIZATION \
            -Dsonar.java.binaries=build/classes/java/ \
            -Dsonar.projectKey=$PROJECT_NAME \
            -Dsonar.branch.name=$CHANGE_BRANCH \
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
  }
}
