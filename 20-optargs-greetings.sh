#!/bin/bash

NAME=""
WISHES="Good Morning"

USAGE(){    #function
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>" #basename-removes the path (/home/centos/shelll-etc..) #$0 - script name
    echo "Options::"
    echo " -n, Specify the name (mandatory)"
    echo " -w, Specify the wishes. (Optional). Default is Good Morning"
    echo " -h, Display Help and exit"
}

while getopts ":n:w:h" opt; do
    case $opt in    #cases as n w h
        n) NAME="$OPTARG";; # This means if the option is -n, store its value ($OPTARG) in NAME.
        w) WISHES="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;; # The \? case means the option is not valid; print error and usage, and exit.
        :) USAGE; exit;; # This runs if a required argument is missing for an option. Example: -n was given but without a name.
        h) USAGE; exit;;
    esac #oppsite of case
done

#option 1:
#if [ -z "$NAME" ] || [ -z "$WISHES" ]; 
#then
#echo "ERROR: Both -n and -w are mandatory options."

#option2:
if [ -z "$NAME" ]; then # now wishes is optional
    
    echo "ERROR: -n is mandatory."
    USAGE
    exit 1
fi

echo "Hello $NAME. $WISHES. I have been learning Shell Script."

#line 25:
#-z "$NAME" → This checks if the string NAME is empty (length zero).
#If NAME was never set (no -n option given), it will:
#Print an error that -n is mandatory.
#Show the usage instructions.
#Exit with status 1 (meaning error).