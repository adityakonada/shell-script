#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "the sum of $NUMBER1 AND $NUMBER2 is :$SUM"

echo " exit status of previous command, 0=success, !=0 --> failure:: $?"

echo " the script name is :: $0 "

echo "what is the nth argument :: $N"

echo "Give all arugments :: $@"

echo "How many arguents are passed? :: $#"