@echo off
REM World to backup & backup destination params ###
REM
REM @var world_name Optional param to define your world's name
REM @var world_directory The world you want to backup
REM @var world_backups_directory The directory you want your backups to be stored at
REM
set world_name="UnMundoFeliz"
set world_directory="C:\Users\BGM\AppData\Roaming\.minecraft\saves\BGM 1.0"
set world_backups_directory="C:\Users\BGM\Desktop\destiny"
REM

echo.
echo [WORLD BACKUPS] Backup your Minecraft world with a simple double-click!
echo Starting...
echo.

timeout /t 3 /nobreak > NUL

REM System Date & Hour logic
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set time_stamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%

set copy_instance_directory=%world_backups_directory%\%world_name%-Backup-%time_stamp%
mkdir %copy_instance_directory%

echo #################################################################
echo ^>^> Copying %world_directory%
echo ^>^> into
echo ^>^> %copy_instance_directory%
echo #################################################################
echo.

timeout /t 3 /nobreak > NUL

echo --- ^> Copied files ^< ---
xcopy /s /i %world_directory% %copy_instance_directory%
echo ------------------------
echo.

echo ^> Thank you for using my script!
echo ^> Made w/ ^<3 by: BGM ^<

timeout /t 5
PAUSE

