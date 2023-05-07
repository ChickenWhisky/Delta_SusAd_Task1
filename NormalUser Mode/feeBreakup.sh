#!/bin/bash

echo "Which of the following fees has been paid (1/2/3/4)  :"
echo "1)Tuition Fee"
echo "2)Hostel Rent"
echo "3)Service Charge"
echo "4)Mess Fee"
read input
 
case $input in
    1) fee_type_paid="TuitionFee";;
    2) fee_type_paid="HostelRent";;
    3) fee_type_paid="ServiceCharge";;
    4) fee_type_paid="MessFee";;

# An Array created to store the Feetype and its respective percentage
readarray -t percentages < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/feeBreakup.txt

# Initialize cumulative fees array
declare -a fees=(0 0 0)

# Read fees.txt and update the cumulative fees
while read -r line; do
  # Skip empty lines and comments starting with #
  if [[ -z "$line" || "$line" =~ ^\#.*$ ]]; then
    continue
  fi
  # Split line by tab character and store values in variables
  IFS=$'\t' read -r -a values <<< "$line"
  # Calculate fees for each category and update cumulative fees array
  for i in "${!values[@]}"; do
    category_fee=$(echo "${percentages[i]} * ${values[i]}" | bc)
    fees[i]=$(echo "${fees[i]} + $category_fee" | bc)
  done
done < fees.txt

# Print cumulative fees and ask for payment amount
echo "Cumulative fees:"
echo "Category 1: ${fees[0]}"
echo "Category 2: ${fees[1]}"
echo "Category 3: ${fees[2]}"
echo -n "Enter payment amount: "
read payment

# Update fees.txt with cumulative fees and payment transaction
# Add current transaction to the top of the file
# Use date and time as transaction ID
transaction_id=$(date +"%Y%m%d%H%M%S")
transaction_line="$transaction_id"$'\t'"$payment"${fees[*]/%/\\n}
echo "$transaction_line" | cat - fees.txt > temp && mv temp fees.txt
