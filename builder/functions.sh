generateOutput() {
  Task=$1
  Status=$2
  Message=$3
  OUTPUT_DIR=/src/${EXECUTION_DIR}/${EXECUTION_TASK_ID}
  mkdir -p ${OUTPUT_DIR}
  echo "{ \"${Task}\": {\"status\": \"${Status}\", \"message\": \"${Message}\"}}"  | jq . > ${OUTPUT_DIR}/summary.json
  echo "{ \"status\": \"${Status}\", \"message\": \"${Message}\"}"  | jq . > ${OUTPUT_DIR}/${Task}.json
}
