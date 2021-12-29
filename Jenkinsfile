pipeline {

  agent any
  
  environment {
        repository        = "https://github.com/gopalselvam/nodejsdeploy.git"
        DOCKER_IMAGE_NAME = "gopalselvam/nodejsdeploy"
    }

  stages {

    stage('Checkout Source') {
      steps {
        git url:'repository', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("DOCKER_IMAGE_NAME:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('DeployToProduction') {
            when {
                branch 'master'
            }
            steps {
                input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'gke-hellowworld.yml',
                    enableConfigSubstitution: true
                )
            }
        }

  }

}
