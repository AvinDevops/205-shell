#!/bin/bash

#checking root user or not
R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R you are not root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 is...FAILED $N"
        exit 1
    else
        echo -e "$G $2 is...SUCCESS $N"
    fi
}

for i in $@
do
    echo "installing $i"
    dnf list installed $i
    if [ $? -eq 0 ]
    then
        echo -e "$G $i already installed $N"
    else
        dnf install $i -y
        VALIDATE $? "installing $i"
    fi
done

