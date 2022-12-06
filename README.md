Backup and Move To New Profile .bat Usage
=========================================


This script is primarily used if a user is being migrated to Azure AD. This will copy Crhome passwords and favourites,
Edge favourites and files from the main folders Desktop, Documents, Pictures and Downloads. It will copy this information to a folder named Backup on the C drive.
It will then ask if you would like to copy these files to a different profile.

The best way to use this is to run the full version after you have created the new user profile and installed applications. You can then log in to the admin account
 and run the script 'fullCopyToBackupCopyToUser.bat'.

The script is seperated in to 2 parts. The first part 'sendToBackup.bat' will copy the files to 'C:\Backup'. The second part 'copyToUser.bat' will copy the files stored
in 'C:\Backup' to a profile of your choice in their correct locations.

