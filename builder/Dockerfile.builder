FROM maven:3.3-jdk-8

COPY build.sh .

ENTRYPOINT [ "./build.sh" ]