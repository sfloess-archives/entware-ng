#!/bin/bash

echo "Start time:  `date`"

echo "   Running rsync..."

echo "       Backing up laptop    - using param(s) [$*]"
rsync -av root@laptop:/home/sfloess /opt/nas/backups/host/redhat-laptop/home $* --exclude .m2/repository --exclude Music --exclude Videos --exclude Downloads --exclude redhatCache 1>/dev/null 2>/dev/null

echo "       Backing up to host-3 - using param(s) [$*]"
rsync -av /opt/nas/backups/host root@host-3:/backups $* 1>/dev/null 2>/dev/null

echo "End time:    `date`"

