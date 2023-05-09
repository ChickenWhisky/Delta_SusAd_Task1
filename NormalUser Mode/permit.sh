#!/bin/bash

#add all wardens to the primary groups of each student in their hostel and change each students group permissions to rwx(DONE)
#add add HAD to the primary groups of each student and change those group permissions to rwx(DONE)
#add all students their Wardens Primary group (DONE)
#change permissions using ACL for announcment.txt,feeDefaulter.txt by allowing people of the warden group to access it(DONE)
#add all students to HAD's group and give them access to mess.txt in HAD file using ACL(DONE)


while read -r name rollno hostel room mess messpref
do
    sudo usermod -a -G $hostel $name
    sudo usermod -a -G HAD $name
    sudo usermod -a -G $name $hostel
    sudo usermod -a -G $name HAD
    sudo chmod g=rwx /home/$hostel/$room/$name
    sudo setfacl -m "g:$name:rwx" /home/$hostel/$room/$name/userDetails.txt
    sudo setfacl -m "g:$name:rwx" /home/$hostel/$room/$name/fees.txt
    sudo setfacl -m "g:$name:rwx" /home/$hostel/$room/$name/messAllocation.sh


done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

for i in 'GarnetA' 'GarnetB' 'Opal' 'Agate'
do
    sudo setfacl -m "g:$i:r-x" /home/$i/announcments.txt
    sudo setfacl -m "g:$i:r-x" /home/$i/feeDefaulters.txt
    sudo chmod 754 /home/$i	

done
sudo chmod 754 /home/HAD
sudo setfacl -m "g:HAD:rwx" /home/HAD/mess.txt
sudo setfacl -m "g:HAD:rwx" /home/HAD/messAllocation.sh


