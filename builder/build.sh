#!/bin/bash
source functions.sh

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











