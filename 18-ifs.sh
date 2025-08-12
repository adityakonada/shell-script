#!bin/bash

file=/etc/passwd

if [ ! -f $file ]
then 
    echo "the $file file does not exit "
else
    echo "found the file $file"
fi

while IFS=":" read -r f1 f2 f3 f4 f5 f6 f7 
do
    echo "username:$f1"
done < $file