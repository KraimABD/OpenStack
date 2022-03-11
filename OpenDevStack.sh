#!/bin/bash

# Starting the Script
echo "Starting the Script"
echo
echo "Updating and Upgrading"
echo 
sudo apt update -y && apt upgrade -y
echo
# Add Stack User
echo "Add Stack User"
sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

sudo -i -u stack bash << EOF
echo "In"
# Download DevStack, the current release is Xena" >> Continue.sh


git clone -b stable/xena https://opendev.org/openstack/devstack.git

cd devstack

# if an error occurred the ip address of the host should be added in the local.conf
mv  samples/local.conf local.conf


echo "Run the script"
./stack.sh
EOF

