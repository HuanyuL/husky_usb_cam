#!/bin/zsh

# Set up the environment
source "/opt/ros/${ROS_DISTRO}/setup.zsh"
source "/dev_ws/devel/setup.zsh"

export ROS_IP=$(hostname -I | awk '{print $1}')
export ROS_HOSTNAME=$(hostname -I | awk '{print $1}')
