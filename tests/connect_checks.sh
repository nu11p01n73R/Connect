#!/bin/bash

source $SOURCE_FILE

echo "======================================"
echo "TESTING CONNECTION WITHOUT SERVER NAME"
echo "======================================"
(read_config_file; connect)

echo "======================================"
echo "TESTING CONNECTION WITH SERVER NAME"
echo "======================================"
(read_config_file; connect cd_staging)

echo "======================================"
echo "TESTING WITH WRONG SERVER NAME"
echo "======================================"
(read_config_file; connect hello)
