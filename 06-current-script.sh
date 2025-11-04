#!/bin/bash
COURSE="DevOps with avin"

echo "current script course value is: $COURSE"
echo "current script PID: $$"

# ./07-other-script.sh
source ./07-other-script.sh

echo "after calling other script course is: $COURSE"