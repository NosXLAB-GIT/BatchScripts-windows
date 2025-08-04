@echo off
:: Xóa file tạm thời trên hệ thống - Clean Temp files
echo [*] Cleaning system temporary files...

timeout /t 1 >nul
del /f /s /q %temp%\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
del /f /s /q C:\Windows\Temp\* >nul 2>&1
rd /s /q C:\Windows\Temp >nul 2>&1

echo [+] Temp files deleted successfully!

pause
