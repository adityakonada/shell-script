#!/bin/bash

ID =$(id -u)

if [ $ID -gt 0 ]
then
    echo "You are not root user"
else
    echo "You are Root user"
fi