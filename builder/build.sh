#!/bin/bash

#!/bin/bash

generateOutput() {
  Task=$1
  Status=$2
  Message=$3
  OUTPUT_DIR=/src/${EXECUTION_DIR}/${EXECUTION_TASK_ID}
  mkdir -p ${OUTPUT_DIR}
     echo "{ \"${Task}\": {\"status\": \"${Status}\", \"message\": \"${Message}\"}}"  | jq . > ${OUTPUT_DIR}/summary.json
     echo "{ \"status\": \"${Status}\", \"message\": \"${Message}\"}"  | jq . > ${OUTPUT_DIR}/${Task}.json
    }

echo "I'll build the code"
sleep  $SLEEP_DURATION

cd  $CODEBASE_DIR
mvn $INSTRUCTION
if [ $? -eq 0 ]
then
generateOutput mvn_execute true "dhek chal gya"
echo "build sucessfull"
elif  [ $? != 0 ]
then 
generateOutput mvn_execute false "nhi chala"
echo "build unsucessfull"
fi











