#!/bin/bash

echo "I'll build the code"
sleep $SLEEP_DURATION

cd $CODEBASE_DIR
mvn $INSTRUCTION
echo "Code building done"

OUTPUT_DIR=${EXECUTION_DIR}/${EXECUTION_TASK_ID}

echo '{"mvn_execute": {"status": false, "message": "failed to apply infrastructure via terraform : a null object was created, instead of terraform object"}}' > ${OUTPUT_DIR}/summary.json

echo '{"status": false, "message": "failed to apply infrastructure via terraform : a null object was created, instead of terraform object"}' > ${OUTPUT_DIR}/mvn_execute.output

