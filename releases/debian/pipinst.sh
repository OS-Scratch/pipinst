#!/usr/bin/env bash

dry=false
apt=false
pipinst_help=false
args=()
version="1.0.1"

for arg in "$@"; do
    case "$arg" in
        --dry-run) dry=true; continue ;;
        --try|--apt|--system) apt=true; continue ;; 
        --pihelp) pipinst_help=true; continue ;;
        *) args+=("$arg") ;;
    esac
done

if $pipinst_help; then
    echo "pipinst - tool for installing python packages on Linux"
    echo "version $version"
    echo "For Debian-based distributions."
    echo "Available commands:"
    echo "pipinst --pihelp - shows this command"
    echo "pipinst pkg - install package pkg via pip / Python"
    echo "pipinst pkg --apt - install package pkg via APT"
    echo "pipinst pkg (--apt) --dry-run - shows command without executing"
    echo "pipinst is free and open-source."
    echo "Made with love and passion in Switzerland."
    exit 0
fi

if [[ ${#args[@]} -eq 0 ]]; then
    echo "No package given as parameter. Example: pipinst numpy"
    exit 1
fi

pkg="${args[0],,}"  # lowercase package name

if $apt; then
    echo "Searching package for python3-$pkg"
    apt_pkg=$(apt search "^python3-$pkg$" 2>/dev/null | grep -o "^python3-[^/]*" | head -n1)
    apt_pkg="${apt_pkg:-python3-$pkg}"

    echo "Install via APT:"
    echo "    ➤ Requested package: $pkg"
    echo "    ➤ Found in APT: $apt_pkg"

    if $dry; then
        echo "[Dry Run] → would start command: sudo apt install $apt_pkg"
    else
        sudo apt install "$apt_pkg"
    fi
else
    echo "Install via pip / Python:"
    echo "    ➤ Found package in PyPI / Python pip: ${args[*]}"
    if $dry; then
        echo "[Dry Run] → would start command: pip install --break-system-packages ${args[*]}"
    else
        pip install --break-system-packages "${args[@]}"
    fi

