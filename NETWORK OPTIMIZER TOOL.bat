@echo off
:: -----------------------------------
:: TỰ YÊU CẦU QUYỀN ADMIN
:: -----------------------------------
>nul 2>&1 net session
if %errorLevel% NEQ 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

title NETWORK OPTIMIZER
color 0a

:MENU
cls
echo =======================================
echo    NETWORK OPTIMIZER TOOL - NosXTool
echo =======================================
echo 1. Flush DNS (Xoa DNS Cache)
echo 2. Reset Winsock (Sua loi mang)
echo 3. Reset TCP/IP
echo 4. Renew IP (Cap moi dia chi IP)
echo 5. Reset Firewall ve mac dinh
echo 6. Toi uu mang toan dien (All-in-One)
echo 7. Kiem tra ping Google
echo 8. Xem thong tin mang
echo 9. Xoa bo dem Windows Update
echo 10. Thoat
echo =======================================
set /p choice=Nhap lua chon (1-10): 

if "%choice%"=="1" goto FLUSH
if "%choice%"=="2" goto WINSOCK
if "%choice%"=="3" goto TCPIP
if "%choice%"=="4" goto RENEW
if "%choice%"=="5" goto FIREWALL
if "%choice%"=="6" goto FULL
if "%choice%"=="7" goto PINGGG
if "%choice%"=="8" goto INFO
if "%choice%"=="9" goto WUCLEAR
if "%choice%"=="10" exit
goto MENU

:FLUSH
cls
echo Dang xoa DNS cache...
ipconfig /flushdns
echo Hoan tat!
pause
goto MENU

:WINSOCK
cls
echo Dang reset Winsock...
netsh winsock reset
echo Hoan tat!
pause
goto MENU

:TCPIP
cls
echo Dang reset TCP/IP...
netsh int ip reset
echo Hoan tat!
pause
goto MENU

:RENEW
cls
echo Dang cap lai dia chi IP...
ipconfig /release
ipconfig /renew
echo Da cap moi IP!
pause
goto MENU

:FIREWALL
cls
echo Dang reset Windows Firewall ve mac dinh...
netsh advfirewall reset
echo Hoan tat!
pause
goto MENU

:FULL
cls
echo Dang toi uu mang toan dien...
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
echo ==================================================
echo        TOI UU MANG TOAN DIEN HOAN TAT!
echo ==================================================
pause
goto MENU

:PINGGG
cls
echo Dang kiem tra do on dinh mang...
ping google.com -t
pause
goto MENU

:INFO
cls
echo THONG TIN MANG:
ipconfig /all
pause
goto MENU

:WUCLEAR
cls
echo Dang xoa cache Windows Update...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
del /f /s /q C:\Windows\SoftwareDistribution\*
del /f /s /q C:\Windows\System32\catroot2\*
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo Da xoa bo dem Windows Update!
pause
goto MENU
