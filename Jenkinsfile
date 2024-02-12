pipeline
{
	agent any	
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
	}
}
