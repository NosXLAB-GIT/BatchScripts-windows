@echo off
:: Reset lại cấu hình mạng (IP, DNS)
echo [*] Resetting network settings...
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
echo [+] Network has been reset. Restart may be required.
pause
