pipeline
{
	agent any	
      environment {
        DOCKERHUB_CREDENTIALS = credentials('lehar-dockerhub-token')
       
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
	            sh 'docker build -t web-app-project .'            	      
	    }
	  }
      stage('Login to DockerHub Account')
	  {
	    steps
	    {      
	       sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'           
                    
	    }
	  }
       stage('Push The Image into DockerHub Account')
       {
         steps
         {
            sh 'docker push lehardocker/webapp'              
         }
       }

	}
}