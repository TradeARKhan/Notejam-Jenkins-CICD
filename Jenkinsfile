pipeline {
    agent any
    stages {
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SONAR_TOKEN') {
                    sh "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=abd-xon_notejam-jenkins"
                }
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
