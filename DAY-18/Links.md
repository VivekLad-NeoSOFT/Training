# Soft links (symbolic / symlinks) & Hard links

A link in Linux is a pointer to a file. Like pointers in any programming languages, links in Linux are pointers pointing to a file or a directory. Creating links is a kind of shortcuts to access a file. Links allow more than one file name to refer to the same file, elsewhere.

There are two types of links:

- Soft Link or Symbolic links
- Hard Links

These links behave differently when the source of the link is moved or removed.  
Symbolic links are not updated; hard links always refer to the source, even if moved or removed.

For example:  
if we have a file a.txt. If we create a hard link to the file and then delete the file, we can still access the file using hard link. But if we create a soft link of the file and then delete the file, we can't access the file through soft link and soft link becomes dangling. Basically hard link increases reference count of a location while soft links work as a shortcut.

1. Soft Links

- A soft link is similar to the file shortcut feature which is used in Windows Operating systems. Each soft linked file contains a separate Inode value that points to the original file. As similar to hard links, any changes to the data in either file is reflected in the other. Soft links can be linked across different file systems, although if the original file is deleted or moved, the soft linked file will not work correctly (called hanging link).
- `ls -l` command shows all links with first column value `l` and the link points to original file.
- Soft Link contains the path for original file and not the contents.
- Removing soft link doesn't affect anything but removing original file, the link becomes "dangling" link which points to nonexistent file.
- A soft link can link to a directory.
- The size of the soft link is equal to the length of the path of the original file we gave.
- Example: If we link a file like ln -s /tmp/hello.txt /tmp/link.txt then the size of the file will be 14 bytes which is equal to the length of the "/tmp/hello.txt".
- If we change the name of the original file then all the soft links for that file become dangling i.e. they are worthless now.
- Link across file systems: If you want to link files across the file systems, you can only use symlinks/soft links.
- Command to create a Soft link is:  
  `ln  -s [original filename] [link name]`

2. Hard Links

- Each hard linked file is assigned the same Inode value as the original, therefore they reference the same physical file location. Hard links more flexible and remain linked even if the original or linked files are moved throughout the file system, although hard links are unable to cross different file systems.
- `ls -l` command shows all the links with the link column shows number of links.
- Links have actual file contents
- Removing any link, just reduces the link count, but doesn't affect other links.
- Even if we change the filename of the original file then also the hard links properly work.
- We cannot create a hard link for a directory to avoid recursive loops.
- If original file is removed then the link will still show the content of the file.
- The size of any of the hard link file is same as the original file and if we change the content in any of the hard links then size of all hard link files are updated.
- The disadvantage of hard links is that it cannot be created for files on different file systems and it cannot be created for special files or directories.
- Command to create a hard link is:  
  `ln  [original filename] [link name]`

## Practical

1. Soft link (Symlink)

`ln -s original.txt link.txt`

2. Hard link

`ln original.txt hardlink.txt`

3. Verify link types

`ls -l`

4. Remove Soft link

`rm link`

5. Remove Hard link

`rm hardlink`

6. Directory soft link

`ln -s /playground/mydir mydirlink`

7. Preserve links in archives

`tar -chf archive.tar link.txt` | `tar -cf archive.tar link.txt` (To preserve links not contents)

8. Detect broken links

`find . -xtype l`

9. Rename soft link

`mv link.txt newlink.txt`

10. Links for a backup

`rsync -avz data/ backup/`
