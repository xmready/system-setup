#!/usr/bin/bash
#mount google drive to local directory

sleep 10 \
&& rclone mount gdrive: ~/gdrive --daemon --vfs-cache-mode full \
&& rclone mount vault: ~/vault --daemon --vfs-cache-mode full --file-perms 600
