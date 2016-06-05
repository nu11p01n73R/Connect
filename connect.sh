#!/bin/bash

#
# Location of config file.
#
CONFIG_FILE="./config"

#
# Location of key files.
#
KEY_FILE_PREFIXES="/Users/johny/programs/sshKeys/"



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
        if [[ "$name" =~ ^[a-zA-Z_]+$ ]] 
        then
            names+=("$name")
            keys[$name]="$key"
            usernames[$name]="$username"
            ips[$name]="$ip"
        fi
    done < $CONFIG_FILE   
}

#
# Establish an ssh connection with the remote server
#
function connect()
{
    if [[ -nz $1 ]] 
    then
        #
        # Regex to match server name in the $names array.
        # [[:<:]] matches word boundary in OSX or BSD
        # Reference http://stackoverflow.com/a/12696899/3150943
        #
        # TODO Regex has made to change with platform
        #
        re="[[:<:]]$1[[:>:]]"

        if [[ ${names[@]} =~ $re ]] 
        then
            #
            # Connects to Server if found in the $names.
            #
            ssh -i $KEY_FILE_PREFIXES${keys[$1]} ${usernames[$1]}@${ips[$1]}
            exit 0
        else
            #
            # If not found in $names, the list of available servers is shown.
            #
            echo "Cannot Find The Server Named $1"
        fi
    fi

    #
    # List all the available servers to connect to.
    #
    echo "Select Server Name To Connect To"
    select name in ${names[@]}
    do
        echo "Initiating ssh connection to $name"
        echo "=========================================="
        ssh -i $KEY_FILE_PREFIXES${keys[$name]} ${usernames[$name]}@${ips[$name]}
        exit 0
    done
}


function sanity_checks() 
{
    #
    # Checks if config file exists
    #
    [[ ! -f $CONFIG_FILE ]] && echo "Cannot Find Config File, $CONFIG_FILE" && exit 1
    # 
    # Checks if the key files directory exists.
    #
    [[ ! -d $KEY_FILE_PREFIXES ]] && echo "Cannot Find Key File Directory, $KEY_FILE_PREFIXES
    " && exit 1

    #
    # This is required to set the exit status of this function correctly.
    # TODO : Another alternative is to have a different exit codes on when the files are not found.
    #
    echo "Config File and Key Files Located SuccessFully" > /dev/null
}
