# Package management in Linux

In Linux, package management refers to the tools and processes used to install, update, remove, and manage software packages. It streamlines the process of handling software dependencies and ensures a consistent and manageable software environment. Different Linux distributions utilize different package management systems, such as APT for Debian-based systems (like Ubuntu) and YUM/DNF for Red Hat-based systems (like CentOS, Fedora).

## Key aspects of Linux package management:

1. Packages:
   Software packages are collections of files (executables, libraries, configuration files, etc.) that are bundled together to provide a piece of software.
2. Repositories:
   Package repositories are storage locations where software packages and their metadata (information about the package, dependencies, etc.) are stored.
3. Package Managers:
   These are tools (like APT, YUM, DNF, Pacman, Zypper, etc.) that handle the installation, update, removal, and management of packages from repositories.
   Dependency Resolution:
   Package managers automatically resolve dependencies, ensuring that all required libraries and other software are installed along with a package.
4. Benefits:
   Package management simplifies software installation and updates, improves system security and stability, and ensures compatibility between different software components.

## Common package management systems in Linux:

1. APT (Advanced Package Tool):
   The primary package manager for Debian-based distributions like Ubuntu, Linux Mint, and Debian itself.
2. YUM (Yellowdog Updater, Modified) and DNF (Dandified YUM):
   YUM and DNF are package managers used in Red Hat-based distributions like Fedora, CentOS, RHEL, AlmaLinux, and Rocky.
3. Snap:
   A modern package management system for Linux distributions, including Ubuntu, that uses containerization to ensure applications run consistently across different distributions.

## Practical

1. Install package using appropriate package manager (apt, yum, dnf, etc.)

Update list of packages

`sudo apt update`

Install specific pakage

`sudo apt install [package name]`

2. Update all packages

`sudo apt update`
`sudo apt upgrade` | `sudo apt full-upgrade`

3. Uninstalling package
   For Ubuntu/Debian (using apt):

- `sudo apt remove [package name]`:This removes the package but leaves its configuration files.
- `sudo apt purge [package name]`: This removes the package and its configuration files.
- `sudo apt autoremove`: This removes any packages that were installed as dependencies but are no longer needed.
