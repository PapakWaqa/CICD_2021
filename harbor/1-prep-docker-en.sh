#!/bin/bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo usermod -aG docker bigred

sudo apt install openssl -y

wget https://github.com/goharbor/harbor/releases/download/v2.1.5/harbor-offline-installer-v2.1.5.tgz

sudo reboot
