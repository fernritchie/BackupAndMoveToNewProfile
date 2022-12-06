@echo off 

REM This will create all directories needed if they don't already exist.

cd C:\
if not exist "C:\Backup\" mkdir C:\Backup
if not exist "C:\Backup\Chrome" mkdir C:\Backup\Chrome
if not exist "C:\Backup\Edge" mkdir C:\Backup\Edge
if not exist "C:\Backup\Folders" mkdir C:\Backup\Desktop
if not exist "C:\Backup\Folders" mkdir C:\Backup\Documents
if not exist "C:\Backup\Folders" mkdir C:\Backup\Pictures
if not exist "C:\Backup\Folders" mkdir C:\Backup\Downloads





REM This will ask for the current user's username within the Users folder

set /p UserInputName=Please enter the username of the user whos data you need to send to back up. This can be found in the C:\Users folder...



REM This will copy the chrome 'Bookmarks' file to 'Backup'

cd C:\Users\%UserInputName%\AppData\Local\Google\Chrome\User Data\Default
xcopy /s /i "Bookmarks" "C:\Backup\Chrome"


REM This will copy the edge'Bookmarks' file to 'Backup'

cd C:\Users\%UserInputName%\AppData\Local\Microsoft\Edge\User Data\Default
xcopy /s /i "Bookmarks" "C:\Backup\Edge"


REM This will copy the 'Login Data' file to 'Backup'

cd C:\Users\%UserInputName%\AppData\Local\Google\Chrome\User Data\Default
xcopy /s /i "Login Data" "C:\Backup\Chrome"



REM This will copy the users folders.

cd C:\Users\%UserInputName%\
xcopy /s /i "Desktop" "C:\Backup\Desktop"
xcopy /s /i "Documents" "C:\Backup\Documents"
xcopy /s /i "Pictures" "C:\Backup\Pictures"
xcopy /s /i "Downloads" "C:\Backup\Downloads"


