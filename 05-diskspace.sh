#!/bin/bash

DISK_THRESHOLD=5
DISK_SOURCE=$(df -hT | grep xfs)
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    # echo "$USAGE and $FOLDER"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="this folder $FOLDER and $USAGE usage is more than threshold $DISK_THRESHOLD \n"
    fi

done <<< $DISK_SOURCE

echo -e "$MESSAGE"