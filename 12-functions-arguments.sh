#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2 Installing is failed"
        exit 2 #random number other than 0
    else
        echo " $2 Installing is success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "You are not root user. Please run script with root access man"
    exit 1 # you are asking program to exit from here, do not process further.
            # You can give any number other than 0
else
     echo "You are Root user"
fi #fi means reverse of if condition, indicating to end if condition.

dnf install mysql -y

VALIDATE $? "MySQL"

dnf install git -y

VALIDATE $? "GIT"

