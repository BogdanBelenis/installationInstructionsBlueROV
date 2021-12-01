#!/bin/bash

cd ~/catkin_ws/src

git clone https://github.com/Zarbokk/BlueROV2Gazebo.git
git clone https://github.com/Zarbokk/BlueROV2Common.git
git clone https://github.com/Zarbokk/UnderwaterSlam.git
git clone https://github.com/Zarbokk/soft20.git
git clone https://github.com/CentraleNantesRobotics/ping360_sonar.git
git clone https://github.com/GSO-soslab/waterlinked_dvl_ros

cd ~/catkin_ws
catkin build
