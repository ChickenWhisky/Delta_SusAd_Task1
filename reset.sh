#!/bin/sh
#A script to automate the deletion process for the sake of testing

sudo rm -r /home/Delta_SusAd_Task1
sudo rm -r /home/Agate
sudo rm -r /home/Opal
sudo rm -r /home/GarnetA
sudo rm -r /home/GarnetB
sudo rm -r /home/HAD

sudo userdel Agate
sudo userdel Opal
sudo userdel GarnetA
sudo userdel GarnetB
sudo userdel HAD

while read name rollno hostel room mess messpref
do
    sudo userdel $name

done < /home/thomas/Desktop/Sysad/Task1/NormalUser\ Mode/src/studentDetails.txt
