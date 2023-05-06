#!/bin/bash

file="/home"


#Checks if HAD and hostel directories have been created(if HAD isnt created then the script hasnt generated other directories)

if [ ! -d GarnetA ];
then
	
	sudo useradd -m -d  /home/GarnetA GarnetA
	sudo useradd -m -d  /home/GarnetB GarnetB
	sudo useradd -m -d  /home/Opal Opal
	sudo useradd -m -d  /home/Agate Agate
	

#   value=$(awk '{print $1" "$2" "$3" "$4" "$5" "$6 }' /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt )
	#!/bin/bash
	IFS=" ";set -f
	while IFS= read name rollno hostel room mess messpref
	do
    	
#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
			if [ ! -d /home/GarnetA/$room/Student2 ] 
				then
		    	sudo useradd -m -d /home/GarnetA/$room/Student1 $name
				sudo touch /home/GarnetA/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student1/fees.txt				
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student1/userDetails.txt
			else
			    sudo useradd -m -d /home/GarnetA/$room/Student2 $name
		    	sudo touch /home/GarnetA/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student2/userDetails.txt

		fi

#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
			if [ ! -d /home/GarnetB/$room/Student2 ] 
				then
			    sudo useradd -m -d /home/GarnetB/$room/Student1 $name
		    	sudo touch /home/GarnetB/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/GarnetB/$room/Student2 $name
		    	sudo touch /home/GarnetB/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student2/userDetails.txt
		fi	

#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
			if [ ! -d /home/Opal/$room/Student2 ] 
				then
			    sudo useradd -m -d /home/Opal/$room/Student1 $name
		    	sudo touch /home/Opal/$room/Student1/userDetails.txt
		    	sudo touch /home/Opal/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/Opal/$room/Student $name
		    	sudo touch /home/Opal/$room/Student2/userDetails.txt
		    	sudo touch /home/Opal/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student2/userDetails.txt
		fi

#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		if [ ! -d /home/Agate/$room/Student2 ] 
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
				sudo echo "$$name $rollno $hostel $room $mess $messpref>>/home/Agate/$room/Student2/userDetails.txt"
		fi
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
else
	
	IFS=" ";set -f

	while IFS=: read name rollno hostel room mess messpref
	do
    	
	#Checks if the hostel is GarnetA then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	if [ "$hostel" = "GarnetA" ]
		then
			if [ ! -d /home/GarnetA/$room/Student2 ] 
				then
		    	sudo useradd -m -d /home/GarnetA/$room/Student1 $name
				sudo touch /home/GarnetA/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student1/fees.txt				
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student1/userDetails.txt
			else
			    sudo useradd -m -d /home/GarnetA/$room/Student2 $name
		    	sudo touch /home/GarnetA/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetA/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetA/$room/Student2/userDetails.txt

		fi

	#Checks if the hostel is GarnetB then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "GarnetB" ]
		then
			if [ ! -d /home/GarnetB/$room/Student2 ] 
				then
			    sudo useradd -m -d /home/GarnetB/$room/Student1 $name
		    	sudo touch /home/GarnetB/$room/Student1/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/GarnetB/$room/Student2 $name
		    	sudo touch /home/GarnetB/$room/Student2/userDetails.txt
		    	sudo touch /home/GarnetB/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/GarnetB/$room/Student2/userDetails.txt
		fi	

	#Checks if the hostel is Opal then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Opal" ]
		then
			if [ ! -d /home/Opal/$room/Student2 ] 
				then
			    sudo useradd -m -d /home/Opal/$room/Student1 $name
		    	sudo touch /home/Opal/$room/Student1/userDetails.txt
		    	sudo touch /home/Opal/$room/Student1/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student1/userDetails.txt
		else
			    sudo useradd -m -d /home/Opal/$room/Student $name
		    	sudo touch /home/Opal/$room/Student2/userDetails.txt
		    	sudo touch /home/Opal/$room/Student2/fees.txt
				sudo echo "$name $rollno $hostel $room $mess $messpref">>/home/Opal/$room/Student2/userDetails.txt
		fi

	#Checks if the hostel is Agate then creates a new student user,its home directory,Userdetails.txt &fees.txt file

	elif [ "$hostel" = "Agate" ]
		then
		if [ ! -d /home/Agate/$room/Student2 ] 
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
				sudo echo "$$name $rollno $hostel $room $mess $messpref>>/home/Agate/$room/Student2/userDetails.txt"
		fi
	fi	
	done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi	