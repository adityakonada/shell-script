#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "You are not root user. Please run script with root access man"
else
     echo "You are Root user"
fi #fi means reverse of if condition, indicating to end if condition.

dnf install mysql -y