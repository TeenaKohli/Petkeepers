pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
  stage('Scan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') 
		{ 
          bat "mvn clean verify sonar:sonar -Dsonar.projectKey=Petkeepers"
        }
		}
	}
   stage ('Run Downstream Terraform') 
	{
    build job: 'terraform integeration'
	}  
  }
}
