@echo off 


:: This script is primarily used if a user is being migrated to Azure AD. This will copy Crhome passwords and favourites,
:: Edge favourites and files from the main folders Desktop, Documents, Pictures and Downloads. It will copy this information
:: to a folder named Backup on the C drive. It will then ask if you would like to copy these files to a different profile.
:: 
:: The best way to use this is to have already connected the machine to Azure AD and have installed applications. You can then
:: login with an admin account and run this script.




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


REM This will ask if you wish to copy to the new user profile straight away

set /p copyToNewUser=Do you wish to copy the files to the new user profile now? Please enter Y/N ...

if %copyToNewUser%==n (
    exit
)

if %copyToNewUser%==N (
    exit
)

REM This will ask for the new user's username

set /p newUserName=Please enter the username you wish to copy to. This can be found in the C:\Users folder ...


REM This will copy the chrome 'Bookmarks' file from 'Backup' to 'Chrome\User Data\Default'

cd C:\Backup\Chrome
xcopy /s /i "Bookmarks" "C:\Users\%newUserName%\AppData\Local\Google\Chrome\User Data\Default"


REM This will copy the edge 'Bookmarks' file from 'Backup' to '\Microsoft\Edge\User Data\Default

cd C:\Backup\Edge
xcopy /s /i "Bookmarks" "C:\Users\%newUserName%\AppData\Local\Microsoft\Edge\User Data\Default"


REM This will copy the 'Login Data' file from 'Backup' to '\Chrome\User Data\Default'

cd C:\Backup\Chrome
xcopy /s /i "Login Data" "C:\Users\%newUserName%\AppData\Local\Google\Chrome\User Data\Default"



REM This will copy the users folders from 'Backup' to 'C:\Users\USER NAME\'

cd C:\Backup
xcopy /s /i "Desktop" "C:\Users\%newUserName%\Desktop"
xcopy /s /i "Documents" "C:\Users\%newUserName%\Documents"
xcopy /s /i "Pictures" "C:\Users\%newUserName%\Pictures"
xcopy /s /i "Downloads" "C:\Users\%newUserName%\Downloads"


pause