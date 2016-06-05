#!/bin/bash

cd ..
export SOURCE_FILE="./connect.sh"

#
# Run all the test scripts except the current file.
#
find tests -name "*.sh" ! -name "$0" -exec echo "RUNNING TEST FILE :  " {} \; -exec bash {} \;
