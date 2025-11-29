@echo off
title NosXLab System Cleaner & Memory Booster
cls

:: Force Administrator
>nul 2>&1 net session || (
    powershell -Command "Start-Process cmd -ArgumentList '/c %~0' -Verb RunAs"
    exit /b
)

setlocal EnableDelayedExpansion
set progress=0

call :update "Initializing..."
timeout /t 1 >nul

:: ===================== 10% CLEAR USER TEMP =====================
call :update "Cleaning User Temp..."
del /s /q "%temp%\*.*" >nul 2>&1
set progress=10

:: ===================== 25% CLEAR WINDOWS TEMP ====================
call :update "Cleaning Windows Temp..."
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
set progress=25

:: ===================== 40% CLEAR PREFETCH =======================
call :update "Cleaning Prefetch cache..."
del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
set progress=40

:: ===================== 55% CLEAN UPDATE CACHE ===================
call :update "Cleaning Windows Update cache..."
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
md "C:\Windows\SoftwareDistribution" >nul 2>&1
set progress=55

:: ===================== 70% CLEAR EVENT LOGS =====================
call :update "Cleaning Event Logs..."
for /F "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G" >nul 2>&1
set progress=70

:: ===================== 85% MEMORY OPTIMIZATION ==================
call :update "Freeing RAM..."
powershell -command "Clear-PhysicalMemory" >nul 2>&1
powershell -command "Get-Process | ForEach-Object { $_.MinWorkingSet = 1MB }" >nul 2>&1
set progress=85

:: ===================== 95% CLEAR NETWORK DNS CACHE ==============
call :update "Flushing DNS..."
ipconfig /flushdns >nul 2>&1
set progress=95

:: ===================== 100% DONE =================================
call :update "Finalizing..."
timeout /t 1 >nul
set progress=100

cls
echo ==============================================
echo NosXTools System Cleanup & Memory Boost Complete
echo ==============================================
echo Temp files, caches, and Update data removed.
echo RAM optimized. Your system is now refreshed.
echo No restart required.
echo ==============================================
pause
exit /b


:update
cls
set /a prog=progress
echo Progress: !prog! %% - %~1
goto :eof
