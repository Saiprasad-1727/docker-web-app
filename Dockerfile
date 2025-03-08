FROM tomcat:latest

MAINTAINER saiprasad <saiprasad1727tinku@gmail.com>

EXPOSE 8080

COPY target/maven-web-app.war /usr/local/tomcat/webapps/

