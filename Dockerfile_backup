FROM ubuntu:latest as base 

RUN apt update -q 
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install maven -y
WORKDIR /usr/local/
ADD ./settings.xml  /usr/share/maven/conf
ADD ./application/crdoperations/pom.xml /usr/local/pom.xml
#RUN mvn -T 1C dependency:resolve
ADD  ./application/crdoperations/ /usr/local/
#ADD ./settings.xml  /usr/share/maven/conf/
RUN  mvn -T 1C clean install 
 


#FROM ubuntu:16.04

#RUN apt-get update
#RUN apt-get install openjdk-8-jdk -y
#RUN mkdir -p  /usr/local/content/tomcat
FROM tomcat:8.0
WORKDIR /usr/local/content/tomcat
ADD ./config/ /root/config/
ADD ./scripts/ /scripts/tomcat/
#RUN wget http://mirrors.fibergrid.in/apache/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.tar.gz
#RUN tar -xvf apache-tomcat-8.5.34.tar.gz
RUN chmod +x /scripts/tomcat/start.sh
COPY --from=base /usr/local/target/curdoperations-1.war  /usr/local/content/tomcat/webapps/
EXPOSE 8080
#ENTRYPOINT /scripts/tomcat/start.sh
CMD ["/scripts/tomcat/start.sh", "sh"] 
