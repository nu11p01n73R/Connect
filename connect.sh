#!/bin/bash

#
# Location of config file.
#
CONFIG_FILE="./config"

#
# Arrays which store the basic configurations.
#
names=()
keys=()
usernames=()
ips=()


#
# Read configurations from the config file.
# The read configurations are put in the different arrays.
# All the arrays will be keyd by the name.
#
function read_config_file() 
{
    while read name key username ip
    do
        if [[ "$name" =~ [a-zA-Z_] ]] 
        then
            names+=($name)   
            keys[$name]="$key"
            usernames[$name]="$username"
            ips[$name]="$ip"
        fi
    done < $CONFIG_FILE   
}

