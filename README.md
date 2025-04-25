# pipinst
pipinst is a tool for installing Python packages via pip or via your system's package manager. 

**Note - pipinst is currently only available for Debian-based distributions. We are currently working to port it to other systems too.**

## Install 
Go to /releases/ and select your system base.
Download the file "install.sh" and "pipinst.sh".
Now, open a terminal and navigate to your Downloads folder: cd Downloads. 
Enter: sudo bash install.sh. This should ask you for your password, after this pipinst is installed.
*If you know how to, you can also install pipinst without install.sh. This is trickier and requires more terminal work*
You can safely remove install.sh and pipinst.sh AFTER the process is completed.

## Usage
pipinst is designed to be as easy as possible. To install a package, pipinst PKGNAME installs via pip, --apt/dnf/pacman etc with your systems package manager. pipinst PKGNAME (--apt) -dry starts a dry run, which shows the command that would run.
