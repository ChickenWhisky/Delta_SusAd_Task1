#!/bin/bash
source /home/Delta_SusAd_Task1/NormalUser\ Mode/functions.sh
#Checks if hostel directories have been created
if [ ! -d "/home/GarnetA" ]; then

	addhostels
	while read -r name rollno hostel room mess messpref; do
		#Checks if the hostel is valid then creates a new student user,its home directory,Userdetails.txt &fees.txt file
		if [ "$hostel" = "GarnetA" ] || [ "$hostel" = "GarnetB" ] || [ "$hostel" = "Opal" ] || [ "$hostel" = "Agate" ]; then
			addusers
		else
			continue
		fi
	done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
#Does the same as above except in this case we are adding student info after creation of hostel warden accounts
else

	#Checks if the hostel valid then creates a new student user,its home directory,Userdetails.txt &fees.txt file
	if [ "$3" = "GarnetA" ] || [ "$3" = "GarnetB" ] || [ "$3" = "Opal" ] || [ "$3" = "Agate" ]; then
		sudo useradd -m -d /home/$3/$4/$1 $1 >/dev/null
		echo "$1:password" | sudo chpasswd
		getDepartment
		getYear
		sudo touch /home/$3/$4/$1/userDetails.txt
		sudo touch /home/$3/$4/$1/fees.txt
		echo 'name rollno dep hostel year room allocated_mess month mess_preference' | sudo tee -a /home/$3/$4/$1/userDetails.txt >/dev/null
		echo $1" "$2" "$department" "$3" "$year" "$4" "$5" - "$(date +%m)" "$6 | sudo tee -a /home/$3/$4/$1/userDetails.txt >/dev/null
		sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/messAllocation.sh /home/$3/$4/$1/messAllocation.sh
		sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/feeBreakup.sh /home/$3/$4/$1/feeBreakup.sh
		echo 'cumulativeAmountPaid= 0' | sudo tee -a /home/$3/$4/$1/fees.txt >/dev/null
		echo "User '$1' has been generated"
	fi
fi
