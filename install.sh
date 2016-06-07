#!/usr/local/bin/bash

#
# Install script for connect.
# Creates a simbolic link from /usr/bin/connect to ./main.sh
# Should have root permission to run the command.
#

#
# Entry script.
#
FILE_NAME="main.sh"

#
# Error codes
#
PERM_DENAID=50

if [[ "$EUID" -ne 0 ]]
then
    echo "Permission denaid : Run the script as root"
    exit $PERM_DENAID
fi

echo "Creating link /usr/bin/connect to $(pwd)/$FILE_NAME"
ln -s "$(pwd)/$FILE_NAME" /usr/bin/connect

echo "Creating Config File"
cp config_dummy config

echo -e "# Path to the connect command source \nexport CONNECT_PATH="$(pwd) >> ~/.profile

