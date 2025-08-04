@echo off
:: Tối ưu các dịch vụ, hiệu suất máy tính cơ bản

echo [*] Applying performance tweaks...
:: Tắt Superfetch và SysMain
sc stop "SysMain"
sc config "SysMain" start= disabled
:: Tắt dịch vụ in ấn nếu không dùng
sc stop "Spooler"
sc config "Spooler" start= disabled
:: Tăng tốc shutdown
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 2000 /f

echo [+] Optimization complete!
pause
