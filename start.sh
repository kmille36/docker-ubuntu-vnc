#!/bin/bash

umask 0077                # use safe default permissions
mkdir -p "$HOME/.vnc"     # create config directory
chmod go-rwx "$HOME/.vnc" # enforce safe permissions
vncpasswd -f <<< "123456" > "$HOME/.vnc/passwd" # set password to 123456
vncserver -rfbport 5900 # start vncserver with port 5901

# Start noVNC
./noVNC/utils/novnc_proxy --listen 6080 --vnc localhost:5900
