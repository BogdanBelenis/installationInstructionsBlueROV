#!/bin/bash

echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '">> ~/.bashrc

sudo apt update -y
sudo apt full-upgrade -y 

#general programs that are important
sudo apt install htop -y
sudo apt install net-tools -y
sudo apt install git-all

# ROS installation starts here

#Set locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

#Setup Sources
sudo apt install software-properties-common
sudo add-apt-repository universe
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#Install ROS2 packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install ros-humble-desktop
sudo apt install ros-humble-ros-base
sudo apt install ros-dev-tools
###################################################################################################################
#Ask TIM
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
###################################################################################################################

#Add ROS2 packages (maybe add more in the future)
sudo apt install ros-humble-mavros -y
sudo apt install ros-humble-tf2-geometry-msgs ros-humble-tf2 -y

#Sourcing setting
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

#Installing python modules for ROS and others (maybe add more in the future)
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
sudo apt install python3-colcon-common-extensions python3-osrf-pycommon -y

#Preparing the workspace directory
cd ~
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws

sudo rosdep init
rosdep update

#Copying installation and setup scripts
cd src
git clone https://github.com/Zarbokk/installationInstructions.git
cd ..

#colcon build -j 2
echo "source ~/ros2_ws/devel/setup.bash" >> ~/.bashrc
cd ~
source ~/.bashrc


#install swap file not working probably currently has to be tested again
sudo apt-get install dphys-swapfile -y
sudo sed -i 's/\#CONF_MAXSWAP=2048/CONF_MAXSWAP=4096/g' /etc/dphys-swapfile
sudo sed -i 's/\#CONF_SWAPSIZE=/CONF_SWAPSIZE=4096/g' /etc/dphys-swapfile
sudo systemctl enable dphys-swapfile
sudo reboot



