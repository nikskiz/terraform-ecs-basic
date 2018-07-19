FROM centos:latest

COPY app /app
WORKDIR /app

#Install packages
RUN yum -y install wget 

#Instal Java
RUN yum install -y java-1.8.0-openjdk-devel


# Installing Resin
#RUN rpm --import http://caucho.com/download/rpm/RPM-GPG-KEY-caucho
#RUN yum install -y http://caucho.com/download/rpm-6.8/4.0.52/x86_64/resin-pro-4.0.52-1.x86_64.rpm

#Expose port 8080 for the app
EXPOSE 8080

#Run the command on container start up
CMD ["java","-jar","spring-boot-sample-jetty-1.0.0.RC5.jar"]
