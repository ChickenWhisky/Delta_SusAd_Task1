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
	echo $hostel
	echo "Its working"
 	sudo useradd -m -d /home/$hostel/$room/$name $name
   	department= $(echo "getDepartment $rollno")
	echo $department
	year= $(echo "getYear $rollno")
	month=date +%m
	sudo touch /home/$hostel/$room/$name/userDetails.txt
   	sudo touch /home/$hostel/$room/$name/fees.txt		
	echo 'name rollno hostel year room mess allocated_mess month mess_preference' | sudo tee -a /home/$hostel/$room/$name/userDetails.txt		
	echo $name" "$rollno" "$hostel" "$year" "$room" "$mess" - "$month" "$messpref | sudo tee -a /home/$hostel/$room/$name/userDetails.txt			
}


#Checks if hostel directories have been created

if [ ! -d GarnetA ];
then
	
	sudo useradd -m -d  /home/GarnetA GarnetA
	sudo useradd -m -d  /home/GarnetB GarnetB
	sudo useradd -m -d  /home/Opal Opal
	sudo useradd -m -d  /home/Agate Agate
	
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