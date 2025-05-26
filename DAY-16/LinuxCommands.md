# Linux Commands

Essential Linux commands

1. ls

The ls command lists the content of a folder, including files and directories.  
If you omit the path, the ls command will check the content of your current directory.  
To list items inside subfolders, add the -R option. Meanwhile, use -a to show hidden content.

`ls [options] [directory_or_path]`

2. pwd

To check the full path of your current working directory, use the pwd command.  
The pwd command has only two options. The -L option prints environment variable content, like shortcuts, instead of the actual path of your current location. Meanwhile, -P outputs the exact location.

`pwd`

3. cd

Use cd to navigate between directories.

`cd [path_or_directory]`

The cd command has several shortcuts:

- `cd` returns to the current user’s home directory.
- `cd ..` moves a directory up.
- `cd – ` goes back to the previous directory.

4. mkdir

The mkdir command lets you create one or multiple directories.

`mkdir [options] directory_name1 directory_name2`

5. rmdir

Use rmdir to delete empty directories.  
The rmdir command won’t work if the directory contains subfolders. To force the deletion, add the –p option. Note that you must own the item you want to remove or use sudo instead.

`rmdir [options] directory_name`

6. rm

The rm command deletes files from a directory. You must have the write permission for the folder or use sudo.  
Avoid using -r and -f unless necessary. Instead, add -i option to prevent accidental deletion.

`rm [options] file1 file2`

7. cp

Use the cp command to copy files from your current directory to another folder.  
Additionally, cp lets you duplicate a directory and its content to another folder using the -R option.

`cp file1 file2 [target_path]`

8. mv

The main usage of the mv command is to move a file or folder to another location.  
You can also use the mv command to rename.

`mv file_or_directory [target_directory]`

9. touch

Run the touch command to create a new empty file in a specific directory.

`touch [options] [path_and_file_name]`

10. file

The file command checks a file type, such as TXT, PDF, or other.  
You can add the -k option to print more detailed information about the item.

`file [file_name]`

11. zip and unzip

The zip command compresses one or multiple files into a ZIP archive, reducing their size.

`zip [options] zip_file_name file1 file2`

To extract a compressed file into your current working directory, use the unzip command.

`unzip [options] zip_file_name`

12. tar

The tar command bundles multiple files or directories into an archive without compression.  
To create a new TAR file, you must add the -c option. Then, use the -f flag to specify the archive’s name.

`tar [options] tar_file_name file1 file2`

13. nano, vi, and jed

nano, vi, and jed commands let you edit files. They have the same syntax, except at the beginning, where you specify the name of the tool.

`nano/vi/jed file_name`

14. cat

The concatenate or cat command has various usages. The most basic one is printing the content of a file.

`cat file_name`

15. grep

Global regular expression print or grep lets you search specific lines from a file using keywords.

`grep [options] keyword [file]`

16. sed

Use the sed command to search and replace patterns in files quickly.  
You can replace a string in multiple files simultaneously by listing them.

`sed [options] 'subcommand/new_pattern/target_pattern' input_file`

17. head

Use the head command to print the first few entries of a file.

`head [options] file_name`

18. tail

The tail command is the opposite of head.

`tail [options] file_name`

19. awk

The awk command searches and manipulates regular expression patterns in a file.

`awk '/regex pattern/{action}' input_file.txt`

20. sort

Use the sort command to rearrange a file’s content in a specific order.  
Note that this utility doesn’t modify the actual file and only prints the rearranged content as an output.

By default, the sort command uses the alphabetical order from A to Z, but you can add the -r option to reverse the order. You can also sort files numerically using the -n flag.

`sort [options] [file_name]`

21. cut

The cut command selects specific sections from a file and prints them as a Terminal output.

`cut options file`

Unlike other Linux utilities, the cut command’s options are mandatory for file sectioning. Here are some of the flags:

- `-f` selects a specific row field.
- `-b` cuts the line by a specified byte size.
- `-c` sections the line using a specified character.
- `-d` separates lines based on delimiters.

22. diff

The diff command compares two files and prints their differences.  
By default, the diff command only shows the differences between the two files. To print all the content and highlight the discrepancies, enable the context format using the -c option. You can also ignore case sensitivity by adding -i.

`diff file_name1 file_name2`

23. locate

The locate command searches for a file and prints its location path.  
If you use the -r option to search files using regular expressions, omit the [keyword] argument. The locate command is case-sensitive by default, but you can turn off this behavior using the -i flag.

`locate [options] [keyword]`

24. find

The find command searches for a file within a specific directory.

`find [path] [options] expression`

25. sudo

superuser do or sudo enables non-root users who are part of the sudo group to execute administrative commands.

`sudo [options] your_command`

26. su and whoami

The su command lets you switch to another user in the Terminal session.  
If you don’t specify any option or username, this command will switch you to the root user.

`su [options] [username]`

You can check the currently logged-in user.

`whoami`

27. chmod

Chmod lets you change the permissions of files or directories.
In Linux, there are three folder and file permissions – read (r), write (w), and execute (x). You can assign them to three parties – the owner, a group, or other accounts belonging to neither category.

`chmod [options] [permission] [file_or_directory]`

28. chown

The chown command lets you change the ownership of files, directories, or symbolic links.

`chown [options] newowner:newgroup file1 file2`

29. useradd, passwd, and userdel

Use the useradd command to create a new account.

`useradd [options] new_username`

By default, the useradd command doesn’t prompt you to give the new user a password. You can add or change it manually later with the passwd command:

`passwd new_username`

To remove a user, use the userdel command followed by the account name like the syntax in the example:

`userdel new_username`

30. df

The df command checks your Linux system’s disk usage, displaying the used space in percentage and kilobyte (KB).

`df [options] [file system]`
