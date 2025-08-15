#!bin/bash

SOURCE_DIR="/tmp/shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] 
#-d -> to check if the directory exists or not -f -> file exists or not
# ! denotes opposite
then
    echo -e "$R Source directory: $SOURCE_DIR does not exists. $N"
fi
#We have the responsibility to delete only the .log files & 14 days old, not every file in that folder. 
#So we should check the file type ( the below line )

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")
# find = searching #-type f = files (not folders) #-mtime = days  # -name "*.log" = files ending with .log name

#using while loop
#IFS == Internal Field Separator; 
while IFS= read -r line     #syntax to read line by line #while loop would read the output line by line
do
    echo "Deleting file: $line" #reading/diplaying the line 
    rm -rf $line #deleting the file #-r = recursive(including files inside) f=force
done <<< $FILES_TO_DELETE
# <<< giving the output of $FILES_TO_DELETE variable as INPUT to while loop