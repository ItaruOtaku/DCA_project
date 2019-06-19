:rescan
@echo off
echo #_Disk_Clean_Application_MS-DOS_Edition_#
echo START 
pause
set ymd=%date:~0,10%%date:~5,2%%date:~8,2%
set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
set ymd_t=%ymd_t: =0%
echo start at:%ymd_t%>>%userprofile%\desktop\file_deleted.html
color 0a
del /f /s /q %windir%\*.bak>>%userprofile%\desktop\file_deleted.html
del /f /s /q %windir%\prefetch\*.*>>%userprofile%\desktop\file_deleted.html
del /f /s /q %windir%\*.tmp>>%userprofile%\desktop\file_deleted.html
rd /s /q %windir%\temp & md %windir%\temp>>%userprofile%\desktop\file_deleted.html
del /f /s /q %userprofile%\cookies\*.*>>%userprofile%\desktop\file_deleted.html
del /f /s /q %userprofile%\recent\*.*>>%userprofile%\desktop\file_deleted.html
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">>%userprofile%\desktop\file_deleted.html
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">>%userprofile%\desktop\file_deleted.html
del /f /s /q "%userprofile%\recent\*.*">>%userprofile%\desktop\file_deleted.html
del /f /s /q "%userprofile%\desktop\errorlog.txt">>%userprofile%\desktop\file_deleted.html
cls
:menu
color 0f
echo Start advanced mode or XP cleaning mode:
echo [A]: Advanced mode [X]: XP cleaning mode [E]: exit
set /p x=# Press Enter to confirm #:_
if /i "%x%"=="A" goto :advanced
if /i "%x%"=="E" goto :log
if /i "%x%"=="X" goto :XP
echo Invalid key &ping 0 -n "2">nul&cls&goto menu
:advanced
color 0b
echo START ADVANCED MODE
echo It may take 5 mins to finish the process.
del /f /s /q %systemdrive%\*.tmp>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.log>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.dmp>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.gid>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.old>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.chk>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\recycled\*.*>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.bak>>%userprofile%\desktop\file_deleted.html
cls
:menu2
color 0f
echo Finished
echo [R]: Rescan  [D]: Launch Diskpart.exe [X]: WinXP Cleaning mode [E]: Exit 
set /p y=# Press enter to confirm: #_
if /i "%y%"=="R" goto :rescan
if /i "%y%"=="D" goto :diskpart
if /i "%y%"=="E" goto :log
if /i "%y%"=="X" goto :XP
echo Invalid key &ping 0 -n "2">nul&cls&goto menu2
:diskpart
echo create vdisk file="c:\win7.vhd"maximum=10240m type=expandable>%temp%\Script
echo select vdisk file=c:\win7.vhd>>%temp%\Script
echo attach vdisk>>%temp%\Script
echo create partition primary>>%temp%\Script
echo assign letter=x>>%temp%\Script
echo format quick label="win7boot">>%temp%\Script
diskpart<%temp%\Script
:log
set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
set ymd_t=%ymd_t: =0%
echo Successfully scanned. %ymd_t%>>%userprofile%\desktop\file_deleted.html
rename %userprofile%\desktop\file_deleted.html file_deleted.log
start %userprofile%\desktop\file_deleted.log
echo & pause
rename %userprofile%\desktop\file_deleted.log file_deleted.html
exit
:XP
color 0e
echo START XP MODE
echo This mode only works in WinXP system. (x86/x64)
del /f /s /q %systemdrive%\*.dmp>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.ftg>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.prv>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.diz>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.wbk>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.xlk>>%userprofile%\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.spc>>%userprofile%\desktop\file_deleted.html
cls
:menu3
color 0f
echo Finished
echo [R]: Rescan [D]: Launch diskpart.exe [E]:exit
set /p z=# Press Enter to confirm: #_
if /i "%z%"=="R" goto :rescan
if /i "%z%"=="D" goto :diskpart
if /i "%z%"=="E" goto :log
echo Invalid key &ping 0 -n "2">nul&cls&goto :menu3
