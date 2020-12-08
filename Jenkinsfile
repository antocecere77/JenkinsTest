node {
   def commit_id
   stage('Preparation') {
     checkout scm
     bat "git rev-parse --short HEAD > .git/commit-id"
     commit_id = readFile('.git/commit-id').trim()
   }
   stage('test') {
     withMaven {
        maven: 'maven'
     }{
        bat 'mvn clean install'
     }
   }
   stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("antocecere77/spring-hello-world:${commit_id}", '.').push()
     }
   }
}
