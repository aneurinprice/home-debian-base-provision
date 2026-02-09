#!/bin/bash

echo "########################"
echo "##    Program Stuff   ##"
echo "########################"
sleep 3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install sudo gnupg qemu-guest-agent

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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCp/wCFOFQfrgXjeYcxdg0eVJQ9G/aTIzpJ0/zkznp+uByfR8CyeUVEqF1K93oaip3kzZjV4CAnWjbRnOlIA6T5spypLuvjm52iUxnm4QlqTy0fxZp1krrlJlIlTjgTo1xMqXwaefgPuwKForDYnAxuT5o/96zxZkuCsIJlzJX5lZ/YZ92ebftUf9PRxtHWdO1RE3naW0oc48fsPYsmSI7+v51vGpKel/YKgEtPC5VUxvb9O1JemJJBIA8sPXHDDAfBOZjHjtIiSXE2EZNw8eu5XgRqNAK+/9da8NosIa7nBWLFxH+EwBOud6osiaOrksPrSveOA2goDZum1RWNKMLVKESbRhcEtJtWypWTk6FShNV2zZU79LYUfpM9MDOcxycQvbUMVlE6aw6vBOpwotNv8ZSsnMjYjKCz4ukzfeAiG/cC1UnWwXF3vsOXH5Bv0dFgLeMD8hgeIGHEdxOfBNstSoYbdv0Yx28IkVPFU+Xxa38mrC8Yo+JcrWmMnO7hbRWfLUk8mvFjTXfdZnRznSAukfD84hepxDrdDGFqB2giZxVMQWqTbb1bD98TMxdHAgbbZybKC0PLBD1vEaicxYHqD439+gYzuhubpVVCYneYfY3yQETIOTn6WsjhYNg8LBAzb6tAvpaozXev2hnWC2IS51ChSboUJ4cY4d9X0RcyDQ==" > /home/ansible/.ssh/authorized_keys && echo "Ansible SSH Key Provisioned"
