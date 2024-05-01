#!/bin/bash
set -e

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with not access."
    exit 1 #manuvally exit if error comes.
else
    echo "Your are super user."
fi

dnf install myysssql -y

dnf install git -y


echo "this scrit proceding?"

