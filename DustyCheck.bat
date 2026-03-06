@echo off
setlocal enabledelayedexpansion
title DustyCheck v2.1

:: Color Definitions (ANSI)
set "cyan=[36m"
set "green=[32m"
set "yellow=[33m"
set "red=[31m"
set "reset=[0m"
set "bold=[1m"

:menu
cls
echo %cyan%==========================================================%reset%
echo %bold%              DUSTYCHECK - FILE FINDER V2.1            %reset%
echo %cyan%==========================================================%reset%
echo.

:: User Input
set /p "ext=%yellow% Enter extension (e.g. pdf, txt): %reset%"
set /p "days=%yellow% Days to look back (e.g. 7): %reset%"

echo.
echo %green%Searching for .%ext% files modified in the last %days% days...%reset%
echo ----------------------------------------------------------
echo.

:: Execution via PowerShell with European Date Format (dd/MM/yyyy)
powershell -Command ^
    "$dateLimit = (Get-Date).AddDays(-%days%); " ^
    "$files = Get-ChildItem -Filter '*.%ext%' | Where-Object { $_.LastWriteTime -ge $dateLimit }; " ^
    "if ($files) { " ^
    "   foreach ($f in $files) { " ^
    "       Write-Host ('%green% OK: %reset% ' + '\"' + $f.Name + '\"' + ' %cyan%(' + $f.LastWriteTime.ToString('dd/MM/yyyy') + ')%reset%') " ^
    "   } " ^
    "} else { " ^
    "   Write-Host '%red%[!] No files found within the specified period.%reset%' " ^
    "}"

echo.
echo ----------------------------------------------------------
echo %bold%Search completed.%reset%
echo.
echo %yellow%[M] Back to Menu  [E] Exit%reset%
set /p "choice=Select an option: "

if /i "%choice%"=="M" goto menu
if /i "%choice%"=="E" exit
