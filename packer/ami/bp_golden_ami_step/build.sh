#!/bin/bash
source functions.sh

echo "Manage the packer code available at [$WORKSPACE] and have mounted at [${CODEBASE_DIR}/${PACKER_DIR}]"
sleep  $SLEEP_DURATION


cd  ${WORKSPACE}/${CODEBASE_DIR}/${PACKER_DIR}
logInfoMessage "packer ${INSTRUCTION}"

packer ${INSTRUCTION} ${EXTRA_VARS}

if [ $? -eq 0 ]
then
    logInfoMessage "Congratulations packer build succeeded!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} build true "Congratulations ami created sucessfully "
elif [ "${VALIDATION_FAILURE_ACTION}" == "FAILURE" ]
    then
    logErrorMessage "Please check packer build failed!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} false "Please check packer build failed!!!"
    exit 1
    else
    logWarningMessage "Please check packer build failed!!!"
    generateOutput ${ACTIVITY_SUB_TASK_CODE} true "Please check packer build failed!!!"
fi 