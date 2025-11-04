#!/bin/bash

set -e

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