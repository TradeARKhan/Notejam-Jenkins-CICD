pipeline {
    agent any 
    
    environment {
        SONAR_TOKEN = '90f5d3f1d65fb800c820ce6c9c5620f30cb73857'

        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarcloud') {
                    sh "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=abd-xon_notejam-jenkins"
                }
            }
        }
        stage("Quality gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }
        
       stage("Test") {
	  steps {
        echo "hello, this is the build stage."
	  }
       }

       stage("deploy") {
	  steps {
		echo "hello, this is the "
	  }
       }
   }
}
