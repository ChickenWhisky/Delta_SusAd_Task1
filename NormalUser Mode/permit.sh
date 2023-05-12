#!/bin/bash
while read name rollno hostel room mess messpref; do
    if [ "$name" = "Name" ]; then
        continue
    else
        sudo usermod -a -G $hostel $name
        sudo usermod -a -G HAD $name
        sudo usermod -a -G $name $hostel
        sudo usermod -a -G $name HAD
        sudo chmod g=rwx /home/$hostel/$room/$name
        sudo setfacl -m "g:$name:rwx" /home/$hostel/$room/$name/userDetails.txt
        sudo setfacl -m "g:$name:rwx" /home/$hostel/$room/$name/fees.txt
        sudo setfacl -m "g:$name:r-x" /home/$hostel/$room/$name/messAllocation.sh
        sudo setfacl -m "g:$name:r-x" /home/$hostel/$room/$name/feeBreakup.sh
    fi
done </home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

for i in 'GarnetA' 'GarnetB' 'Opal' 'Agate'; do
    sudo setfacl -m "g:$i:r-x" /home/$i/announcments.txt
    sudo setfacl -m "g:$i:r-x" /home/$i/feeDefaulters.txt
    sudo setfacl -m "u:HAD:rwx" /home/$i/announcments.txt
    sudo setfacl -m "u:HAD:rwx" /home/$i/feeDefaulters.txt
    sudo chmod 750 /home/$i
    sudo usermod -a -G $i HAD

done
sudo chmod 750 /home/HAD
sudo setfacl -m "g:HAD:rwx" /home/HAD/mess.txt
sudo setfacl -m "g:HAD:r-x" /home/HAD/messAllocation.sh
sudo setfacl -m "g:HAD:r-x" /home/HAD/updateDefaulter.sh
