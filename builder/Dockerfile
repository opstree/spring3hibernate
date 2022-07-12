FROM maven:3.3-jdk-8

COPY build.sh .
ENV ACTIVITY_SUB_TASK_CODE MVN_EXECUTE

ENTRYPOINT [ "./build.sh" ]
