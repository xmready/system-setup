#!/usr/bin/bash
#mount google drive to local directory

sleep 15 \
&& rclone mount gdrive: ~/gdrive --daemon --vfs-cache-mode full
