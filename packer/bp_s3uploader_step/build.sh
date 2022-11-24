#!/bin/bash
source /opt/buildpiper/shell-functions/functions.sh
source /opt/buildpiper/shell-functions/log-functions.sh

logInfoMessage "I'll upload [$FILE] to the [$S3_BUCKET] bucket and have mounted at [${CODEBASE_DIR}/$FILE_DIR}]"
sleep  "$SLEEP_DURATION"

logInfoMessage "Copying ${FILE} to ${S3_BUCKET} bucket"
aws s3 cp ${WORKSPACE}/${CODEBASE_DIR}/${FILE_DIR}/${FILE} s3://${S3_BUCKET} 

if [ $? -eq 0 ]
then
    logInfoMessage "Congratulations file is uploaded successfully to s3 bucket!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} build true "Congratulations ami created sucessfully "
elif [ "${VALIDATION_FAILURE_ACTION}" == "FAILURE" ]
    then
    logErrorMessage "Please check upload failed!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} false "Please check upload failed!!!"
    exit 1
    else
    logWarningMessage "Please check upload failed!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} true "Please check upload failed!!!"
fi 