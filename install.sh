#!/usr/bin/env bash	

if [ "$(id -u)" -ne 0 ]; then
   echo "This script neeeds to run as root, try with sudo or su - ?" 1>&2
   exit 1
fi

set -e	

echo "Installing pipinst... Please wait."	

install -m 755 pipinst.sh /usr/local/bin/pipinst	

echo "Done. You can now run 'pipinst' from anywhere."	
echo "If this doesn't work, add /usr/local/bin to your PATH by running: "	
echo 'export PATH=/usr/local/bin:$PATH'	
echo "If you need an overview of the available commands, run 'pipinst --pihelp'".


