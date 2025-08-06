#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "You are not root user. Please run script with root access man"
    exit 7 # you are asking program to exit from here, do not process further. You can give any number other than 0
else
     echo "You are Root user"
fi #fi means reverse of if condition, indicating to end if condition.

dnf install mysqllll -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: Installing MySQL is failed"
    exit 1 #random number other than 0
else
    echo "MySQL installing is success"
fi
