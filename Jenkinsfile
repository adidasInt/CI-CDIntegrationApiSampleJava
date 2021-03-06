podTemplate(label: 'jenkins-agent-pod', containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true)
  ],
  volumes: [ 
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
  ]
  ) {
    
    node('jenkins-agent-pod') {

       stage("Git pull") {
        git url: 'https://github.com/JDaniel1990/apiSampleJava.git', branch: 'master'    
       } 

       stage('Maven Build') {
        container('maven') {
            sh 'mvn clean package'
        }
       }
        
       stage('Build and push docker image') {

        container('docker') {
            script {
    	        docker.withRegistry('https://eu.gcr.io', 'gcr:adidas-test') {
                    def customImage = docker.build("adidas-test-233013/adidas-test:pro.${BUILD_NUMBER}")
                    customImage.push()        
                }
            } 
        }
       }

       stage("Change image in Kubernetes Deployment") {    
        
        container('kubectl') {
            sh 'kubectl set image deployment/adidas-test -n pro adidas-test=eu.gcr.io/adidas-test-233013/adidas-test:pro.${BUILD_NUMBER}' 
        }
        
       }
    }
}

