#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File') 

#Filesystem     Type      Size  Used Avail Use% Mounted on --> output for the command --> df -hT | grep -vE 'tmp|file'
#/dev/nvme0n1p1 xfs        10G  1.9G  8.2G  19% /

#finding the volumes -vE : show results without tmp or file files in results ( shows only the volumes/disks)

DISK_THRESHOLD=1 # instead of 70% usage, we are giving only 1 % to trigger
message="" # first place holder for message

while IFS= read line #--> reading the first line from the above output
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)  # output --> Use /n 19

    #echo $line = first line of output is read as IFS is given
    # awk =space in the output -between type and size ask chatgpt; 
    #$6F is the 6th fragment that is the column for disk usage % output = 19%
    #cut -d % -f1 ( we are cutting and taking the value before % i.e. 19)

    partition=$(echo $line | awk '{print $1F}') # 1st fragment is name of disk  /dev/nvme0n1p1
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition: $usage <br>" 
        #+= is giving so the 2nd line in loop will be appended to msg, not replace 
        # <br> -> break or new line in html ( as this is being sent in mail & mail will be html format)
    fi
done <<< $DISK_USAGE #giving disk_usage output as input to while loop

echo -e "Message: $message"

#echo "$message" | mail -s "High Disk Usage" adityakonada7@gmail.com

sh mail.sh "DevOps Team" "High Disk Usage" "$message" "adityakonada7@gmail.com" "ALERT High Disk Usage"