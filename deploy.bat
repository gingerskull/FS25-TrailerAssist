@echo off
set "modName=FS25_TrailerAssist.zip"
set "localDir=%USERPROFILE%\Documents\My Games\FarmingSimulator2025\mods"
set "oneDriveDir=%USERPROFILE%\OneDrive\Documents\My Games\FarmingSimulator2025\mods"

set "hasLocal="
set "hasOneDrive="

if exist "%localDir%\" set "hasLocal=1"
if exist "%oneDriveDir%\" set "hasOneDrive=1"

if defined hasLocal if defined hasOneDrive (
    echo Both Local and OneDrive mod folders found.
    echo [1] Copy to Local: %localDir%
    echo [2] Copy to OneDrive: %oneDriveDir%
    choice /C 12 /M "Choose destination"
    if errorlevel 2 (
        set "dest=%oneDriveDir%\"
    ) else (
        set "dest=%localDir%\"
    )
    goto :copy
)

if defined hasOneDrive (
    set "dest=%oneDriveDir%\"
    goto :copy
)

if defined hasLocal (
    set "dest=%localDir%\"
    goto :copy
)

echo Error: Neither Local nor OneDrive FS25 mod folders were found.
pause
exit /b 1

:copy
echo Deploying mod to %dest%...
copy /Y "%modName%" "%dest%" > nul
echo Deployment complete!
