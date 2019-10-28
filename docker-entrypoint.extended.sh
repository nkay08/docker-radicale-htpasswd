#!/bin/sh

echo "Removing temporary files in /tmp"
rm -rf /tmp/*

setup_htpasswd.sh

echo "Starting radicale"
source docker-entrypoint.sh