#!/bin/bash

file="/home"
sudo useradd -m -d /home/HAD HAD
cd /home/HAD

#Checks if HAD and hostel directories have been created(if HAD isnt created then the script hasnt generated other directories)

if [ ! -d GarnetA ];
then
	
	sudo useradd -m ${file}/GarnetA GarnetA
	sudo useradd -m ${file}/GarnetB GarnetB
	sudo useradd -m ${file}/Opal Opal
	sudo useradd -m ${file}/Agate Agate
	
	room_number=(0 0 0 0)
	room_occ_number=(0 0 0 0)

	for value=$(awk '{print $1$2}' ${file}/NormalUser\ Mode/genStudentDetails.txt )
	do

	for i in $value
	do
#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [[ $3 == "GarnetA" ]]
		then
			if [[ room_occ_number[0]=0 ]] 
				then
			    sudo useradd -m -d ${file}/GarnetA/${room_number[0]}/
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student1/userDetails.txt
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetA/${room_number[0]}/Student1/userDetails.txt
				room_occ_number[0]=1
			else
			    sudo useradd -m -d ${file}/GarnetA/${room_number[0]}/
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student2/userDetails.txt
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetA/${room_number[0]}/Student2/userDetails.txt

				room_occ_number[0]=0
				room_number[0]=awk [room_number[0]+1]
		fi

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [[ $3 == "GarnetB" ]]
		then
			if [[ room_occ_number[1]=0 ]] 
				then
			    sudo useradd -m -d ${file}/GarnetB/${room_number[1]}/
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student1/userDetails.txt
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetB/${room_number[1]}/Student1/userDetails.txt
				room_occ_number[1]=1
		else
			    sudo useradd -m -d ${file}/GarnetB/${room_number[1]}/
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student2/userDetails.txt
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetB/${room_number[1]}/Student2/userDetails.txt
				room_occ_number[1]=0
		fi	

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [[ $3 == "Opal" ]]
		then
			if [[ room_occ_number[2]=0 ]] 
				then
			    sudo useradd -m -d ${file}/Opal/${room_number[2]}/
		    	sudo touch ${file}/Opal/${room_number[2]}/Student1/userDetails.txt
		    	sudo touch ${file}/Opal/${room_number[2]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Opal/${room_number[2]}/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d ${file}/Opal/${room_number[2]}/
		    	sudo touch ${file}/Opal/${room_number[2]}/Student2/userDetails.txt
		    	sudo touch ${file}/Opal/${room_number[2]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Opal/${room_number[2]}/Student2/userDetails.txt
				room_occ_number[2]=0	
		fi

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	else
		if [[ room_occ_number[3]=0 ]] 
			then
			    sudo useradd -m -d ${file}/Agate/${room_number[3]}/
		    	sudo touch ${file}/Agate/${room_number[3]}/Student1/userDetails.txt
		    	sudo touch ${file}/Agate/${room_number[3]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Agate/${room_number[3]}/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d ${file}/Agate/${room_number[3]}/
		    	sudo touch ${file}/Agate/${room_number[3]}/Student2/userDetails.txt
		    	sudo touch ${file}/Agate/${room_number[3]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Agate/${room_number[3]}/Student2/userDetails.txt
				room_occ_number[3]=0
		fi	
	done
fi	

	
	
#	value=$(awk '{print $2}' ${file}/src/User_Accounts.txt | sort | uniq)
#	for i in $value
#	do
#		sudo useradd -m -d ${file}/${i}/${i} ${i}_manager
#		sudo touch ${file}/${i}/${i}/Branch_Transaction_History.txt
#		sudo touch ${file}/${i}/${i}/Branch_Current_Balance.txt
#		sudo wget -O ${file}/${i}/${i}/Daily_Interest_Rates.txt inductions.delta.nitt.edu/sysad-task1-Daily_Interest_Rates.txt
#	done
#else
#fi

#if [[  $# -eq 5 ]];
#then
#	sudo useradd -m -d ${file}/$2/$1 $1
#	sudo touch ${file}/$2/$1/Transaction_History.txt
#	sudo echo "500">${file}/$2/$1/Current_Balance.txt
#	sudo echo "$1 $2 $3 $4 $5">>${file}/src/User_Accounts.txt
		
#fi