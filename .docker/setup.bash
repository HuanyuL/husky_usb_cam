#!/bin/bash

# Set up the environment
source "/opt/ros/${ROS_DISTRO}/setup.bash"
source "/dev_ws/devel/setup.bash"

export ROS_IP=$(hostname -I | awk '{print $1}')
export ROS_HOSTNAME=$(hostname -I | awk '{print $1}')

sudo chmod 777 /dev/video0
sudo chmod 777 /dev/video2