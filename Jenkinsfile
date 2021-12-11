pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  tools {
      terraform "terraform-11"
  }
  
   environment {
        aws_access_key_id='ASIA3JXYMGHCKR52R4HW'
		aws_secret_access_key='aN5epQnw57Y0qliTHcq1Pig4Q+kGSzpxrLpot3PW'
		aws_session_token='FwoGZXIvYXdzEDwaDKse/c/hkK7IMUlzWiLLAbmcD4BZ5tMfLiwHPnfE1dHCYAQljvSZl80bF6OA1N2VsrHggJYb9OEbqEHpn/tII9mM6EKS47s/0MqRXA3NwO6taFviAfGxMZ1gefGTVorNbygqAECFFGoN5o9gHMdAKDmnuyk9P6SrtZRPpU1pcLFJFQnLT205WuLiYaglZuePham9gGoNjcIixkbmKQDbVS5ySivEdDdVQtmilm5NAe6N2oxYcof56nKfDGMtq/QmOuvxb4j+Xh8C57b8FfGPluMqyaf5fIUuSGw+KPr10Y0GMi1zC8cZKg0XH4dk20iZVckJKoGWcxlxji0uDavtIjyDI1wVQTBv8VTsQdyoEQs='
   }
    
  stages {
    stage('Git Checkout') {
      steps {
        git branch: 'new', credentialsId: 'aba77e95-f0de-4a98-bb5c-578b80fed4fa', url: 'https://github.com/TeenaKohli/petkeepers'
      }
    }
	
	stage('Scan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') 
		{ 
          bat "mvn clean verify sonar:sonar -Dsonar.projectKey=Petkeepers"
        }
	}
	}

    stage('Terraform Init') {
      steps {
        bat 'terraform init'
      }
    }
    
    stage('Terraform apply') {
      steps {
        bat 'terraform apply --auto-approve'
      }
    }
  }
}
