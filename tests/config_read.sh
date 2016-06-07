#!/usr/local/bin/bash

source $SOURCE_FILE

# Test reading config file.
read_config_file
echo "Config file read successfully"


# Prints the read config file 
echo "Server Names"
echo "==============="
for name in ${names[@]}
do
    echo -e "\tName: \t$name"
    echo -e "\tKey: \t${keys[$name]}"
    echo -e "\tUser: \t${usernames[$name]}"
    echo -e "\tIp: \t${ips[$name]}"
    echo "==============="
done
