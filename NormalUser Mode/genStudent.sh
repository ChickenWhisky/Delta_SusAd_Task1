#!/bin/bash

getDepartment() {
	local dep=$(cut --characters=2-3 <<< $rollno)
	case $dep in
		06) department="CSE";;
		02) department="CHE";;
		03) department="CIV";;
		07) department="EEE";;
		08) department="ECE";;
		10) department="ICE";;
		11) department="MEC";;
		12) department="MME";;
		14) department="PRO";;
		01) department="ARC";;
		*) echo "InvalidDept"
	esac
}
getYear() {
	local Year=$(cut --characters=5-6 <<< $rollno)
	local currentyear=$(date +%y)
	year=$(($currentyear-$Year+1))
}
addusers(){
 	sudo useradd -m -d /home/$hostel/$room/$name $name >/dev/null;echo "$name:password" | sudo chpasswd
   	getDepartment
	getYear
	sudo touch /home/$hostel/$room/$name/userDetails.txt
   	sudo touch /home/$hostel/$room/$name/fees.txt		
	echo 'name rollno department hostel year room allocated_mess month mess_preference' | sudo tee -a /home/$hostel/$room/$name/userDetails.txt >/dev/null
	echo $name" "$rollno" "$department" "$hostel" "$year" "$room" "$mess" - "$(date +%m)" "$messpref | sudo tee -a /home/$hostel/$room/$name/userDetails.txt >/dev/null			
	sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/messAllocation.sh /home/$hostel/$room/$name/messAllocation.sh
	sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/feeBreakup.sh /home/$hostel/$room/$name/feeBreakup.sh
	echo 'cumulativeAmountPaid= 0' | sudo tee -a /home/$hostel/$room/$name/fees.txt >/dev/null
	echo 'User '$name' has been generated'
}
addhostels(){
	
	sudo useradd -m -d /home/HAD HAD >/dev/null;echo "HAD:HAD" | sudo chpasswd
	sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/src/mess.txt /home/HAD/mess.txt
	sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/messAllocation.sh /home/HAD/messAllocation.sh

	for i in 'GarnetA' 'GarnetB' 'Opal' 'Agate'
	do  	
		sudo useradd -m -d  /home/$i $i;echo "$i:$i" | sudo chpasswd
		sudo touch /home/$i/announcments.txt
		sudo touch /home/$i/feeDefaulters.txt
	done
}
#Checks if hostel directories have been created
if [ ! -d /home/GarnetA ]
then

	addhostels
	while read -r name rollno hostel room mess messpref
	do
	#Checks if the hostel is valid then creates a new student user,its home directory,Userdetails.txt &fees.txt file
	if [ "$hostel" = "GarnetA" ] || [ "$hostel" = "GarnetB" ] || [ "$hostel" = "Opal" ] ||  [ "$hostel" = "Agate" ]
		then
		addusers
	else 
		continue
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
#Does the same as above except in this case we are adding student info after creation of hostel warden accounts
else
   	
 #Checks if the hostel valid then creates a new student user,its home directory,Userdetails.txt &fees.txt file
	if [ "$3" = "GarnetA" ] || [ "$3" = "GarnetB" ] || [ "$3" = "Opal" ] ||  [ "$3" = "Agate" ]
		then
		sudo useradd -m -d /home/$3/$4/$1 $1 >/dev/null;echo "$1:password" | sudo chpasswd
   		getDepartment
		getYear
		sudo touch /home/$3/$4/$1/userDetails.txt
   		sudo touch /home/$3/$4/$1/fees.txt		
		echo 'name rollno department hostel year room allocated_mess month mess_preference' | sudo tee -a /home/$3/$4/$1/userDetails.txt >/dev/null
		echo $1" "$2" "$department" "$3" "$year" "$4" "$5" - "$(date +%m)" "$6 | sudo tee -a /home/$3/$4/$1/userDetails.txt >/dev/null			
		sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/messAllocation.sh /home/$3/$4/$1/messAllocation.sh
		sudo cp /home/Delta_SusAd_Task1/NormalUser\ Mode/feeBreakup.sh /home/$3/$4/$1/feeBreakup.sh
		echo 'cumulativeAmountPaid= 0' | sudo tee -a /home/$3/$4/$1/fees.txt >/dev/null
		echo 'User '$1' has been generated'
	else 
		continue
	fi		
fi	
