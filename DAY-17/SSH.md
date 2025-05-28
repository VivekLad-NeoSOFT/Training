# SSH (Secure Shell)

The Secure Shell (SSH) protocol is a method for securely sending commands to a computer over an unsecured network. SSH uses cryptography to authenticate and encrypt connections between devices. SSH also allows for tunneling, or port forwarding, which is when data packets are able to cross networks that they would not otherwise be able to cross. SSH is often used for controlling servers remotely, for managing infrastructure, and for transferring files.

## Steps to use SSH on Linux

1. Install `openssh-server`

`sudo apt update`

`sudo apt install openssh-server -y`

2. Check SSH Config File and Service Status

- Check SSH Config File

`cat /etc/ssh/sshd_config`

- Check SSH Service Status

`sudo systemctl status shh`

- Ensure SSH starts on boot

`sudo systemctl enable ssh`

- To restart the service after config changes

`sudo systemctl restart ssh`

3. Take SSH from a Different Laptop

- Get the IP Address of the Ubuntu System

`ip a`

- From Another Laptop

`ssh [username]@[ip address]`
