#!/bin/bash

RAM_USAGE=$(free -m | grep Mem)
RAM_THRESHLOUD=80
MESSAGE=""

while IFS= read -r line; 
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    RAM_USED=$(echo "$line" | awk '{print $3}')
   
    if [ $USAGE -ge $RAM_THRESHLOUD ] 
    then
        MESSAGE+="RAM usage is more than $RAM_THRESHOLD%, Current usage: $RAM_USAGE\n"
    fi
done <<< $RAM_USAGE

echo -e "Message : $MESSAGE"    

echo "$MESSAGE" | mail -s "Alret from Ram Usage" srikarpochampally117@gmail.com

# echo "body" | mail -s "subject" to-address


