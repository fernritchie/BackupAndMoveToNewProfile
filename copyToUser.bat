@echo off 

REM This will ask if you want to copy the files to the new user profile

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
xcopy /s /i "Bookmarks" "C:\Users\%UserInputName%\AppData\Local\Google\Chrome\User Data\Default"


REM This will copy the edge 'Bookmarks' file from 'Backup' to '\Microsoft\Edge\User Data\Default

cd C:\Backup\Edge
xcopy /s /i "Bookmarks" "C:\Users\%UserInputName%\AppData\Local\Microsoft\Edge\User Data\Default"


REM This will copy the 'Login Data' file from 'Backup' to '\Chrome\User Data\Default'

cd C:\Backup\Chrome
xcopy /s /i "Login Data" "C:\Users\%UserInputName%\AppData\Local\Google\Chrome\User Data\Default"


REM This will copy the users folders from 'Backup' to 'C:\Users\USER NAME\'

cd C:\Backup
xcopy /s /i "Desktop" "C:\Users\%UserInputName%\Desktop"
xcopy /s /i "Documents" "C:\Users\%UserInputName%\Documents"
xcopy /s /i "Pictures" "C:\Users\%UserInputName%\Pictures"
xcopy /s /i "Downloads" "C:\Users\%UserInputName%\Downloads"


pause