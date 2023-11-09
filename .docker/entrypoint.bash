#!/bin/bash
set -e

# Set up the environment
source "/opt/ros/${ROS_DISTRO}/setup.bash"
source "/dev_ws/devel/setup.bash"

exec "$@"