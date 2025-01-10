#!/bin/bash

# Load PostgreSQL credentials from the configuration file
source /home/nishant/Project/db-config/db_config.conf

# GitHub repository HTTPS URL with token
GIT_REPO="https://${GITHUB_TOKEN}@github.com/Nish1102/backup_cronjob.git"

# Backup directory and file
BACKUP_DIR="/home/nishant/Project/data-backup"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/cricket_backup_$DATE.sql"

# Step 1: Create a backup
echo "Creating a backup of the database..."
PGPASSWORD=$POSTGRES_PASSWORD pg_dump -U $POSTGRES_USER -h $POSTGRES_HOST -p $POSTGRES_PORT -d $POSTGRES_DB -f $BACKUP_FILE

if [ $? -ne 0 ]; then
    echo "Database backup failed!" >&2
    exit 1
fi
echo "Backup created successfully: $BACKUP_FILE"

# Step 2: Push backup to GitHub
echo "Pushing backup to GitHub repository..."
cd $BACKUP_DIR
git add .
git commit -m "Database backup: $DATE"
git push $GIT_REPO main

if [ $? -ne 0 ]; then
    echo "Failed to push backup to GitHub!" >&2
    exit 1
fi

echo "Backup successfully pushed to GitHub!"

