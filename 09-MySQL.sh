#!/bin/bash

ID =$(id)

if [ $ID -gt 0 ]
then
    echo "You are not root user"
else
    echo "You are Root user"
fi