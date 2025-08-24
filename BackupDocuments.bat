@echo off
:: Sao lưu thư mục Documents của người dùng - Backup user's Documents folder
set "SOURCE=%USERPROFILE%\Documents"
set "DEST=%USERPROFILE%\Documents_backup_%DATE:~-4%%DATE:~3,2%%DATE:~0,2%"
echo [*] Backing up "%SOURCE%" to "%DEST%" ...
robocopy "%SOURCE%" "%DEST%" /MIR /R:2 /W:5 >nul
echo [+] Backup completed.
pause
