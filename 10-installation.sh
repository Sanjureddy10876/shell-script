#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with not access."
else
    echo "Your are super user."
fi
dnf install mysql -y