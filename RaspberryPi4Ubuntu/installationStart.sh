#!/bin/bash

echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '">> ~/.bashrc

sudo apt update -y
sudo apt full-upgrade -y 



#general programs that are important
sudo apt install htop -y
sudo apt install net-tools -y

# ROS installation starts here
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update -y
sudo apt install ros-noetic-ros-base -y
sudo apt install ros-noetic-mavros* -y
sudo apt install ros-noetic-tf2-geometry-msgs ros-noetic-tf2 -y

echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
sudo apt install python3-catkin-tools python3-osrf-pycommon -y

cd ~
mkdir catkin_ws
cd catkin_ws
mkdir src

sudo rosdep init
rosdep update

cd src

git clone https://github.com/Zarbokk/installationInstructions.git
cd ..
#catkin build -j 2
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
cd ~
source ~/.bashrc


#install swap file not working propably currently has to be tested again
sudo apt-get install dphys-swapfile -y
sudo sed -i 's/\#CONF_MAXSWAP=2048/CONF_MAXSWAP=4096/g' /etc/dphys-swapfile
sudo sed -i 's/\#CONF_SWAPSIZE=/CONF_SWAPSIZE=4096/g' /etc/dphys-swapfile
sudo systemctl enable dphys-swapfile
sudo reboot



