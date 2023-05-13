#!/bin/bash

# Imports required functions from the function.sh file
source /home/Delta_SusAd_Task1/SuperUser\ Mode/functions.sh

# Checks if the User is a Warden or a Student
user=$(whoami)
if [ "$user" = "GarentA" ] || [ "$user" = "GarentB" ] || [ "$user" = "Opal" ] || [ "$user" = "Agate" ]; then
    checker="Warden"
else
    while read Name Rollno Hostel Room Mess messpref; do
        if [ "$user" = "$Name" ]; then
            checker="student"
            name=$Name
            rollno=$Rollno
            hostel=$Hostel
            room=$Room
            mess=$Mess
            getDepartment
            getYear
            break
        else
            continue
        fi
    done </home/Delta_SusAd_Task1/SuperUser\ Mode/src/studentDetails.txt
fi

########################################  STUDENT SCRIPT  ##############################################

if [ "$checker" = "student" ]; then

    printf "\n                   SIGN OUT FORM \n\n"
    echo "Please enter the date you would like to return to the campus (!!Please enter the date in a yyyy-mm-dd format!!) :"

    while true; do
        read returnDate
        if [[ $input =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            break
        else
            echo Please enter a valid date
            continue
        fi
    done

    echo "$rollno $returnDate" >>"/home/$hostel/signOutRequests.txt" >/dev/nul



################################## HAD SCRIPT ###############################################

elif [ "$checker" = "Warden" ];then
    



fi
