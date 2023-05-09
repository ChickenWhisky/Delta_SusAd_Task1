#!bin/sh

#add all wardens to the primary groups of each student in their hostel and change each students group permissions to rwx(DONE)
#add add HAD to the primary groups of each student and change those group permissions to rwx(DONE)
#add all students their Wardens Primary group (DONE)
#change permissions using ACL for announcment.txt,feeDefaulter.txt by allowing people of the warden group to access it(DONE)
#add all students to HAD's group and give them access to mess.txt in HAD file using ACL(DONE)


while read -r name rollno hostel room mess messpref
do
    sudo usermod -a -G $hostel $name
    sudo usermod -a -G student $name
    sudo usermod -a -G $name $hostel
    sudo usermod -a -G $name HAD
    sudo chmod g=rwx $name 

done < /home/Delta_SusAd_Task1/NormalUser\ Mode/src/studentDetails.txt

for i in 'GarnetA' 'GarnetB' 'Opal' 'Agate'
do
    setfacl -m "g:$i:" /home/$i/announcments.txt
    setfacl -m "g:$i:" /home/$i/feeDefaulters.txt
done

setfacl -m "g:HAD:" /home/HAD/mess.txt

