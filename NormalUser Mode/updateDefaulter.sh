#!/bin/bash

user=$(whoami)
if [ "$user" = "HAD" ]; then
    countTo5=0
    while read name rollno hostel room mess messpref; do
        # Read the first line of the file
        firstLine=$(head -n 1 /home/$hostel/$room/$name/fees.txt)
        lastTransaction=$(tail -n 1 /home/$hostel/$room/$name/fees.txt)
        # Extract the number after "CummulativeAmount= "
        num=$(echo "$firstLine" | sed -n 's/^.*cumulativeAmountPaid= //p')
        read=$(echo $line | awk '{print $NF}')
        comparableTransaction=$(date --date="$read" +"%s")
        endOfSem=$(2023-06-10 00:00:00)
        endOfSemEpoch=$(date --date="$endOfSem" +"%s")

        # Check if the number is equal to 100
        if [ $num -eq 100 ] && [ $comparableTransaction -le $endOfSemEpoch ]; then
            echo "$name" | tee -a /home/$hostel/announcments.txt >/dev/null

        else
            if [ $countTo5 -l 5 ]; then
                echo "$name" | tee -a /home/$hostel/feeDefaulters.txt >/dev/null
                countTo5=$($countTo5+1)

            else
                continue
            fi
        fi
    done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
elif [ ! "$user" = "HAD" ]; then
    echo INVALID USER
fi
