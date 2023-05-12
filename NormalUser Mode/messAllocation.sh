#!/bin/bash

user=$(whoami)
#
echo "$user"
#
if [ "$user" = "HAD" ]; then
    checker="HAD"
    #
    echo $checker
    #
else
    while read name rollno hostel room mess messpref; do
        if [ "$user" = "$name" ]; then
            checker="student"
            #
            echo $checker
            #
            break
        else
            continue
        fi
    done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi

########################################  STUDENT SCRIPT  ##############################################
declare -a capcityarray=(0 0 0)
#
echo "$checker"
echo "${capcityarray[0]}"
#
if [ "$checker" = "student" ]; then
    echo "Mess Capacity"
    while read -r MESS capacity; do
        if [ $MESS = 1 ]; then
            echo "$MESS $capacity"
            capcityarray[0]=$capacity
        elif [ $MESS = 2 ]; then
            echo "$MESS $capacity"
            capcityarray[1]=$capacity
        elif [ $MESS = 3 ]; then
            echo "$MESS $capacity"
            capcityarray[2]=$capacity
            break
        elif [ "$MESS" = "Mess" ]; then
            continue
        fi
    done < /home/HAD/mess.txt

    #
    echo "${capcityarray[0]}"
    echo "${capcityarray[1]}"
    echo "${capcityarray[2]}"
    #

    echo Please enter your mess preference as a '3' digit numeral where each digit corresponds to the mess number

    while true; do
        read Messpreference
        if [ "$Messpreference" = "123" ] || [ "$Messpreference" = "132" ] || [ "$Messpreference" = "213" ] || [ "$Messpreference" = "231" ] || [ "$Messpreference" = "321" ] || [ "$Messpreference" = "312" ]; then
            break

        else
            echo Invalid preference order. Please enter a valid preference order
        fi
    done
    echo "$rollno $Messpreference" >>/home/HAD/mess.txt

################################  HAD SCRIPT  ##############################################

elif [ "$checker" = "HAD" ]; then
    sed -n '6   ,$ p' /home/HAD/mess.txt | while read rollno pref; do
        prefarray=($(echo $pref | sed 's/\(.\)/\1 /g'))
        while read Name Rollno Hostel Room Mess Messpref; do
            if [ "$Rollno" = "$rollno" ]; then
                name=$Name
                room=$Room
                hostel=$Hostel
                break
            else
                continue
            fi
        done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

        while read NAME ROLLNO DEPARMENT HOSTEL YEAR ROOM ALLOCATED_MESS MONTH MESS_PREFERENCE; do
            if [ "$NAME" = "name" ]; then
                continue
            else
                department=$DEPARMENT
                year=$YEAR
                month=$MONTH
                mess_preference=$MESS_PREFERENCE
            fi

        done </home/$hostel/$room/$name/.userDetails.txt

        if [ ${capcityarray[$((${prefarray[0]} - 1))]} -gt 0 ]; then
            echo "name rollno department hostel year room allocated_mess month mess_preference" >>"/home/$hostel/$room/$Name/userDetails.txt"
            echo "$name $rollno $department $hostel $year $room ${prefarray[0]} $month $Messpreference" >>"/home/$hostel/$room/$Name/userDetails.txt"
            capcityarray[$((${prefarray[0]} - 1))]=$((${capcityarray[$((${prefarray[0]} - 1))]} - 1))
        elif [ ${capcityarray[$((${prefarray[1]} - 1))]} -gt 0 ]; then
            echo "name rollno department hostel year room allocated_mess month mess_preference" >>"/home/$hostel/$room/$Name/userDetails.txt"
            echo "$name $rollno $department $hostel $year $room ${prefarray[1]}_mess $month $Messpreference " >>"/home/$hostel/$room/$Name/userDetails.txt"
            capcityarray[$((${prefarray[1]} - 1))]=$((${capcityarray[$((${prefarray[1]} - 1))]} - 1))
        else
            echo "name rollno department hostel year room allocated_mess month mess_preference" >>"/home/$hostel/$room/$Name/userDetails.txt"
            echo "$name $rollno $department $hostel $year $room ${prefarray[2]} $month $Messpreference" >>"/home/$hostel/$room/$Name/userDetails.txt"
            capcityarray[$((${prefarray[2]} - 1))]=$((${capcityarray[$((${prefarray[2]} - 1))]} - 1))
        fi
    done

fi
