# OpenJDK JRE
FROM openjdk:8
# copy WAR into image
COPY saba-framework-1.0.0.war /saba-framework-1.0.0.war 
# run application with this command line 
CMD ["java","-jar", "-Dspring.profiles.active=docker", "/saba-framework-1.0.0.war"]