#!/bin/sh

sudo rm -r /home/Delta_SusAd_Task1
sudo rm -r /home/Agate
sudo rm -r /home/Opal
sudo rm -r /home/GarnetA
sudo rm -r /home/GarnetB

sudo userdel Agate
sudo userdel Opal
sudo userdel GarnetA
sudo userdel GarnetB

while read -r name 
do
    if [ $name != "Name"  ]
    then
        sudo userdel $name
    fi

done < /home/thomas/Desktop/Sysad/Task1/NormalUser\ Mode/src/studentDetails.txt
