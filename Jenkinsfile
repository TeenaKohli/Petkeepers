pipeline {
  agent any
  tools {
      terraform "terraform-11"
  }
  
   environment {
	 //EMAIL_TO = 'x20226845@student.ncirl.ie'
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
	
	stage('SonarScan') {
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
	 
     post {
    // Always runs. And it runs before any of the other post conditions.
       
 success {
	  mail(from: "x20226845@student.ncirl.ie", 
           to: "x20226845@student.ncirl.ie", 
           subject: "That build passed.",
           body: "Nothing to see here")
    }
      //   emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
       //   to: "${EMAIL_TO}", 
        // subject: 'Congratulation on successful Build: $PROJECT_NAME - #$BUILD_NUMBER'
    }

    failure {
	     mail(from: "x20226845@student.ncirl.ie", 
           to: "x20226845@student.ncirl.ie", 
           subject: "That build passed.",
           body: "Nothing to see here")
      //   emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
       //   to: "${EMAIL_TO}", 
        // subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
    }
	     
 always {
      // Let's wipe out the workspace before we finish!
      deleteDir()
    }
  }	     
  
  
  // The options directive is for configuration that applies to the whole job.
  options {
    // For example, we'd like to make sure we only keep 10 builds at a time, so
    // we don't fill up our storage!
    buildDiscarder(logRotator(numToKeepStr:'5'))
    
    // And we'd really like to be sure that this build doesn't hang forever, so
    // let's time it out after an hour.
    timeout(time: 60, unit: 'MINUTES')
  }
  }

