#!/bin/bash

#Write the scripts in two parts based on who is logging in 


#This loop changes a variable based on who is logging in. If the user is a student then checker='student'.If HAD then checker='HAD'

user=$(whoami)
if [ "$user" = "HAD" ];then
    checker='HAD'
else
    while read  name rollno hostel room mess messpref
        do
            if [ "$user" = "$name" ];then
                checker="student"
                break
            #elif ["$(whomai)"="$hostel"];then;checker=1;break;
            fi    
        done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi

################################  STUDENT SCRIPT  ##############################################
declare -a capcityarray=(0 0 0)

if [ "$checker" = "student" ];then
    
    while read mess capacity;do
        echo $mess"/t"$capacity
        
        if [ "$mess" = "3" ];then
            break
        fi
    done > /home/HAD/mess.txt
   
    echo Please enter your mess preference as a '3' digit numeral where each digit corresponds to the mess number
   
    while [ 1 -le 0 ];do 
        read messpreference
        if [ "$messpreference" = "123" ] || [ "$messpreference" = "132" ] || [ "$messpreference" = "213" ] || [ "$messpreference" = "231" ] ||[ "$messpreference" = "321" ] || [ "$messpreference" = "312" ]
        then
            break
        
        else
            echo Invalid preference order. Please enter a valid preference order
        fi
    done
    echo $rollno $messpreference >> /home/HAD/mess.txt

################################  HAD SCRIPT  ##############################################
else
    while read  name rollno hostel room mess messpref
    do    
        while read Name Rollno Department Hostel Year Room Allocated_mess Month Mess_preference
        do
        if [ "$Name" = "$name" ]
        then
   
        while read MESS capacity
        do        

            case $MESS in
                1) capcityarray[0]=$capacity;;
                2) capcityarray[1]=$capacity;;
                3) capcityarray[2]=$capacity;;
                Mess) continue;;
                *) break;; 
            esac
        done > /home/HAD/mess.txt
        sed -n '6   ,$ p' /home/HAD/mess.txt | while read rollno pref
        do
            prefarray=($(echo $pref|sed  's/\(.\)/\1 /g'))
            if [ ${capcityarray[$((${prefarray[0]}-1))]} -g 0 ];then 
                echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$Name/userDetails.txt"             
                echo "$Name $Rollno $Department $hostel $year $room ${prefarray[0]} $month $Messpreference" >> "/home/$hostel/$room/$Name/userDetails.txt"
                capcityarray[$(( ${prefarray[0]}-1 ))]= ${capcityarray[$(( ${prefarray[0]}-1 ))]}-1
            elif [ ${capcityarray[$((${prefarray[1]}-1))]} -g 0 ];then 
                echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$Name/userDetails.txt"             
                echo "$Name $rollno $department $hostel $year $room ${prefarray[1]}_mess $month $messpreference " >> "/home/$hostel/$room/$Name/userDetails.txt"
                capcityarray[$((${prefarray[1]}-1))]= ${capcityarray[$((${prefarray[1]}-1))]}-1

            else 
                echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$Name/userDetails.txt"             
                echo "$Name $rollno $department $hostel $year $room ${prefarray[2]} $month $messpreference" >> "/home/$hostel/$room/$Name/userDetails.txt"    
                capcityarray[$((${prefarray[2]}-1))]=${capcityarray[$((${prefarray[2]}-1))]}-1
    
            fi
        done
        else
            continue
        fi
        done < /home/$hostel/$room/$name/.userDetails.txt

    done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

fi
    
    
    
    
