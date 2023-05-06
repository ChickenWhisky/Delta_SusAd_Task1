hello and welcome to Delta Task 1 for the sysad domain
To begin open up the terminal and enter the following commands

On loggin in:

apt update
apt -y upgrade
apt install sudo acl wget git

Apply these commands to get started:

sudo useradd -m -d /home/HAD HAD
cd /home/HAD

sign in to User HAD

git clone https://github.com/ChickenWhisky/Delta_SusAd_Task1.git
mv DeltaTask1_SysAd/init.sh .
chmod +x init.sh
./init.sh