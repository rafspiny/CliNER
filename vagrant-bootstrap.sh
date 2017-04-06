#! /bin/bash

export CLINER_DIR="/vagrant"

# Update repositories before attempting to download
# sudo apt-get update

# Missing some basic utilities here...like unzip and the jdk8
# python-software-properties
sudo apt-get install software-properties-common python-software-properties -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
# Must accept the Oracle license
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
# Install Oracle JDK 8
sudo apt-get install oracle-java8-installer -y
sudo apt install oracle-java8-set-default unzip -y

# Install system dependencies
sudo apt-get install python-pip python-dev g++ gfortran libopenblas-dev liblapack-dev make -y

# Install python dependencies, using apt-get, to quicken the installation process. 
sudo apt-get install python-nose python-numpy python-scipy -y

# trying to create the virtual env on the synced folder can lead to errors.
# The virtual env isn't needed here, so VIRTUAL_ENV prevents it.
export VIRTUAL_ENV="true"

# Run install script
cd $CLINER_DIR && sudo -E bash install.sh

# nltk requirements already installed, but in root dir... mv it.
sudo mv /root/nltk_data /home/vagrant/

echo export CLINER_DIR="$CLINER_DIR" >> /home/vagrant/.bashrc
