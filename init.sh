#!/bin/bash
export ROS_DOMAIN_ID=42
sudo /usr/bin/X :0 & 
export DISPLAY=:0
source /opt/ros/dashing/setup.bash
ros2 topic list 
source /home/ubuntu/simulation-manager/Simulair-simulation-manager/venv/bin/activate
sudo python3 /home/ubuntu/simulation-manager/Simulair-simulation-manager/app.py


