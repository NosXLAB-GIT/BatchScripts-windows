@echo off
title Check Windows Info - NosXLab
color 0A

echo ================================================
echo         [CHECK WINDOWS INFO - NOSXLAB]
echo ================================================
echo.
echo [1] OS Name:
wmic os get Caption
echo.
echo [2] OS Version:
ver
echo.
echo [3] System Architecture:
wmic os get OSArchitecture
echo.
echo [4] PC Name:
echo %COMPUTERNAME%
echo.
echo [5] Logged In User:
echo %USERNAME%
echo.
echo [6] Processor:
wmic cpu get Name
echo.
echo [7] RAM Installed:
wmic memorychip get capacity
echo.
echo [8] Disk Info:
wmic logicaldisk get name,size,freespace
echo.
echo [9] BIOS Version:
wmic bios get smbiosbiosversion
echo.
pause
