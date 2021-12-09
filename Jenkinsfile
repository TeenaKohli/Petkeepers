pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  stages {
    stage('Scan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') { 
          bat './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.4.0.905:sonar'
        }
      }
    }
  }
}
