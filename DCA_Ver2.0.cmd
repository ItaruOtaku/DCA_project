::This is DCA_Ver2.0 beta version, a test script of DCA_Ver2.0

:rescan
@echo off
echo #_Disk_Clean_Application_MS-DOS_Edition_#
echo START 
pause
set ymd=%date:~0,10%
set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
set ymd_t=%ymd_t: =0%
echo start at:%ymd_t%>>%ymd%
color 0a
del /f /s /q %sytemdrive%\*.tmp>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*.log>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*._mp>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*.gid>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*.old>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*.chk>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\recycled\*.*>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %sytemdrive%\*.bak>>%userprofile%\desktop\file_deleted.txt
cls
:menu
color 0f
echo Start advanced mode?
echo [Y]: Yes  [N]: No and Exit
set /p x=# Press Enter to confirm #:_
if /i "%x%"=="Y" goto :advanced
if /i "%x%"=="N" goto :log
echo Invalid key &ping 0 -n "2">nul&cls&goto menu
:advanced
color 0b
echo START ADVANCED MODE
echo It may take 5 mins to finish the process.
del /f /s /q %windir%\*.bak>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %windir%\prefetch\*.*>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %windir%\*.tmp>>%userprofile%\desktop\file_deleted.txt
rd /s /q %windir%\temp & md %windir%\temp>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %userprofile%\cookies\*.*>>%userprofile%\desktop\file_deleted.txt
del /f /s /q %userprofile%\recent\*.*>>%userprofile%\desktop\file_deleted.txt
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">>%userprofile%\desktop\file_deleted.txt
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">>%userprofile%\desktop\file_deleted.txt
del /f /s /q "%userprofile%\recent\*.*">>%userprofile%\desktop\file_deleted.txt
cls
:menu2
color 0f
echo Finished
echo [R]: Rescan  [D]: Launch Diskpart.exe [E]: Exit 
set /p y=# Press enter to confirm: #_
if /i "%y%"=="R" goto :rescan
if /i "%y%"=="D" goto :diskpart
if /i "%y%"=="E" goto :log
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
echo Successfully scanned.%ymd_t%>>%ymd% 
echo & pause
exit
