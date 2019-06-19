@echo off

set ymd=%date:~0,10%%date:~5,2%%date:~8,2%

set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%

set ymd_t=%ymd_t: =0%

echo start at:%ymd_t%>>%ymd%log.txt


:rescan

@echo off

echo #_Disk_Clean_Application_MS-DOS_Edition_#

echo START 

pause

color 0a


del /f /s /q %sytemdrive%\*.tmp

del /f /s /q %sytemdrive%\*.log

del /f /s /q %sytemdrive%\*._mp

del /f /s /q %sytemdrive%\*.gid

del /f /s /q %sytemdrive%\*.old

del /f /s /q %sytemdrive%\*.chk

del /f /s /q %sytemdrive%\recycled\*.*

del /f /s /q %sytemdrive%\*.bak

cls


:menu

color 0f

echo Start advanced mode?

echo [Y]: Yes  [N]: No and Exit

set /p xn=# Press Enter to confirm #:_

if /i "%xn%"=="Y" goto :advanced

if /i "%xn%"=="N" goto :log

echo Invalid key &ping 0 -n "2">nul&cls&goto menu


:advanced

color 0b

echo START ADVANCED MODE

echo It may take 5 mins to finish the process.

del /f /s /q %windir%\*.bak

del /f /s /q %windir%\prefetch\*.*

del /f /s /q %windir%\*.tmp

rd /s /q %windir%\temp & md %windir%\temp

del /f /s /q %userprofile%\cookies\*.*

del /f /s /q %userprofile%\recent\*.*

del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"

del /f /s /q "%userprofile%\Local Settings\Temp\*.*"

del /f /s /q "%userprofile%\recent\*.*"

cls


:menu2

color 0f

echo [R]: Rescan  [D]: Launch Diskpart.exe [E]: Exit 

set /p yn=# Press enter to confirm: #_

if /i "%yn%"=="R" goto :rescan

if /i "%yn%"=="D" goto :diskpart

if /i "%yn%"=="E" goto :log

echo invalid &ping 0 -n "2">nul&cls&goto menu2


:diskpart

echo create vdisk file="c:\win7.vhd"maximum=10240m type=expandable >%temp%\Script

echo select vdisk file=c:\win7.vhd>>%temp%\Script

echo attach vdisk>>%temp%\Script

echo create partition primary>>%temp%\Script

echo assign letter=x>>%temp%\Script

echo format quick label="win7boot">>%temp%\Script

diskpart<%temp%\Script


:log

set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%

set ymd_t=%ymd_t: =0%

echo end at:%ymd_t%>>%ymd%log.txt


echo & pause

exit

