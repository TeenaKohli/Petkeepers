node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    withSonarQubeEnv(installationName: 'sq1') {
      bat "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=Petkeepers"
    }
  }
}
