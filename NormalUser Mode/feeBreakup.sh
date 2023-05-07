#!/bin/bash

#For now the directory to which the script is refering to for the location of fees.txt


echo "Which of the following fees has been paid (1/2/3/4)  :"
echo "1)Tuition Fee"
echo "2)Hostel Rent"
echo "3)Service Charge"
echo "4)Mess Fee"
read input

#Some code to find the name and hostel of the student inorder to know which student is using the script 
#is a sample student just for the sake of testing but CHANGE IT TO JUST USERDETAILS.TXT LATER
while read line; do
    if [ "$(awk '{print $1}')" = "name" ]
    then 
        continue
    else
        name=$(echo "$line" | awk '{print $1}')
        hostel=$(echo "$line" | awk '{print $3}')
        room=$(echo "$line" | awk '{print $5}')
    fi
done < /home/GarnetA/0/Jennee/user.Details
#done < userDetails.txt
 
case $input in
    1) fee_type_paid="TuitionFee";;
    2) fee_type_paid="HostelRent";;
    3) fee_type_paid="ServiceCharge";;
    4) fee_type_paid="MessFee";;
    esac

# /home/Delta_SusAd_Task1/NormalUser\ Mode/src/feeBreakup.txt 
while read line;do
    if [ "$(awk '{print $1}')" = "$fee_type_paid" ];then
        amountPaid=$(echo "$line" | awk '{print $2}')   
    fi
done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/feeBreakup.txt
current_value=$(head -n 1 "/home/$hostel/$room/$name/fees.txt" | sed 's/cumulativeAmountPaid=//')

new_value=$(($current_value+$increment))

# Update the first line of the file with the new value
sed -i "1s/cumulativeAmountPaid=.*/cumulativeAmountPaidl=$new_value/" "/home/$hostel/$room/$name/fees.txt"
echo "$fee_type_paid $amountPaid" | sudo tee -a /home/$hostel/$room/$name/fees.txt 	
