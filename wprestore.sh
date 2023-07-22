#!/bin/bash

# WordPress installation directory without the '/' at the end.
_WPDIRECTORY="/var/www/html"

# Backups directory.
_BACKUPS="/home/ubuntu/backups"

# Name of the WordPress directory backup file.
_WPBKSITE="wp_site_xxxxxx.tgz"

# Name of the database backup file.
_SQLFILE="wp_db_xxxxxx.sql"

# Database root password.
_ROOTPASS="abc123"

cd $_BACKUPS="/home/ubuntu/backups"
cp $_WPBKSITE $_WPDIRECTORY
cd $_WPDIRECTORY
tar -xzf $_WPBKSITE
cd
rm $_WPDIRECTORY/$_WPBKSITE

# Extract the WordPress data with the wp-cli client.
DBNAME=$(wp config get DB_NAME --path="$_WPDIRECTORY")
DBUSER=$(wp config get DB_USER --path="$_WPDIRECTORY")
DBPASS=$(wp config get DB_PASSWORD --path="$_WPDIRECTORY")
DBHOST=$(wp config get DB_HOST --path="$_WPDIRECTORY")

# Create and restore the database.
mysql -u root -p$_ROOTPASS -se 'CREATE DATABASE $DBNAME;'
mysql -u root -p$_ROOTPASS $DBNAME < "$_BACKUPS"/"$_SQLFILE"
mysql -u root -p$_ROOTPASS -se "GRANT ALL PRIVILEGES ON $DBNAME.* to 'DBUSER'@'$DBHOST' identified by '$DBPASS';"
mysql -u root -p$_ROOTPASS -se 'FLUSH PRIVILEGES;'
