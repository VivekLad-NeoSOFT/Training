# File, directory permission management

## Information

In Linux, file permissions control who can read, write, and execute files and directories. These permissions are categorized as read (r), write (w), and execute (x), and are assigned to the owner, group, and others.

- startswith (-) file
- startswith (d) directory
- u -> User/ Owner
- g -> Group
- o -> Others

### Detailed Explanation:

1. Read (r): Allows a user to view the contents of a file or list the contents of a directory.
2. Write (w): Allows a user to modify the contents of a file or create, delete, and move files within a directory.
3. Execute (x): Allows a user to run a file as a program or enter a directory.
4. Owner: The user who created or owns the file.
   Group: A collection of users who can access the file with the group permissions.
5. Others: All other users on the system who are not the owner or part of the group.

### How to calculate octal values:

Each permission (read, write, execute) has a numerical value: Read (r) = 4, Write (w) = 2, and Execute (x) = 1.

example - 511 --> r-x--x--x

### Practical

1. List permissions of files in home directory

`ls -l ~` ( option `-a` for hidden files)

2. Create Directory and Check Permissions

`mkdir playground`

`ls -ld playground`

3. Change Directory Permissions to Read-Only for all

`chmod 444 playground` | `chmod u=r,g=r,o=r playground`

4. Create directory and text file, change group to "tempUsers", give group write access

`mkdir playground`  
`touch temp.txt`  
`sudo groupadd tempUsers`  
`sudo chgrp tempUsers plaground`  
`chmod g+w plaground`
