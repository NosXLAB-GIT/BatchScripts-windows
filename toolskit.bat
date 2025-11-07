@echo off
:: Kiểm tra quyền admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Dang yeu cau quyen quan tri...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
:: Bat dau chuong trinh
color 0A
title NosXTools - Windows Utility Pack
:MENU
cls
echo ================================================
echo         NOSXTools WINDOWS TOOLKIT - V1.1
echo ================================================
echo [1] Kiem tra thong tin Windows
echo [2] Tat Windows Defender
echo [3] Bat Windows Defender
echo [4] Tat Windows Update
echo [5] Bat Windows Update
echo [6] Bat Windows Security Notifications
echo [7] Bat lai Windows Security Notifications
echo [8] Kiem tra key ban quyen (license)
echo [0] Thoat
echo ================================================
set /p choose=Chon chuc nang (0-8): 
if "%choose%"=="1" goto CHECK_WIN
if "%choose%"=="2" goto DISABLE_DEFENDER
if "%choose%"=="3" goto ENABLE_DEFENDER
if "%choose%"=="4" goto DISABLE_UPDATE
if "%choose%"=="5" goto ENABLE_UPDATE
if "%choose%"=="6" goto DISABLE_SECURITY_NOTIFY
if "%choose%"=="7" goto ENABLE_SECURITY_NOTIFY
if "%choose%"=="8" goto CHECK_LICENSE
if "%choose%"=="0" exit
goto MENU
:CHECK_WIN
cls
echo --- THONG TIN HE DIEU HANH ---
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
wmic os get caption,version,osarchitecture
echo.
pause
goto MENU
:DISABLE_DEFENDER
cls
echo --- TAT WINDOWS DEFENDER ---
powershell Set-MpPreference -DisableRealtimeMonitoring $true
echo [✓] Da tat Windows Defender (tam thoi)
pause
goto MENU
:ENABLE_DEFENDER
cls
echo --- BAT WINDOWS DEFENDER ---
powershell Set-MpPreference -DisableRealtimeMonitoring $false
echo [✓] Da bat lai Windows Defender
pause
goto MENU
:DISABLE_UPDATE
cls
echo --- TAT WINDOWS UPDATE ---
sc stop wuauserv
sc config wuauserv start= disabled
echo [✓] Da tat Windows Update
pause
goto MENU
:ENABLE_UPDATE
cls
echo --- BAT WINDOWS UPDATE ---
sc config wuauserv start= auto
sc start wuauserv
echo [✓] Da bat lai Windows Update
pause
goto MENU
:DISABLE_SECURITY_NOTIFY
cls
echo --- TAT THONG BAO SECURITY ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f
echo [✓] Da tat thong bao Security
pause
goto MENU
:ENABLE_SECURITY_NOTIFY
cls
echo --- BAT LAI THONG BAO SECURITY ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 1 /f
echo [✓] Da bat lai thong bao Security
pause
goto MENU
:CHECK_LICENSE
cls
echo --- THONG TIN BAN QUYEN ---
slmgr /xpr
echo.
slmgr /dli
echo.
pause
goto MENU
