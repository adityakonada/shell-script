#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "You are not root user. Please run script with root access man"
    exit 7 # you are asking program to exit from here, do not process further. 
else
     echo "You are Root user"
fi #fi means reverse of if condition, indicating to end if condition.

dnf install mysql -y