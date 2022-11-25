GREEN="32m"
RED="31m"
YELLOW="1;33m"

COLOR_START="\e["
COLOR_END="\e[0m"

generateOutput() {
  Task=$1
  Status=$2
  Message=$3
  OUTPUT_DIR=/src/${EXECUTION_DIR}/${EXECUTION_TASK_ID}
  mkdir -p ${OUTPUT_DIR}
  echo "{ \"${Task}\": {\"status\": \"${Status}\", \"message\": \"${Message}\"}}"  | jq . > ${OUTPUT_DIR}/summary.json
  echo "{ \"status\": \"${Status}\", \"message\": \"${Message}\"}"  | jq . > ${OUTPUT_DIR}/${Task}.json
}

function getComponentName() {
  COMPONENT_NAME=`cat /bp/data/environment_build | jq -r .build_detail.repository.name`
  echo "$COMPONENT_NAME"
}

function getRepositoryTag() {
  BUILD_REPOSITORY_TAG=`cat /bp/data/environment_build | jq -r .build_detail.repository.tag`
  echo "$BUILD_REPOSITORY_TAG"
}

function logInfoMessage() {
    MESSAGE="$1"
    CURRENT_DATE=`date "+%D: %T"`
    echo -e "[$CURRENT_DATE] "$COLOR_START$GREEN[INFO]$COLOR_END" $MESSAGE"

}

function logErrorMessage() {
    MESSAGE="$1"
    CURRENT_DATE=`date "+%D: %T"`
    echo -e "[$CURRENT_DATE] "$COLOR_START$RED[ERROR]$COLOR_END" $MESSAGE"
}

function logWarningMessage() {
    MESSAGE="$1"
    CURRENT_DATE=`date "+%D: %T"`
    echo -e "[$CURRENT_DATE] "$COLOR_START$YELLOW[WARNING]$COLOR_END" $MESSAGE"
}