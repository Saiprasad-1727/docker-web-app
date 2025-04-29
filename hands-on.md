#Install docker software with following command

yum install -y docker

[root@ip-172-31-23-24 ~]# service docker start
Redirecting to /bin/systemctl start docker.service

[root@ip-172-31-23-24 ~]# docker -v
Docker version 25.0.8, build 0bab007

[root@ip-172-31-23-24 ~]# docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

[root@ip-172-31-23-24 ~]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

[root@ip-172-31-23-24 ~]# docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

[root@ip-172-31-23-24 ~]# docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
254e724d7786: Pull complete
913115292750: Pull complete
3e544d53ce49: Pull complete
4f21ed9ac0c0: Pull complete
d38f2ef2d6f2: Pull complete
40a6e9f4e456: Pull complete
d3dc5ec71e9d: Pull complete
Digest: sha256:c15da6c91de8d2f436196f3a768483ad32c258ed4e1beb3d367a27ed67253e66
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest



[root@ip-172-31-23-24 ~]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        latest    a830707172e8   12 days ago   192MB

[root@ip-172-31-23-24 ~]# docker run -d nginx
f5683f312da2deb9fdc970b7dd4a9206a2e9ed9ffea5aaa8eb86d418e541c4b5

[root@ip-172-31-23-24 ~]# docker ps
CONTAINER ID ||  IMAGE || COMMAND    ||               CREATED            STATUS              PORTS     
f5683f312da2           nginx     "/docker-entrypoint.…"   5 seconds ago   Up 3 seconds   80/tcp  

NAMES 
optimistic_fermat

[root@ip-172-31-23-24 ~]# docker run -p 8080:80 -d nginx
aa0a7554ce5cbe0aef12742ea0c6b927ca315267267cf7ed95473d0608fca70c

[root@ip-172-31-23-24 ~]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES
aa0a7554ce5c   nginx     "/docker-entrypoint.…"   4 seconds ago    Up 3 seconds    0.0.0.0:8080->80/tcp, :::8080->80/tcp   clever_hodgkin
f5683f312da2   nginx     "/docker-entrypoint.…"   57 seconds ago   Up 55 seconds   80/tcp                                  optimistic_fermat

 

Install git package for cloning the any git repos

yum install -y git

[root@ip-172-31-23-24 ~]# git clone https://github.com/Saiprasad-1727/docker-web-app.git
Cloning into 'docker-web-app'...
remote: Enumerating objects: 27, done.
remote: Counting objects: 100% (27/27), done.
remote: Compressing objects: 100% (22/22), done.
remote: Total 27 (delta 5), reused 13 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (27/27), 6.38 KiB | 6.38 MiB/s, done.
Resolving deltas: 100% (5/5), done.
[root@ip-172-31-23-24 ~]# ls
docker-web-app
[root@ip-172-31-23-24 ~]# cd docker-web-app/
[root@ip-172-31-23-24 docker-web-app]# ls -l
total 12
-rw-r--r--. 1 root root  144 Apr 29 14:02 Dockerfile
-rw-r--r--. 1 root root 1870 Apr 29 14:02 README.md
-rw-r--r--. 1 root root  891 Apr 29 14:02 pom.xml
drwxr-xr-x. 3 root root   18 Apr 29 14:02 src
drwxr-xr-x. 4 root root   49 Apr 29 14:02 target    after doing mvn clean package a target folder will be generate

[root@ip-172-31-23-24 docker-web-app]# cat Dockerfile
FROM tomcat:latest
MAINTAINER saiprasad <saiprasad1727tinku@gmail.com>
EXPOSE 8080
COPY target/maven-web-app.war /usr/local/tomcat/webapps/

