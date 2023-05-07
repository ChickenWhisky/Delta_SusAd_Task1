#!/bin/bash

file="/home"

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
	case $year in
		22) echo 1;;
		21) echo 2;;
		20) echo 3;;
		19) echo 4;;
		18) echo 5;;
	esac
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
			echo $hostel
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
				echo "Its working"
		    	sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(echo "getDepartment $rollno")
				year= $(echo "getYear $rollno")
				sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo chmod	u+x	/home/$hostel/$room/Student1/userDetails.txt
				sudo echo "$name $rollno $year $department $hotel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
			elif[ ! -d /home/$hostel/$room/Student2 ]
			    then
				sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(echo "getDepartment $rollno")
				year= $(echo "getYear $rollno")
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo chmod	u+x	/home/$hostel/$room/Student1/userDetails.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt

		fi

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt
		fi	

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment $rollno)
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/$hostel/$room/Student $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt
		fi

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		if [ ! -d /home/$hostel/$room/Student1 ] 
			then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment $rollno)
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$$name $rollno $hostel $room $mess $messpref>>/home/$hostel/$room/Student2/userDetails.txt"
		fi
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

#Does the same as above except in this case we are adding student info after creation of hostel warden accounts

else
	

	while read -r name rollno hostel room mess messpref
	do
    	
	#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
		    	sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment())
				sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt				
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
			else
			    sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt

		fi

	#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt
		fi	

	#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
			if [ ! -d /home/$hostel/$room/Student1 ] 
				then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/$hostel/$room/Student $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student2/userDetails.txt
		fi

	#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		if [ ! -d /home/$hostel/$room/Student1 ] 
			then
			    sudo useradd -m -d /home/$hostel/$room/Student1 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student1/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/$hostel/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/$hostel/$room/Student2 $name
				department= $(getDepartment())
		    	sudo touch /home/$hostel/$room/Student2/userDetails.txt
		    	sudo touch /home/$hostel/$room/Student2/fees.txt
				sudo echo "$$name $rollno $hostel $room $mess $messpref>>/home/$hostel/$room/Student2/userDetails.txt"
		fi
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi	