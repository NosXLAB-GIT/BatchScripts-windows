@echo off
:: Dọn dẹp Windows Update cache để sửa lỗi update

echo [*] Stopping update services...
net stop wuauserv
net stop bits
echo [*] Deleting SoftwareDistribution folder...
rd /s /q C:\Windows\SoftwareDistribution
echo [*] Restarting update services...
net start wuauserv
net start bits

echo [+] Windows Update cache cleared.
pause
