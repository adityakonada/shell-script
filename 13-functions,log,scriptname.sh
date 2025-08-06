#!/bin/bash

ID=$(id -u)

echo "$0 ::  is the script-name"
VALIDATE(){
    if [ $1 -ne 0 ] #$1 =argument 1 comes from below - line 26
    then 
        echo "ERROR:: $2 Installing is failed" #$2 =argument 2 comes from below - line 26
        exit 1 #random number other than 0
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

VALIDATE $? "MySQL" #here, we are passing 2 arguments into function
# $1 = argument 1 = $? --> status of previous command (if 0=sucess, not 0= fail) --> status of dnf install mysql -y
# $2 = argument 2 = "Mysql"

dnf install git -y 

VALIDATE $? "GIT"

