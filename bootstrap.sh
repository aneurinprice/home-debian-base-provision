#!/bin/bash

echo "########################"
echo "##    Program Stuff   ##"
echo "########################"
sleep 3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install sudo qemu-guest-agent gnupg

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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCar6pJcSwzgQwjYpVc4eMQO/a5vvNiTZeg405ntvGo4ma7gBX5SIouvq0XLASJ7UWyb2GVcO8YjgBQSKAwrBGVj+LoU1vhE8+nMj5hQSjlV4kukUY5a135MEu3AFUB6oN5WSlUQpiIoE3/aqNoiikcLhwjEQ9H70iBCR3JbOfR9QseHZU1u/EtU0iyiVSUrsRJ1dWOSeDgu02hXRemyjm2ZUFB/HBu2yvAC2kvCrkjeQ7bXHCZDtOa3ouAFrzFwgadpryWpvr59sMJHmnvUEnXijrkyLZO+cdWw4JZzxjPepfMpvAwd2IQRncw6T/4PbxwEfd+LrwbXGTsIF85fUKYQQl7GHGQV5TIRURzaRHc/LVMjyNk0xu6OUNO565w8OifJ9g1/iVzyx86yLsbHZ0Fbkb/H1y/2ffNJjlrtlq62ihNrMk8nkv+1ua7rlZpzs7+rlWnOgtxq0gBuUib/rm4+wojHyPogs1pErqMJumseicaGr+EN8Y3qinroxrjZsVJdyv9YMRdXhkHB8obsmOrTE8PnrsiLqMRsEu0eyNxk0Le9wHER+sm4SXQCSJxaGpSnUt7ELZ7DVWYBcd9yBnKo95lbeMc8/M+yCQ1hUFvWVzs/4xIXQgJWXP1Jue7x/EGsJDQ0JOj0nWNFhrVHZmrqSAY46ooTnDnmEYpXQlQLQ==" > /home/ansible/.ssh/authorized_keys && echo "Ansible SSH Key Provisioned"
