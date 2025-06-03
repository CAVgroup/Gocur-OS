:: Save this as batch_os.bat in the same directory as index.html
@echo off
setlocal enabledelayedexpansion
color 0A
title Simple Batch OS

:MAIN_MENU
cls
echo.
echo   ==============================================
echo    Simple Batch Operating System
echo   ==============================================
echo.
echo        1. File Manager        4. Text Editor
echo        2. System Info         5. Calculator
echo        3. Process Manager     6. Network Tools
echo.
echo        0. Exit
echo.
echo   ==============================================

set /p choice="Select an option [0-6]: "

if "%choice%"=="1" goto FILE_MANAGER
if "%choice%"=="2" goto SYSTEM_INFO
if "%choice%"=="3" goto PROCESS_MANAGER
if "%choice%"=="4" goto TEXT_EDITOR
if "%choice%"=="5" goto CALCULATOR
if "%choice%"=="6" goto NETWORK_TOOLS
if "%choice%"=="0" exit /b

echo Invalid selection. Please try again.
pause
goto MAIN_MENU

:FILE_MANAGER
cls
echo === File Manager ===
echo 1. List files
echo 2. View file
echo 3. Create file
echo 4. Delete file
echo 5. Back to main menu

set /p fm_choice="Select option: "

if "%fm_choice%"=="1" (
    dir /p
    pause
    goto FILE_MANAGER
)
if "%fm_choice%"=="2" (
    set /p filename="Enter filename: "
    if exist "!filename!" (
        type "!filename!" | more
    ) else (
        echo File not found!
    )
    pause
    goto FILE_MANAGER
)
if "%fm_choice%"=="3" (
    set /p filename="Enter new filename: "
    echo. > "!filename!"
    echo File created.
    pause
    goto FILE_MANAGER
)
if "%fm_choice%"=="4" (
    set /p filename="Enter filename to delete: "
    if exist "!filename!" (
        del "!filename!"
        echo File deleted.
    ) else (
        echo File not found!
    )
    pause
    goto FILE_MANAGER
)
if "%fm_choice%"=="5" goto MAIN_MENU

echo Invalid selection.
pause
goto FILE_MANAGER

:: Additional menu implementations would go here
:: (SYSTEM_INFO, PROCESS_MANAGER, etc.)

goto MAIN_MENU
