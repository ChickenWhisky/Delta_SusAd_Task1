#!/bin/bash

file="/home"


#Checks if HAD and hostel directories have been created(if HAD isnt created then the script hasnt generated other directories)

if [ ! -d GarnetA ];
then
	
	sudo useradd -m -d  /home/GarnetA GarnetA
	sudo useradd -m -d  /home/GarnetB GarnetB
	sudo useradd -m -d  /home/Opal Opal
	sudo useradd -m -d  /home/Agate Agate
	
	room_occ_number=(0 0 0 0)

#   value=$(awk '{print $1" "$2" "$3" "$4" "$5" "$6 }' /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt )
	#!/bin/bash
	while IFS=  read name rollno hostel room mess messpref
	do
    	
#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
			if [[ room_occ_number[0] -eq 0 ]] 
				then
		    	sudo useradd -m -d /home/GarnetA/$room/Student1 $name
				sudo touch /home/GarnetA/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student1/fees.txt				
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student1/userDetails.txt
				room_occ_number[0]=1
			else
			    sudo useradd -m -d /home/GarnetA/$room/Student2 $name
		    	sudo touch /home/GarnetA/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student2/userDetails.txt

				room_occ_number[0]=0
				room_number[0]= $($room_number[0]+1)
		fi

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
			if [[ room_occ_number[1] -eq 0 ]] 
				then
			    sudo useradd -m -d /home/GarnetB/$room/Student1 $name
		    	sudo touch /home/GarnetB/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student1/userDetails.txt
				room_occ_number[1]=1
		else
			    sudo useradd -m -d /home/GarnetB/$room/Student2 $name
		    	sudo touch /home/GarnetB/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student2/userDetails.txt
				room_occ_number[1]=0
				room_number[1]= $($room_number[1]+1)
		fi	

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
			if [[ room_occ_number[2] -eq 0 ]] 
				then
			    sudo useradd -m -d /home/Opal/$room/Student1 $name
		    	sudo touch /home/Opal/$room/Student1/userDetails.txt
		    	sudo touch /home/Opal/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d /home/Opal/$room/Student $name
		    	sudo touch /home/Opal/$room/Student2/userDetails.txt
		    	sudo touch /home/Opal/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student2/userDetails.txt
				room_occ_number[2]=0
				room_number[2]= $($room_number[2]+1)	
		fi

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		if [[ room_occ_number[3] -eq 0 ]] 
			then
			    sudo useradd -m -d /home/Agate/$room/Student1 $name
		    	sudo touch /home/Agate/$room/Student1/userDetails.txt
		    	sudo touch /home/Agate/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Agate/$room/Student1/userDetails.txt
				room_occ_number[2]=1
		else
			    sudo useradd -m -d /home/Agate/$room/Student2 $name
		    	sudo touch /home/Agate/$room/Student2/userDetails.txt
		    	sudo touch /home/Agate/$room/Student2/fees.txt
				sudo echo "$$name $rollno $hostel $room $mess $messpref>>/home/Agate/$room/Student2/userDetails.txt
				room_occ_number[3]=0
				room_number[3]= $($room_number[3]+1)
		fi
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi	