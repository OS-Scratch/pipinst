#!/usr/bin/env bash

dry=false
dnf=false
pipinst_help=false
args=()
version="1.0.1"

for arg in "$@"; do
    case "$arg" in
        --dry-run) dry=true; continue ;;
        --try|--dnf|--system) dnf=true; continue ;; 
        --pihelp) pipinst_help=true; continue ;;
        *) args+=("$arg") ;;
    esac
done

if $pipinst_help; then
    echo "pipinst - tool for installing python packages on Linux"
    echo "version $version"
    echo "For Fedora/Red Hat-based distributions."
    echo "Available commands:"
    echo "pipinst --pihelp - shows this command"
    echo "pipinst pkg - install package pkg via pip / Python"
    echo "pipinst pkg --dnf - install package pkg via dnf"
    echo "pipinst pkg (--dnf) --dry-run - shows command without executing"
    echo "pipinst is free and open-source."
    echo "Made with love and passion in Switzerland."
    exit 0
fi

if [[ ${#args[@]} -eq 0 ]]; then
    echo "No package given as parameter. Example: pipinst numpy"
    exit 1
fi

pkg="${args[0],,}"  # lowercase package name

if $dnf; then
    echo "Searching package for python3-$pkg"
    dnf_pkg=$(dnf search "^python3-$pkg$" 2>/dev/null | grep -o "^python3-[^/]*" | head -n1)
    dnf_pkg="${dnf_pkg:-python3-$pkg}"

    echo "Install via dnf:"
    echo "    ➤ Requested package: $pkg"
    echo "    ➤ Found in dnf: $dnf_pkg"

    if $dry; then
        echo "[Dry Run] → would start command: sudo dnf install $dnf_pkg"
    else
        sudo apt install "$dnf_pkg"
    fi
else
    echo "Install via pip / Python:"
    echo "    ➤ Found package in PyPI / Python pip: ${args[*]}"
    if $dry; then
        echo "[Dry Run] → would start command: pip install --break-system-packages ${args[*]}"
    else
        pip install --break-system-packages "${args[@]}"
    fi
