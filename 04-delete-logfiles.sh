#!/bin/bash

SOURCEDIR=/home/ec2-user/logs

if [ -d $SOURCEDIR ]
then
    echo "source dir is existed."
else    
    echo "source dir is not there."
    exit 1
fi

FILE=$(find $SOURCEDIR -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo "$line need to be deleted"
done << $FILE
