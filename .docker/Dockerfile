ARG ROS_DISTRO=noetic

FROM ros:$ROS_DISTRO-ros-base as base

ARG ROS_DISTRO


ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM xterm-256color


RUN apt-get update && apt-get install -y \
    ssh \
    git \
    wget \
    curl \
    terminator \
    python3-pip \
    python3-flake8 \
    build-essential \
    cmake \
    zsh \
    v4l-utils \
    ffmpeg \
    libv4l-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --upgrade pip\
    argcomplete \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-import-order \ 
    flake8-return \
    flake8-length \
    flake8-todo \
    flake8-quotes \
    black \
    mypy \
    prospector \
    pylint \
    numpy \
    PyYAML \
    rosbags \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends\
    pkg-config \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall-generator \
    python3-vcstool \
    python3-pykdl \
    ros-$ROS_DISTRO-rqt \
    ros-$ROS_DISTRO-rqt-common-plugins \
    ros-$ROS_DISTRO-rqt-gui \
    ros-$ROS_DISTRO-rqt-gui-py \
    ros-$ROS_DISTRO-rqt-tf-tree \
    ros-$ROS_DISTRO-rqt-py-common \
    ros-$ROS_DISTRO-image-transport \
    ros-$ROS_DISTRO-camera-info-manager \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /dev_ws/src

FROM base as bash

WORKDIR /dev_ws

COPY . /dev_ws/src

# Build catkin workspace
RUN ["/bin/bash", "-c", "source /opt/ros/$ROS_DISTRO/setup.bash &&\
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release &&\
    catkin build \
    "]

# Copy and make setup script executable
RUN ["/bin/bash", "-c", "cp /dev_ws/src/.docker/setup.bash /dev_ws/setup.bash && chmod 777 /dev_ws/setup.bash"]

# Copy and make entrypoint script executable
RUN ["/bin/bash", "-c", "cp /dev_ws/src/.docker/entrypoint.bash / && chmod 777 /entrypoint.bash"]

ENTRYPOINT [ "/entrypoint.bash" ]

# Start bash shell
CMD ["bash"]

FROM bash as zsh
#------------------------------------------------------

# Install zsh and remove apt cache
RUN apt-get update && apt-get install -y \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Set shell to zsh
SHELL ["zsh", "chsh -s ~/.zshrc" ]

# Copy and make setup script executable
RUN ["/bin/bash", "-c", "cp /dev_ws/src/.docker/setup.zsh /dev_ws/setup.zsh && chmod 777 /dev_ws/setup.zsh"]

# Copy and make entrypoint script executable
RUN ["/bin/bash", "-c", "cp /dev_ws/src/.docker/entrypoint_zsh.sh / && chmod 777 /entrypoint_zsh.sh"]
ENTRYPOINT ["zsh", "/entrypoint_zsh.sh" ]

# start ZSH shell
CMD ["zsh"]
