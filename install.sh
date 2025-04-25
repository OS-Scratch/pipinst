#!/usr/bin/env bash

set -e

echo "Installing pipinst... Please wait."

install -m 755 pipinst.sh /usr/local/bin/pipinst

echo "Done. You can now run 'pipinst' from anywhere."
echo "If you need an overview of the available commands, run 'pipinst --pihelp'".
