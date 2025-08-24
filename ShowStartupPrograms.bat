@echo off
:: Liệt kê các chương trình khởi động cùng hệ thống - List startup programs
echo [*] Listing startup programs...
wmic startup get Caption,Command > "%TEMP%\startup_programs.txt"
type "%TEMP%\startup_programs.txt"
echo [+] List saved to %TEMP%\startup_programs.txt
pause
