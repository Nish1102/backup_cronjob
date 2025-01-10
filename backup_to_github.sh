#!/bin/bash

# GitHub repository HTTPS URL (replacing 'YOUR_TOKEN' with an environment variable for security)
GIT_REPO="https://${GITHUB_TOKEN}@github.com/Nish1102/backup_cronjob.git"

# Backup directory and file
BACKUP_DIR="/home/nishant/Project/data-backup"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/cricket_backup_$DATE.sql"

# Step 1: Create a backup
echo "Creating a backup of the database..."
pg_dump -U postgres -d cricket -f $BACKUP_FILE

# Check if backup succeeded
if [ $? -ne 0 ]; then
    echo "Database backup failed!" >&2
    exit 1
fi
echo "Backup created successfully: $BACKUP_FILE"

# Step 2: Push backup to GitHub
echo "Pushing backup to GitHub repository..."
cd $BACKUP_DIR
git init
git add .
git commit -m "Database backup: $DATE"
git push $GIT_REPO main

# Check if push succeeded
if [ $? -ne 0 ]; then
    echo "Failed to push backup to GitHub!" >&2
    exit 1
fi

echo "Backup successfully pushed to GitHub!"

