#!/bin/bash
# Wait for Hyprland to write the session file
while [ ! -f /tmp/hypr-session ]; do
  sleep 1
done
sleep 10
exec /home/sneakypickle/scripts/bedTime/restore360.sh
