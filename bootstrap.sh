#!/bin/bash

echo "########################"
echo "##    Program Stuff   ##"
echo "########################"
sleep 3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install sudo qemu-guest-agent

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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE5IQanlMKiP3LKKMbBHlyG7W6WwDWoawVHSxy95urLEO3+iVJcXfI8mb7J8qFPayx1VDKTpTNYeB4bBA0YLwDhZwFhbXiFQxjLIfvPvPmCC8ACbg8LChPYONQ0CPoOQqWYr1UrqX5TcDx9XgeA1U/mmYs3BTA4f8FqdrJsB51uLuPTdAt9E3fQDYtr7Xrtlio+S/nT1pWZ7D4duzmuZVoLV5ze/jeMzsIRfCmXYYS3JgRBozioIfDNASHNXJNnTSjuq8uSaxUGb4m+FtIHJ+5hYK56SfLpmWn3HHOANhUgUH+skaoThdoHh5qXskvLimtl5KHiojnToOhdQyOTbeCEiDgKTiJY1Gyf6FHSlzTGFAYa+SIX7Tp0zpT4NfGWbCk7eHZK1dUSpqZTwiAJq+T3BN524Oh8odhH2xvJNco4O3GySmeIpef3knZcdVCGWUo85DdBpIGdAdphOvIAof+h/rHqxJB5DPpmbAbYeeqW49jKXLz1exsuVR/oCLvtRk= aneurinprice@handles.local" > /home/ansible/.ssh/authorized_keys && echo "Ansible SSH Key Provisioned"
