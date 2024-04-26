#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/temp/$SCRIPT_NAME-$TIMESTAMP.log

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
    echo "Please run this script with not access."
    exit 1 #manuvally exit if error comes.
else
    echo "Your are super user."
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing MySQL"

