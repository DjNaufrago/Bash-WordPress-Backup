#!/bin/bash

# WordPress installation directory (correct path if necessary) without the '/ ' at the end.
_WPDIRECTORY="/var/www/html"

# Directory for backups. It should already be created (mkdir dirname).
_BACKUPS="/home/ubuntu/backups"

# Set date and names for files.
_NOW=$(date +"%m_%d_%Y")
_FILE1="wp_db_$_NOW.sql"
_FILE2="wp_site_$_NOW.tgz"

# Get WordPress data With the wp-cli client.
DBNAME=$(wp config get DB_NAME --path="$_WPDIRECTORY")
DBUSER=$(wp config get DB_USER --path="$_WPDIRECTORY")
DBPASS=$(wp config get DB_PASSWORD --path="$_WPDIRECTORY")
DBHOST=$(wp config get DB_HOST --path="$_WPDIRECTORY")

# Copy the database to the backup directory.
mysqldump -u $DBUSER -p$DBPASS $DBNAME -h $DBHOST > "$_BACKUPS"/"$_FILE1"

# Backup the entire WordPress directory to the backup directory.
cd $_WPDIRECTORY
tar -czf "$_BACKUPS"/"$_FILE2" *
