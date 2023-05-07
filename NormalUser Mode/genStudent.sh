#!/bin/bash


#Functions

getDepartment() {
	local dep=$(cut --characters=2-3 <<< $rollno)
	case $dep in
		06) echo "CSE";;
		02) echo "CHE";;
		03) echo "CIV";;
		07) echo "EEE";;
		08) echo "ECE";;
		10) echo "ICE";;
		11) echo "MEC";;
		12) echo "MME";;
		14) echo "PRO";;
		01) echo "ARC";;
		*) echo "InvalidDept"
	esac

}
getYear() {
	local year=$(cut --characters=5-6 <<< $rollno)
	local currentyear=$(date +%y)
	echo $(($currentyear-$year+1))
}
addusers(){
 	sudo useradd -m -d /home/$hostel/$room/$name $name
   	local department= $(echo "getDepartment $rollno")
	local year= $(echo "getYear $rollno") 
	sudo touch /home/$hostel/$room/$name/userDetails.txt
   	sudo touch /home/$hostel/$room/$name/fees.txt		
	echo 'name rollno hostel year room mess allocated_mess month mess_preference' | sudo tee -a /home/$hostel/$room/$name/userDetails.txt 2>/dev/null
	echo $name" "$rollno" "$hostel" "$year" "$room" "$mess" - "$(date +%m)" "$messpref | sudo tee -a /home/$hostel/$room/$name/userDetails.txt 2>/dev/null			
	echo 'cumulativeAmountPaid= 0' | sudo tee -a /home/$hostel/$room/$name/fees.txt 2>/dev/null	
}
addhostels(){
	
	sudo mv src/mess.txt /home/HAD
	for i in 'GarnetA' 'GarnetB' 'Opal' 'Agate'
	do 
	sudo useradd -m -d  /home/$i $i
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
	#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
		echo helloo
		addusers

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
		addusers
		

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
		addusers

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		addusers

	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

#Does the same as above except in this case we are adding student info after creation of hostel warden accounts

else
	

	while read -r name rollno hostel room mess messpref
	do
    	
#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
		addusers
#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
		addusers

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
		addusers
#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		addusers

	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi	
