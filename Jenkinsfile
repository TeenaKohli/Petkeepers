pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
    stages {
    stage('Install') {
      steps {
            bat 'mvn clean install'
      }
      }
    stage('Scan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') { 
          bat 'mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'
        }
      }
    }
  }
}
