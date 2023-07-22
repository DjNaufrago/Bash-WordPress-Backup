# Bash WordPress Backup / Restore
Backup script to WordPress and database.
Optional, make regular backups.

## INSTRUCTIONS FOR BACKUP
1. Download the wpbackup.sh script to the home directory:  
`wget https://raw.githubusercontent.com/DjNaufrago/Bash-WordPress-Backup/main/wpbackup.sh`
2. Edit the paths and directory names if necessary.
3. Create the backup directory:  
`mkdir backups`
4. Run the script:  
`bash ./wpbackup.sh`

## CREATE SCHEDULED TASK TO PERFORM BACKUPS.
1. Make the script executable:  
`chmod +x wpbackup.sh`
2. Move it to the user's local executable directory (without extension):  
`mv wpbackup.sh /usr/local/bin/wpbackup`
3. Add the scheduled task:  
`crontab -e`
4. Write the recurrence of the task and the path of the script:  
`@weekly /usr/local/bin/wpbackup`
5. Save with Ctrl+o and exit with Ctrl+x.
6. Optionally, the scheduled task can be reviewed with the following command:  
`crontab -l`

This script will be executed once every Sunday at 00:00. You can replace it with the following values and adapt it to your needs:  
**@hourly** runs the script every hour of every day at 0 minutes on the hour.  
**@daily** runs the script every day at midnight.  
**@weekly** runs the script every week at midnight on Sunday.  
**@monthly** runs the script every month at midnight on the first day of the month.  
**@yearly** runs the script every year at midnight on the first day of January.  
**@reboot** runs the script only at system startup.

## INSTRUCTIONS FOR RESTORE

### Requirements
- If you are going to restore from an installation from scratch, install LAMP and WordPress following the instructions described [here](https://github.com/DjNaufrago/LAMP-Wordpress-installer/tree/main).
- Have in a directory, a copy of your backups generated with the previous script.
- **Note that both the web directory and the database will be deleted. Any changes after the backup will be lost.**

### Download and Run the Script
1. Download the wprestore.sh script to the home directory:  
`wget https://raw.githubusercontent.com/DjNaufrago/Bash-WordPress-Backup/main/wprestore.sh`
2. Edit the paths and directory names if necessary.
3. Run the script:  
`bash ./wprestore.sh`
