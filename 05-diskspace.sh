#!/bin/bash

DISKTHRESHOLD=5
DISKSOURCE=$(df -hT | grep xfs)

while IFS= read -r line
do
    CURRUSAGE=$($DISKSOURCE | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$($DISKSOURCE | awk -F " " '{print $NF}')
    if [ $DISKTHRESHOLD -gt $CURRUSAGE ]
    then
        echo "this folder $FOLDER and $CURRUSAGE usage is more than threshold $DISKTHRESHOLD"
    fi

done <<< $DISKSOURCE