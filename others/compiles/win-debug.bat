@echo off
cls
color 04
title Build Tool - v. 1.4
timeout /t 1 >nul
echo Wellcome:
hostname
timeout /t 1 >nul
echo Build mode: Windows (Debug)
cd..
cd..
color 0a
echo Building...
lime test windows -debug
echo Game Has Been Closed.
echo Exiting...
timeout /t 3 /nobreak >nul
pause
exit
@echo on