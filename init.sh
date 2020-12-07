#!/bin/bash

logdir="/home/ubuntu/.simlogs/log"

echo "Simulation service initialization has started..." > $logdir
git -C /home/ubuntu/simulation-manager/Simulair-simulation-manager pull origin master
if [ $? -eq 0 ]; then
    echo "Simulation Manager has been updated!" >> $logdir
else 
    echo "Simulation Manager has failed to update!" >> $logdir
fi 

pgrep Xorg > /dev/null
if [ $? -eq 1 ]; then
    sudo /usr/bin/X :0 &
    echo "X Server has initialized" >> $logdir
fi 

export DISPLAY=:0
source /opt/ros/dashing/setup.bash
export ROS_DOMAIN_ID=42
source /home/ubuntu/simulation-manager/Simulair-simulation-manager/venv/bin/activate
sudo python3 /home/ubuntu/simulation-manager/Simulair-simulation-manager/app.py
