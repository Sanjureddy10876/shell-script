#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(basename "$0" .sh)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[33m"

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

for i in $@
do
    echo "Package to install $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo "Package $i is already installed...$Y SKIPPING $N"
    else 
        echo "Package $i is not installed...Need to install"
    fi
done