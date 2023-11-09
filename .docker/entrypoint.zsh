#!/bin/zsh
set -e

# Set up the environment
source "/opt/ros/${ROS_DISTRO}/setup.zsh"
source "/dev_ws/devel/setup.zsh"

exec "$@"