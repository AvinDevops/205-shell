#!/bin/bash

DISKTHRESHOLD=5
DISKSOURCE=$(df -hT | grep xfs)

while IFS= read -r line
do
    USAGE=$($DISKSOURCE | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$($DISKSOURCE | awk -F " " '{print $NF}')
    echo "$USAGE and $FOLDER"
    if [ $USAGE -ge $DISKTHRESHOLD ]
    then
        echo "this folder $FOLDER and $USAGE usage is more than threshold $DISKTHRESHOLD"
    fi

done <<< $DISKSOURCE