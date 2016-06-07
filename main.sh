#!/usr/local/bin/bash

#
# The CONNECT_PATH variable must be set correctly
# for the connect to work. This variable holds the
# path to the Connect directory.
#
if [[ -z "$CONNECT_PATH" ]]
then
    echo "CONNECT_PATH is not set"
    echo "Run export CONNECT_PATH=path"
    exit 10 
fi

#
# Entry script to the connect command.
#
SOURCE_FILE="${CONNECT_PATH}connect.sh"


#
# Checks if the connect.sh exists in the
# CONNECT_PATH
#
if [[ ! -f "$SOURCE_FILE" ]]
then
    echo "Cannot find source file at $CONNECT_PATH"
    exit 11
fi

source "$SOURCE_FILE"

sanity_checks
read_config_file

connect $1
