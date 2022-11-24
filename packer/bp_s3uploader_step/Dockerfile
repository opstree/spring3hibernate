FROM hashicorp/packer

RUN apk add --no-cache --upgrade bash
RUN apk add jq
RUN apk add --no-cache aws-cli
RUN aws --version

ENV SLEEP_DURATION 5s

COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENV ACTIVITY_SUB_TASK_CODE S3_BUCKET 
ENV FILE_DIR "."
ENV FILE "."

ENTRYPOINT [ "./build.sh" ]