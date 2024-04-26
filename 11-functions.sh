#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(basename "$0" .sh)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2....FAILED"
        exit 1 
    else 
        echo "$2....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root access."
    exit 1
else
    echo "You are the super user."
fi

dnf install mysql -y &>>"$LOGFILE"
VALIDATE $? "Installing MySQL"

dnf install git -y &>>"$LOGFILE"
VALIDATE $? "Installing Git"
