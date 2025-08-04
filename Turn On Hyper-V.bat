@echo off
echo ===============================================
echo = BẬT ĐẦY ĐỦ HYPER-V VÀ CÁC THÀNH PHẦN LIÊN QUAN =
echo ===============================================
DISM /Online /Enable-Feature:Microsoft-Hyper-V-All /All /NoRestart
DISM /Online /Enable-Feature:VirtualMachinePlatform /All /NoRestart
DISM /Online /Enable-Feature:HypervisorPlatform /All /NoRestart
bcdedit /set hypervisorlaunchtype auto
echo ===============================================
echo =   ĐÃ BẬT TOÀN BỘ - KHỞI ĐỘNG LẠI ĐỂ ÁP DỤNG   =
echo ===============================================
pause
