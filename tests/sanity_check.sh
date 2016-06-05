#!/bin/bash

source $SOURCE_FILE


#
# Runs the sanity check function.
# This run shouldnt give any issues
#
sanity_checks && echo "SANITY CHECKS PASSED"



#
# Sets $CONFIG_FILE to not existing file.
# This test should fail.
#
CONFIG_FILE_BACKUP=$CONFIG_FILE
CONFIG_FILE="./unkown_file"

(sanity_checks; [[ $? -eq 100 ]]) &&  (echo "SANITY CHECKS FAILED" && CONFIG_FILE=$CONFIG_FILE_BACKUP)


#
# Sets $KEY_FILE_PREFIXES to unknown.
# This test should fail.
#
KEY_FILE_PREFIXES_BACKUP=$KEY_FILE_PREFIXES
KEY_FILE_PREFIXES="unknown"


(sanity_checks && [[ $? -eq 101 ]]) && (echo "SANITY CHECKS FAILED" && KEY_FILE_PREFIXES=$KEY_FILE_PREFIXES_BACKUP)
