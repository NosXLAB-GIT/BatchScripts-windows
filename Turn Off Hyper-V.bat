@echo off
echo === TAT HYPER-V & LIEN QUAN ===

DISM /Online /Disable-Feature:Microsoft-Hyper-V-All /NoRestart
DISM /Online /Disable-Feature:VirtualMachinePlatform /NoRestart
DISM /Online /Disable-Feature:Microsoft-Windows-Subsystem-Linux /NoRestart
DISM /Online /Disable-Feature:HypervisorPlatform /NoRestart
DISM /Online /Disable-Feature:Windows-Defender-ApplicationGuard /NoRestart
DISM /Online /Disable-Feature:Containers-DisposableClientVM /NoRestart
bcdedit /set hypervisorlaunchtype off

echo === XONG. VUI LONG RESTART ===
pause
