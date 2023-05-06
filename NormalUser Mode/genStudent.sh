#!/bin/bash

file="/home"


#Checks if HAD and hostel directories have been created(if HAD isnt created then the script hasnt generated other directories)

if [ ! -d GarnetA ];
then
	
	sudo useradd -m -d  ${file}/GarnetA GarnetA
	sudo useradd -m -d  ${file}/GarnetB GarnetB
	sudo useradd -m -d  ${file}/Opal Opal
	sudo useradd -m -d  ${file}/Agate Agate
	
	room_number=(0 0 0 0)
	room_occ_number=(0 0 0 0)

	value=$(awk '{print $1" "$2" "$3" "$4" "$5" "$6 }' ${file}/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt )
	for i in $value
	do
#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$3" = "GarnetA" ]
		then
			if [[ room_occ_number[0] -eq 0 ]] 
				then
		    	sudo useradd -m -d ${file}/GarnetA/${room_number[0]}/Student1 $1
				sudo touch ${file}/GarnetA/${room_number[0]}/Student1/userDetails.txt
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student1/fees.txt				
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetA/${room_number[0]}/Student1/userDetails.txt
				room_occ_number[0]=1
			else
			    sudo useradd -m -d ${file}/GarnetA/${room_number[0]}/Student2 $1
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student2/userDetails.txt
		    	sudo touch ${file}/GarnetA/${room_number[0]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetA/${room_number[0]}/Student2/userDetails.txt

				room_occ_number[0]=0
				room_number[0]= $($room_number[0]+1)
		fi

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$3" = "GarnetB" ]
		then
			if [[ room_occ_number[1] -eq 0 ]] 
				then
			    sudo useradd -m -d ${file}/GarnetB/${room_number[1]}/Student1 $1
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student1/userDetails.txt
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetB/${room_number[1]}/Student1/userDetails.txt
				room_occ_number[1]=1
		else
			    sudo useradd -m -d ${file}/GarnetB/${room_number[1]}/Student2 $1
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student2/userDetails.txt
		    	sudo touch ${file}/GarnetB/${room_number[1]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/GarnetB/${room_number[1]}/Student2/userDetails.txt
				room_occ_number[1]=0
				room_number[1]= $($room_number[1]+1)
		fi	

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$3" = "Opal" ]
		then
			if [[ room_occ_number[2] -eq 0 ]] 
				then
			    sudo useradd -m -d ${file}/Opal/${room_number[2]}/Student1 $1
		    	sudo touch ${file}/Opal/${room_number[2]}/Student1/userDetails.txt
		    	sudo touch ${file}/Opal/${room_number[2]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Opal/${room_number[2]}/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d ${file}/Opal/${room_number[2]}/Student $1
		    	sudo touch ${file}/Opal/${room_number[2]}/Student2/userDetails.txt
		    	sudo touch ${file}/Opal/${room_number[2]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Opal/${room_number[2]}/Student2/userDetails.txt
				room_occ_number[2]=0
				room_number[2]= $($room_number[2]+1)	
		fi

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$3" = "Agate" ]
		then
		if [[ room_occ_number[3] -eq 0 ]] 
			then
			    sudo useradd -m -d ${file}/Agate/${room_number[3]}/Student1 $1
		    	sudo touch ${file}/Agate/${room_number[3]}/Student1/userDetails.txt
		    	sudo touch ${file}/Agate/${room_number[3]}/Student1/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Agate/${room_number[3]}/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d ${file}/Agate/${room_number[3]}/Student2 $1
		    	sudo touch ${file}/Agate/${room_number[3]}/Student2/userDetails.txt
		    	sudo touch ${file}/Agate/${room_number[3]}/Student2/fees.txt
				sudo echo "$1 $2 $3 $4 $5 $6">>${file}/Agate/${room_number[3]}/Student2/userDetails.txt
				room_occ_number[3]=0
				room_number[3]= $($room_number[3]+1)
		fi
	fi	
	done
fi	