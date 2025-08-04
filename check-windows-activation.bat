@echo off
title Kiểm tra bản quyền Windows - NosXLab
color 0B
echo ================================================
echo       [KIỂM TRA BẢN QUYỀN WINDOWS - NOSXLAB]
echo ================================================
echo.
echo [1] Trạng thái kích hoạt:
slmgr.vbs /xpr
echo.
echo [2] Thông tin chi tiết bản quyền:
slmgr.vbs /dlv
echo.
echo [3] Key được cài (ẩn bớt):
slmgr.vbs /dli
echo.
pause
