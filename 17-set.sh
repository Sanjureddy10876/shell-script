#!/bin/bash
set -e

failure() {

  echo "Failed at $1: $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

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

