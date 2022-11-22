FROM hashicorp/packer

RUN apk add --no-cache --upgrade bash
RUN apk add jq

ENV SLEEP_DURATION 5s

COPY build.sh .
COPY BP-BASE-SHELL-STEPS/functions.sh .
ENV INSTRUCTION build
ENV ACTIVITY_SUB_TASK_CODE PACKER_PLUGIN_PATH EXTRA_VARS

ENTRYPOINT [ "./build.sh" ]