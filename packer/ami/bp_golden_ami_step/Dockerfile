FROM hashicorp/packer

RUN apk add --no-cache --upgrade bash
RUN apk add jq

ENV SLEEP_DURATION 5s

COPY build.sh .
ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENV INSTRUCTION build
ENV PACKER_PLUGIN_PATH $WORKSPACE/$CODEBASE_DIR/$PACKER_DIR/.packer.d/plugins

ENV ACTIVITY_SUB_TASK_CODE PACKER_DIR EXTRA_VARS

ENTRYPOINT [ "./build.sh" ]
