#!/bin/bash

echo "########################"
echo "##    Program Stuff   ##"
echo "########################"
sleep 3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install sudo

echo "########################"
echo "##     SUDO Stuff     ##"
echo "########################"
sleep 3

echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible && echo "Ansible SUDO Config Configured"

echo "########################"
echo "##     User Stuff     ##"
echo "########################"
sleep 3

getent group ansible  || { groupadd ansible && echo "Ansible Group Created"; }
getent passwd ansible || { useradd -m -d /home/ansible -s '' -g ansible ansible && echo "Ansible User Created"; }
mkdir -p /home/ansible/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6R+MfdmGtZNbjeiHsxsZWBMCHHAvxHT8hGgObZGgnh+jbRGqj+1PsFcOGP1Fkbi+ixHtjAShlspyRKnZ2MG7AAsJZQWBkTTo6h4ub50wNOULSyDKnQmQWKczRFxDQgB4KhRT2BX4ItWmROOMFtiWCnEnVvvmjTGvjCGqLH690C0+mYkWrRCSSFwxSOnseDAAPNZ0ONDDrwMuehBTJL1AK8OvsY+p4vSaTu0FhucljNb0TzvUxn32xZCoKWz/Ouajp5+GTvKKVlPSsAlG4St3xKGLi/k/+4+oZdOSmq7zuFIgbyp6HFmJgqUn+uZLYfTh/DAcC0pZ7hQ0tnRbVwI47vAPSUzU69N86QBfYlMoLeI2Rb9MgLhpS+99oRXRJgHARcNUGQ7lqqMbkr6x8b4/cPHCSl/QE+CLckhHmKZpjbq6lrxwweNjwK2s/ptXg4sepMxA1NuZET5x9pkl9nBqjmb5D1qbgyAmM6Re7i5XB94A9HXuXW3qIxOehrDdZs9c= aneurinprice@Aneurins-MacBook-Air.local" > /home/ansible/.ssh/authorized_keys && echo "Ansible SSH Key Provisioned"
