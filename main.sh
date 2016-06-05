#!/bin/bash

#
# Entry script to the connect command.
#

SOURCE_FILE="./connect.sh"

source $SOURCE_FILE

sanity_checks
read_config_file
connect $1
