#!/bin/bash

while -r read name rollno hostel room mess messpref
do
    if [ $room=0 ] || [ $room=2 ] || [ $room=4 ] || [ $room=6 ]
    then
        sudo c
    elif [ $room=1 ] || [ $room=3 ] || [ $room=5 ] || [ $room=7 ]
    then
    else
done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt
