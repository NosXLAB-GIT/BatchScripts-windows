@echo off
:: Tự động chạy Disk Cleanup - Run Disk Cleanup automatically
echo [*] Opening Disk Cleanup setup...
cleanmgr /sageset:1
if errorlevel 1 goto end

echo [*] Running Disk Cleanup...
cleanmgr /sagerun:1

:end
echo [+] Disk Cleanup completed.
pause
