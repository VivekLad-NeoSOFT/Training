# User management in Linux

1. Check the current user

`whoami`

2. Adding a user

`sudo adduser [username]`

- Alternate option

`sudo useradd -m -s /bin/bash [username]`

`-m`: Create home directory

`-s`: Set default shell

3. Check all available users on the system

`cat /etc/passwd`

- Only human users

`awk -F: '$3>=1000 && $3!=65534 {print $1}' /etc/passwd`

4. Setting password for a specific user

`sudo passwd [username]`

5. User modification

`sudo usermod [username] [options]`

6. Switching user

`su - [username]`

7. Editing sudoers file

`sudo visudo` (recommended)

8. Deleting a user

`sudo userdel [username]`

9. Creating a new group

`sudo groupadd [groupname]`

10. Checking all available groups

`cat /etc/group`

11. Checking the current user is member of how many groups

`groups`

12. Adding user to a specific group

`sudo usermod -aG [groupname] [username]`

13. Removing specific user from a group

`sudo gpasswd -d [username] [groupname]`

14. Deleting a group

`sudo groupdel [groupname]`

15. Provide Sudo Permission Without Password Prompt

`echo "username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/[username]`

16. Provide Sudo Permission with Password Prompt

`echo "username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/[username]`

17. Provide Sudo Permission Using usermod

`sudo usermod -aG sudo [username]`

18. Delete User With Home Directory

`sudo userdel -r [username]`
