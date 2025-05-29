# Archiving and compression

In Linux, archiving involves combining multiple files and directories into a single file, while compression reduces the size of files for storage or transfer.  
The most common tools for archiving are tar and zip, and for compression, gzip, bzip2, and xz are widely used.

1. Archiving with `tar`:

- `tar` (Tape Archive) is a versatile command-line utility for creating, extracting, and manipulating archives.
- It bundles files and directories into a single archive file with the `.tar` extension.
- `tar` alone creates an uncompressed archive, meaning the archive file size will be the same as the combined size of all the files.

2. Compression with `gzip`, `bzip2`, and `xz`:

- `gzip`: A popular compression tool that provides a good balance between compression ratio and speed.
- `bzip2`: Known for its higher compression ratios than gzip, especially for text-based files, but can be slower.
- `xz`: Another powerful compression tool offering high compression ratios, particularly good for large files and archives.

3. Combining Archiving and Compression:

- `tar` can be used in conjunction with compression tools like `gzip`, `bzip2`, or `xz` to create compressed archives.
- For example, t`ar -czvf archive.tar.gz /path/to/files` creates a compressed archive using `gzip`.
- Similarly, `tar -cjvf archive.tar.bz2 /path/to/files` creates a compressed archive using `bzip2`.

## Practical

1. Create and extract archive

`tar -cvf flight_archive.tar flight_data.csv`

`tar -xf flight_archive.tar`

2. Create and extract compressed archive (gzip)

`tar -czvf archive2.tar.gz flight_data.csv` | `gzip flight_data.csv`

`tar -xzvf archive2.tar.gz` | `gunzip flight_data.csv.gz`

3. Append files to archive
   (works with uncompressed `.tar` files)

`tar -rf flight_archive.tar newfile.txt`

(for verifying)  
`tar -tf flight_archive.tar`

4. List archive contents

Uncompressed

`tar -tf archive.tar `

Compressed

`tar -tzf archive.tar.gz `

5. Exclude files during archival

`tar --exclude='file1.txt' -zcvf backup.tar.gz .`

6. Update archive ( Works only with uncompressed `.tar` archives.)

`ar -uf flight_archive.tar newfile.txt`
