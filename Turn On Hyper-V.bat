@echo off
echo ===============================================
echo = BẬT ĐẦY ĐỦ HYPER-V VÀ CÁC THÀNH PHẦN LIÊN QUAN =
echo ===============================================
:: Bật toàn bộ Hyper-V
DISM /Online /Enable-Feature:Microsoft-Hyper-V-All /All /NoRestart

:: Bật Virtual Machine Platform (quan trọng cho WSA, Docker, Android Emulators)
DISM /Online /Enable-Feature:VirtualMachinePlatform /All /NoRestart

:: Bật Windows Hypervisor Platform
DISM /Online /Enable-Feature:HypervisorPlatform /All /NoRestart

:: Đảm bảo Hypervisor luôn khởi động cùng Windows
bcdedit /set hypervisorlaunchtype auto
echo ===============================================
echo =   ĐÃ BẬT TOÀN BỘ - KHỞI ĐỘNG LẠI ĐỂ ÁP DỤNG   =
echo ===============================================
pause
