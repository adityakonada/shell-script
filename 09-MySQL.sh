#!/bin/bash

ID =$(id)

if [ $ID -ne 0 ]
then
    echo "You are not root user. Please run script with root access man"
else
     echo "You are Root user"
fi