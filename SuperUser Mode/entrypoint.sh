#!/bin/bash

# Done so that we can make servermess.sh run in the background and allow us to 
# free up and utilize the terminal for other purposes

nohup /home/Delta_SusAd_Task1/SuperUser\ Mode/servermess.sh &
exec /bin/bash