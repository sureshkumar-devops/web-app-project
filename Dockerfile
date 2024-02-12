FROM anapsix/alpine-java 
LABEL maintainer="w3logics.com"
COPY **/*.war web-app-project.war 
EXPOSE 8989
ENTRYPOINT ["java","-jar","/web-app-project.war"]
