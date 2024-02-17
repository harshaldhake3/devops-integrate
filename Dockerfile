FROM openjdk:11
EXPOSE 8082
ADD target/devops-integrate.jar devops-integrate.jar
ENTRYPOINT ["java","-jar","/devops-integrate.jar"]