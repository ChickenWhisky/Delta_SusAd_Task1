#!/bin/bash

echo "Which of the following fees has been paid (1/2/3/4)  :"
echo "1)Tuition Fee"
echo "2)Hostel Rent"
echo "3)Service Charge"
echo "4)Mess Fee"
read input

user=$(whoami)
while read Name rollno Hostel Room mess messpref; do
    if [ "$user" = "$Name" ]; then
        hostel=$Hostel
        room=$Room
        name=$Name
    fi
done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
case $input in
1)
    fee_type_paid="TuitionFee"
    amountPaid=50
    ;;
2)
    fee_type_paid="HostelRent"
    amountPaid=20
    ;;
3)
    fee_type_paid="ServiceCharge"
    amountPaid=10
    ;;
4)
    fee_type_paid="MessFee"
    amountPaid=20
    ;;
esac

feeChecker=0
while read first second third fourth; do
    if [ "$fee_type_paid" = "$first" ]; then
        feeChecker=1
        break
    else
        continue
    fi
done <home/$hostel/$room/$name/fees.txt
if [ $feeChecker = 0 ]; then
    current_value=$(head -n 1 "/home/$hostel/$room/$name/fees.txt" | sed 's/cumulativeAmountPaid=//')
    echo $amountPaid $current_value $(($current_value + $amountPaid))
    new_value=$(($current_value + $amountPaid))

    transactionTime=$(date '+%Y-%m-%d %H:%M:%S')
    epochtime=$(date --date="$transactionTime" +"%s") #for some reason the space infront of the '+' matters

    # Update the first line of the file with the new value
    sed -i "1s/cumulativeAmountPaid=.*/cumulativeAmountPaid= $new_value/" "/home/$hostel/$room/$name/fees.txt"

    #Appends the latest transaction into the file
    echo "$fee_type_paid $amountPaid $transactionTime $epochtime" | tee -a /home/$hostel/$room/$name/fees.txt >/dev/null
    echo "$fee_type_paid "has successfully been paid
elif [ $feeChecker = 1 ]; then
    echo This fee has already been payed please try another option

fi
