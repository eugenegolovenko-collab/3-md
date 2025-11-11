#!/bin/bash

SRC="$HOME"
DEST="/tmp/backup"
LOGTAG="backup_home"

# Creating backup directory
mkdir -p "$DEST"

# Running rsync
rsync -av --delete --checksum --exclude='.*' "$SRC"/ "$DEST"/
STATUS=$?

# Checking results and logging
if [ $STATUS -eq 0 ]; then
    logger -t "$LOGTAG" "Calm down and relax, bro! Backup succesfull."
else
    logger -t "$LOGTAG" "Backup error - code $STATUS"
fi