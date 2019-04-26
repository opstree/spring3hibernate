FROM maven:3.3-jdk-8 as builder
COPY . /usr/src/mymaven/
WORKDIR /usr/src/mymaven/
RUN mvn clean package

FROM tomcat:7-jre7-alpine
MAINTAINER "opstree <opstree@gmail.com>"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /usr/src/mymaven/target/Spring3HibernateApp.war /usr/local/tomcat/webapps/ROOT.war
WORKDIR /usr/local/tomcat/webapps/
EXPOSE 8080
