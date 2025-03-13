deploying a basic web app in docker container it is based on java

Java Web App Git Repo : https://github.com/Saiprasad-1727/docker-web-app.git

step 1: download the required packages to clone and build the application

       $ sudo yum install git -y
   
       $ sudo yum install -y maven
                        this is install the required version of mavan and java 

step 2: after cloing the repo move to the path where you find the src folder

    $ cd docker-web-app
    $ ll
    total 12
    -rw-r--r--. 1 root root  16 Mar  8 13:25 README.md
    -rw-r--r--. 1 root root 891 Mar  8 13:47 pom.xml
    drwxr-xr-x. 3 root root  18 Mar  8 13:30 src

step 3: now build the war file uisng maven goals

    $ mvn clean package : it will create a target directory and generate war file


step 4: now it is the time to create dockerfile to create docker image and deploy our web based application in docker container

   a) To create a Docker file the following keywords will used

    To write dockerfile we will use below keywords

	1) FROM
	2) MAINTAINER
	3) RUN
	4) CMD
	5) COPY
	6) ADD
	7) WORKDIR
	8) EXPOSE
	9) ENTRYPOINT
	10) USER

b) create a docker file for web based app

   $ vi Dockerfile
            
           FROM tomcat:latest
           MAINTAINER saiprasad <saiprasad1727tinku@gmail.com>
           EXPOSE 8080
           COPY target/maven-web-app.war /usr/local/tomcat/webapps

c) build the docker image with dockerfile

  $ docker build -t <image-name>

  check the docker images with : $ docker images

d) run the docker image to create a docker container 

  $ docker run -d -p <host-port:container-port> <img-name>

e) Enable host port number in security group inbound rules and access our application

		URL : http://public-ip:host-port/war-file-name/


![image](https://github.com/user-attachments/assets/f9959013-bac7-46de-af27-634780b868a2)
