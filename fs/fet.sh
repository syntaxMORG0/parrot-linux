#!/bin/sh

echo "SYSTEM INFO (fet.sh made by syntaxMORG0)"
echo "(C) syntaxMORG0 2026 for Parrot Linux, GPL3.0"
echo ""

# kernel
echo "kernel:  $(uname -sr)"

# uptime (seconds)
if [ -r /proc/uptime ]; then
    up=$(cut -d' ' -f1 /proc/uptime)
    echo "uptime:  ${up} seconds"
fi

# cpu
if [ -r /proc/cpuinfo ]; then
    cpu=$(grep -m1 "model name" /proc/cpuinfo | cut -d':' -f2)
    echo "cpu:     ${cpu# }"
fi

# memory
if [ -r /proc/meminfo ]; then
    mem=$(grep MemTotal /proc/meminfo | awk '{print $2, $3}')
    echo "memory:  $mem"
fi

# shell
echo "shell:   $SHELL"

echo ""
