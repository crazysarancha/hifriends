#!/bin/bash

ip rule add from $(ip route get 1 | grep -Po '(?<=src )(\S+)') table 128
ip route add table 128 to $(ip route get 1 | grep -Po '(?<=src )(\S+)')/32 dev $(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)')
ip route add table 128 default via $(ip -4 route ls | grep default | grep -Po '(?<=via )(\S+)')

apt update
apt upgrade
apt-get install -y openvpn dialog python3-pip python3-setuptools
pip3 install protonvpn-cli
apt-get install -y nano
apt-get install -y wget
apt-get install -y git

git clone https://github.com/palahsu/DDoS-Ripper

protonvpn init
