# Delta SysAd Task-1

Hello and welcome to my Delta Inductions Task 1 for the Sysad domain
To begin open up the terminal and enter the following commands

## On Starting the server

* Open the terminal and enter the following block of code
```
apt update
apt -y upgrade
apt install sudo acl wget git
```
* If the user HAD hasnt been created then do the following
```
sudo useradd -m -d /home/HAD HAD
cd /home/HAD
```

* Sign in to User HAD execute the following on the terminal 

```
cd /home
git clone https://github.com/ChickenWhisky/Delta_SusAd_Task1.git
mv DeltaTask1_SysAd/init.sh .
```
### Normal Mode
- [ ] genStudent.sh
- [ ] permit.sh
- [ ] updateDefaulter.sh
- [ ] messAllocation.sh
- [ ] feeBreakup.sh
### Superuser Mode
-[] signOut.sh
