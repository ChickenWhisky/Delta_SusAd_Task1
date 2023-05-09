#!/bin/bash

#Write the scripts in two parts based on who is logging in 


#This loop changes a variable based on who is logging in. If the user is a student then checker='student'.If HAD then checker='HAD'

if [ "$(whomai)" = "HAD" ];then
    checker='student'
else
    while read -r name rollno hostel room mess messpref
        do
            if [ "$(whoami)" = "$name" ];then
                checker=1
                rollnumber=$rollno
                break
            #elif ["$(whomai)"="$hostel"];then;checker=1;break;
        fi    
        done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
fi

################################  STUDENT SCRIPT  ##############################################
capcityarray= (0 0 0)

if [ "$checker"="student" ];then
    
    while read mess capacity;do
        echo $mess"/t"$capacity
        
        if [ "$mess"="3" ];then
            break
     fi
   
    echo Please enter your mess preference as a '3' digit numeral where each digit corresponds to the mess number
   
    while [ 1 -le 0 ] 
        read messpreference
        if [ "$messpreference"="123" || "$messpreference"="132" || "$messpreference"="213" || "$messpreference"="231" ||"$messpreference"="321" || "$messpreference"="312" ]
        then
            break
        
        else
            echo Invalid preference order. Please enter a valid preference order

    echo $rollnumber $messpreference >> /home/HAD/mess.txt

################################  HAD SCRIPT  ##############################################
else
    while read name rollno department hostel year room allocated_mess month mess_preference;do
        
        if [ "$name"="name" ];then
            continue
        
        else
            break
    done < /home/$hostel/$room/$name/userDetails.txt
   
    while read mess capacity;do        

        case mess in
            1) capcityarray[0]= $capacity;;
            2) capcityarray[1]= $capacity;;
            3) capcityarray[2]= $capacity;;
            Mess) continue;;
            *) break;; 
        esac
    done > /home/HAD/mess.txt
    sed -n '6   ,$ p' /home/HAD/mess.txt | while read rollno pref
    do
        prefarray=($(echo $foo|sed  's/\(.\)/\1 /g'))
        if [ if $capcityarray[(($prefarray[0]-1))] -g 0 ];then 
            echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$name/userDetails.txt"             
            echo "$name $rollno $department $hostel $year $room $allocated_mess $month $prefarray[0]" >> "/home/$hostel/$room/$name/userDetails.txt"
        elif [ if $capcityarray[(($prefarray[0]-1))] -g 0 ];then 
            echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$name/userDetails.txt"             
            echo "$name $rollno $department $hostel $year $room $allocated_mess $month $prefarray[1]" >> "/home/$hostel/$room/$name/userDetails.txt"
        else 
            echo "name rollno department hostel year room allocated_mess month mess_preference" >> "/home/$hostel/$room/$name/userDetails.txt"             
            echo "$name $rollno $department $hostel $year $room $allocated_mess $month $prefarray[2]" >> "/home/$hostel/$room/$name/userDetails.txt"    
    done
    
    
    
    
    echo "text" >> 'Users/Name/Desktop/TheAccount.txt'