[root@ip-172-31-23-24 docker-web-app]# docker build -t image1 .
[+] Building 10.6s (7/7) FINISHED                                                                                                                                                                  docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                         0.0s
 => => transferring dockerfile: 243B                                                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/tomcat:latest                                                                                                                         0.1s
 => [internal] load .dockerignore                                                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                                                              0.0s
 => [internal] load build context                                                                                                                                                                            0.0s
 => => transferring context: 110.87kB                                                                                                                                                                        0.0s
 => [1/2] FROM docker.io/library/tomcat:latest@sha256:74925aa717f920385e2a32eb066d8f05a76fb64f27b346720b2b23f0f24ccd89                                                                                 10.1s
 => => resolve docker.io/library/tomcat:latest@sha256:74925aa717f920385e2a32eb066d8f05a76fb64f27b346720b2b23f0f24ccd89                                                                                       0.0s
 => => sha256:74925aa717f920385e2a32eb066d8f05a76fb64f27b346720b2b23f0f24ccd89 6.64kB / 6.64kB                                                                                                               0.0s
 => => sha256:c1396032975591f89aaaed44f161b8c54a8b4a8d2a78fecb66ff18f244024b14 2.72kB / 2.72kB                                                                                                               0.0s
 => => sha256:25c101ff077bfa16d99fe6f08295b600a067155179442654b8fbf35df3cae61c 12.50kB / 12.50kB                                                                                                             0.0s
 => => sha256:2726e237d1a374379e783053d93d0345c8a3bf3c57b5d35b099de1ad777486ee 29.72MB / 29.72MB                                                                                                             0.9s
 => => sha256:4dffb2e8f490c245c9094387cb9cfdb8e66abfd3dae5d201b2ce93a14408e854 22.95MB / 22.95MB                                                                                                             0.7s
 => => sha256:551745135a2ac58e81689eb6e1a6f245eac9ea4f5a36dae56b5f2991107146ab 157.65MB / 157.65MB                                                                                                           4.3s
 => => sha256:aed71c0b623c401f7d0b07281d896ffa2a921fe7a449de5c3359901512320e43 156B / 156B                                                                                                                   0.8s
 => => sha256:1d5fef8a53785dc8ce4959b045aecc611438c07961049e898b99df0daeeb4778 2.28kB / 2.28kB                                                                                                               0.8s
 => => sha256:85a7e2a18c1f12010764809b8046babd074b5a14a5054a5771d2c8a706409903 139B / 139B                                                                                                                   0.9s
 => => extracting sha256:2726e237d1a374379e783053d93d0345c8a3bf3c57b5d35b099de1ad777486ee                                                                                                                    1.9s
 => => sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1 32B / 32B                                                                                                                     1.0s
 => => sha256:af362218bdb37e4efc0383c5c9f607b97ac169e958d301df04378abcb45947c2 16.48MB / 16.48MB                                                                                                             1.7s
 => => extracting sha256:4dffb2e8f490c245c9094387cb9cfdb8e66abfd3dae5d201b2ce93a14408e854                                                                                                                    1.9s
 => => extracting sha256:551745135a2ac58e81689eb6e1a6f245eac9ea4f5a36dae56b5f2991107146ab                                                                                                                    3.8s
 => => extracting sha256:aed71c0b623c401f7d0b07281d896ffa2a921fe7a449de5c3359901512320e43                                                                                                                    0.0s
 => => extracting sha256:1d5fef8a53785dc8ce4959b045aecc611438c07961049e898b99df0daeeb4778                                                                                                                    0.0s
 => => extracting sha256:85a7e2a18c1f12010764809b8046babd074b5a14a5054a5771d2c8a706409903                                                                                                                    0.0s
 => => extracting sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1                                                                                                                    0.0s
 => => extracting sha256:af362218bdb37e4efc0383c5c9f607b97ac169e958d301df04378abcb45947c2                                                                                                                    0.6s
 => [2/2] COPY target/maven-web-app.war /usr/local/tomcat/webapps/                                                                                                                                           0.1s
 => exporting to image                                                                                                                                                                                       0.1s
 => => exporting layers                                                                                                                                                                                      0.0s
 => => writing image sha256:2b5a0cb0414781102a7854bb307e197e17f92da9bee5c32ed10fe59b1975be90                                                                                                                 0.0s
 => => naming to docker.io/library/image1                                                                                                                                                                    0.0s



[root@ip-172-31-23-24 docker-web-app]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
image1       latest    2b5a0cb04147   6 seconds ago   475MB
nginx        latest    a830707172e8   12 days ago     192MB


[root@ip-172-31-23-24 docker-web-app]# docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
image1       latest    2b5a0cb04147   6 seconds ago   475MB
nginx        latest    a830707172e8   12 days ago     192MB


[root@ip-172-31-23-24 docker-web-app]# docker run -d -p 8080:8080 image1
fffd6652ad255f668409b645cac80dd14d45e25b4e01f7e91e263ddd774721ca
docker: Error response from daemon: driver failed programming external connectivity on endpoint nice_volhard (1abe4e33ec2ca2160823f1caea192f913f36537ef563f8bb7431ddfcdf222aff): Bind for 0.0.0.0:8080 failed: port is already allocated.

[root@ip-172-31-23-24 docker-web-app]# docker stop nginx
Error response from daemon: No such container: nginx

[root@ip-172-31-23-24 docker-web-app]# docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES

fffd6652ad25   image1    "catalina.sh run"        35 seconds ago   Created                                                 nice_volhard

aa0a7554ce5c   nginx     "/docker-entrypoint.…"   19 minutes ago   Up 19 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp   clever_hodgkin

f5683f312da2   nginx     "/docker-entrypoint.…"   20 minutes ago   Up 20 minutes   80/tcp                                  optimistic_fermat

[root@ip-172-31-23-24 docker-web-app]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES
aa0a7554ce5c   nginx     "/docker-entrypoint.…"   19 minutes ago   Up 19 minutes   0.0.0.0:8080->80/tcp, :::8080->80/tcp   clever_hodgkin

f5683f312da2   nginx     "/docker-entrypoint.…"   20 minutes ago   Up 20 minutes   80/tcp                                  optimistic_fermat

[root@ip-172-31-23-24 docker-web-app]# docker stop aa0a7554ce5c
aa0a7554ce5c

[root@ip-172-31-23-24 docker-web-app]# docker run -d -p 8080:8080 image1
68cefe7ca3b5c0c40759ce35ed708cc17fb7f68f1e81f1cea373d6eaf10738c8

[root@ip-172-31-23-24 docker-web-app]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                       NAMES
68cefe7ca3b5   image1    "catalina.sh run"        5 seconds ago    Up 4 seconds    0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   wizardly_shaw

f5683f312da2   nginx     "/docker-entrypoint.…"   20 minutes ago   Up 20 minutes   80/tcp                                      optimistic_fermat

[root@ip-172-31-23-24 docker-web-app]#


how to check the hosted app 

http://<public-ip>:8080/maven-web-app




 	
