#!/bin/bash

echo "please enter your username"

read -s USERNAME 
#the value entered above will be automatically attached to username variable

echo "please enter your password"
read -s PASSWORD

echo "User name is : $USERNAME"
echo "Password is : $PASSWORD"
#you should not print/echo the user n password, doing it here just to valiadate