#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with not access."
    exit 1 #manuvally exit if error comes.
else
    echo "Your are super user."
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "installation of mysql failure"
    exit 1
else 
    echo "installation of mysql....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "installation of git failure"
    exit 1
else 
    echo "installation of git....SUCCESS"
fi

dnf install git -y


echo "this scrit proceding?"

