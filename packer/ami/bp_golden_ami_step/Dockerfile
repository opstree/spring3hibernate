FROM hashicorp/packer

RUN apk add --no-cache --upgrade bash
RUN apk add jq

ENV SLEEP_DURATION 5s

COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENV INSTRUCTION build
ENV PACKER_DIR .
ENV EXTRA_VARS .

ENV ACTIVITY_SUB_TASK_CODE PACKER_PLUGIN_PATH EXTRA_VARS

ENTRYPOINT [ "./build.sh" ]
