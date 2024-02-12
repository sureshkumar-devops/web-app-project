pipeline
{
	agent any	
      environment {
        DOCKERHUB_CREDENTIALS = credentials('lehar-dockerhub-token')
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }   
	stages
	{
	  stage('Compile Stage')
	  {
	    steps
	    {
	      withMaven(maven: 'MAVEN_HOME')
	      {
			sh 'mvn clean compile'
	      }
	    }
	  }
	  stage('Testing Stage')
	  {
	    steps
	    {
	      withMaven(maven: 'MAVEN_HOME')
	      {
	        sh 'mvn test'
	      }
	    }
	  }
	  stage('Package Stage')
	  {
	    steps
	    {
	      withMaven(maven: 'MAVEN_HOME')
	      {
	        sh 'mvn package'
	      }
	    }
	  }
	  stage('Install Stage')
	  {
	    steps
	    {
	      withMaven(maven: 'MAVEN_HOME')
	      {
	        sh 'mvn install'
	      }
	    }
	  }
      stage('Docker Build Stage')
	  {
	    steps
	    {     
	            sh 'docker build -t webapp:${TAG} .'            	      
	    }
	  }
      stage('Docker Image Push into DockerHub')
	  {
	    steps
	    {      

	       sh 'echo $DOCKERHUB_CREDENTIALS_PWD | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
           sh 'docker push lehardocker/webapp:${TAG}'
	    }
	  }
	}
}