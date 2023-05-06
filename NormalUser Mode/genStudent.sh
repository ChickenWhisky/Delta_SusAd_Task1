#!/bin/bash

file="/home"
chmod 700 /home/HAD

if [[ -d HAD ]];
then
	
	sudo useradd -m ${file}/GarnetA GarnetA;
	sudo useradd -m ${file}/GarnetB GarnetB;
	sudo useradd -m ${file}/Opal Opal;
	sudo useradd -m ${file}/Agate Agate;

	for 

	value=$(awk '{print $1$2}' ${file}/NormalUser\ Mode/genStudentDetails.txt )
	room_number=(0 0 0 0);
	room_occ_number=(0 0 0 0);
	for i in $value
	
	if []
		do
			    sudo useradd -m -d ${file}/${i:7:7}/${i:0:7} ${i:0:7}
		    	sudo touch ${file}/${i:7:7}/${i:0:7}/Transaction_History.txt
		done

	value=$(awk '{print $2}' ${file}/src/User_Accounts.txt | sort | uniq)
	for i in $value
	do
		sudo useradd -m -d ${file}/${i}/${i} ${i}_manager
		sudo touch ${file}/${i}/${i}/Branch_Transaction_History.txt
		sudo touch ${file}/${i}/${i}/Branch_Current_Balance.txt
		sudo wget -O ${file}/${i}/${i}/Daily_Interest_Rates.txt inductions.delta.nitt.edu/sysad-task1-Daily_Interest_Rates.txt
	done
else
fi

if [[  $# -eq 5 ]];
then
	sudo useradd -m -d ${file}/$2/$1 $1
	sudo touch ${file}/$2/$1/Transaction_History.txt
	sudo echo "500">${file}/$2/$1/Current_Balance.txt
	sudo echo "$1 $2 $3 $4 $5">>${file}/src/User_Accounts.txt
		
fi