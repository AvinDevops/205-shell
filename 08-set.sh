#!/bin/bash

set -e

error_handler(){
    echo "error line no: $1"
    echo "error command: $2"
}

trap 'error_handler ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not root user"
    exit 1
else
    echo "you are root user"
fi

dnf install mysqll -y

dnf install nginx -y

echo "script reached end!"