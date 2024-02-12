FROM anapsix/alpine-java 
LABEL maintainer="w3logics.com"
COPY target/web-app-project.war web-app-project.war 
EXPOSE 8989
ENTRYPOINT ["java","-jar","/web-app-project.war"]
