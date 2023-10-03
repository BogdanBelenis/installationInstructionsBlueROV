# Installation Raspberry Pi 4

Setup of Raspberry Pi 4 for BlueROV2 Slam algorithms with Sonar.

You can create a bootable SD in an easier manner using the RPI Imager [here](https://www.raspberrypi.com/software/).
We will use Ubuntu 22.04.3 Server LTS version, which is enough for our BlueROV, since we do not need a GUI.

Download the `installationStart.sh` and start it with `source installationStart.sh`
This script installs:
* ROS2 Humble
* Mavros
* small additional necessary packages/nice settings

Still missing are the network settings.

For other installations follow these scripts:

* PCL/OpenCV4/fftw3: `installationGeneralLibraries.sh`
* own Underwater Packages: `installationUnderwaterSlamPackages.sh`


# Network Settings

Change hostname in `/etc/hostname` to desired name(here `bluerov_toptube`).
add ip address + hostname to `/etc/hosts`

Example: `192.168.0.3 bluerov_toptube`

# Add static ip address:

On pi: add following lines at `/etc/netplan/******.yaml`
```network:
    ethernets:
        eth0:
            dhcp4: no
            addresses:
             - 192.168.2.2/24
    version: 2
```
this sets the ip address to static. 
then apply: `sudo netplan apply`

Connection for Mavros/Link : `mavlink-routerd -e 192.168.2.1:14550 -e 127.0.0.1:14550 /dev/ttyACM0:1500000`
connect with mavlink Console: `./Tools/mavlink_shell.py /dev/ttyACM0`


# Install pigpio:
```
cd ~/Documents
sudo wget https://github.com/joan2937/pigpio/archive/master.zip
sudo unzip master.zip
cd pigpio-master
sudo make
sudo make install
sudo pigpiod

```

# Restart PiCam:
```
sudo modprobe -r uvcvideo
sudo modprobe uvcvideo
```

# Synchronize Time of PIs:
```
https://raspberrypi.stackexchange.com/questions/89675/sync-time-for-all-raspberry-pis-on-local-network-without-internet
https://pimylifeup.com/raspberry-pi-time-sync/


```



