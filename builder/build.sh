#!/bin/bash

echo "I'll build the code"
sleep $SLEEP_DURATION

cd $CODEBASE_DIR
mvn $INSTRUCTION
echo "Code building done"
