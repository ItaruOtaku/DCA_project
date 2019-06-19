::This is DCA_Ver2.0 demo version, and there are explainations under every commands.
::In Windows command scripts, explanatory notes start with "::".

:rescan
::Label: Rescan
@echo off
::Turn off command echoing
echo #_Disk_Clean_Application_MS-DOS_Edition_#
::Display text
echo START
::Display text 
pause
::Pause, press any key to continue
set ymd=%date:~0,10%%date:~5,2%%date:~8,2%
::Set time variable: %Date%
set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
::Set time variable: %Time%
set ymd_t=%ymd_t: =0%
::Set time variable: %ymd_t%
echo start at:%ymd_t%>>%userprofile%\desktop\file_deleted.html
::Print "start at" and variable %ymd_t% in an html file on the specified path: C:\Users\username\desktop\file_deleted.html
color 0a
::Set display color(background color: black; display color: light green)
del /f /s /q %windir%\*.bak>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".bak" in C:\windows and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %windir%\prefetch\*.*>>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\windows\prefetch and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %windir%\*.tmp>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".tmp" in C:\windows and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
rd /s /q %windir%\temp & md %windir%\temp>>%userprofile%\desktop\file_deleted.html
::Delete file folder"C:\windows\temp" and recreate it. Print the result in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %userprofile%\cookies\*.*>>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\users\username\cookies and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %userprofile%\recent\*.*>>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\users\username\recent and print deleted files names in an html file on the specified path: C:\user\username\desktop\file_deleted.html
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\users\username\Local Settings\Temporary Files and print delted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q "%userprofile%\Local Settings\Temp\*.*">>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\users\username\Local Settings\Temp and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q "%userprofile%\recent\*.*">>%userprofile%\desktop\file_deleted.html
::Delete all files under C:\users\username\recent and print deleted files names in an html on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q "%userprofile%\desktop\errorlog.txt">>%userprofile%\desktop\file_deleted.html
::Delete file: errorlog.txt on the desktop (if it's there) and print deleted file name in an html file on the specified path: C:\users\username\desktop\file_deleted.html
cls 
::Clean all displayed text on the screen
:menu
::Label: menu
color 0f
::Set display color(background color: black; display color: white)
echo Start advanced mode or XP cleaning mode:
::DIsplay text
echo [A]: Advanced mode [X]: XP cleaning mode [E]: exit
::Display text
set /p x=# Press Enter to confirm #:_
::Set an input variable x and provide an input command
if /i "%x%"=="A" goto :advanced
::If input variable x = "A", execute commands under label: advanced
if /i "%x%"=="E" goto :log
::If input variable x = "E", execute commands under label: log
if /i "%x%"=="X" goto :XP
::If input variable x = "X", execute commands under label: XP
echo Invalid key &ping 0 -n "2">nul&cls&goto menu
::If input variable x is not any of those values above, display message "Invalid key" and clean the displayed messages and go back to label: menu
:advanced
::Label: advanced
color 0b
::Set display color(background color: black; display color: aqua)
echo START ADVANCED MODE
::Display text
echo It may take 5 mins to finish the process.
::Display text
del /f /s /q %systemdrive%\*.tmp>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".tmp" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.log>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".log" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.dmp>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".dmp" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.gid>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".gid" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.old>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".old" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.chk>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".chk" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\recycled\*.*>>%userprofile%\desktop\file_deleted.html
::Delete all files in recycle bin and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.bak>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".bak" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
cls
::Clean all displayed text on the screen
:menu2
::Label menu2
color 0f
::Set display color(background color: black; display color: white)
echo Finished
::Display text
echo [R]: Rescan  [D]: Launch Diskpart.exe [X]: WinXP Cleaning mode [E]: Exit 
::Display text
set /p y=# Press enter to confirm: #_
::Set an input variable y and provide an input command
if /i "%y%"=="R" goto :rescan
::If input variable y = "R", execute commands under label: rescan
if /i "%y%"=="D" goto :diskpart 
::If input variable y = "D", execute commands under label: diskpart
if /i "%y%"=="E" goto :log
::If input variable y = "E", execute commands under label: log
if /i "%y%"=="X" goto :XP
::If input variable y = "X", execute commands under label: XP
echo Invalid key &ping 0 -n "2">nul&cls&goto menu2
::If input variable x is not any of those values above, display message "Invalid key" and clean the displayed messages and go back to label: menu2
:diskpart
::Label: diskpart
echo create vdisk file="c:\win7.vhd"maximum=10240m type=expandable>%temp%\Script
echo select vdisk file=c:\win7.vhd>>%temp%\Script
echo attach vdisk>>%temp%\Script
echo create partition primary>>%temp%\Script
echo assign letter=x>>%temp%\Script
echo format quick label="win7boot">>%temp%\Script
diskpart<%temp%\Script
::Launch diskpart.exe
:log
::Label: log
set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
::Set time variable: %time%
set ymd_t=%ymd_t: =0%
::Set time variable: %ymd_t%
echo Successfully scanned. %ymd_t%>>%userprofile%\desktop\file_deleted.html
::Print "Successfully scanned" and variable %ymd_t% in an html file on the specified path: C:\Users\username\desktop\file_deleted.html
rename %userprofile%\desktop\file_deleted.html file_deleted.log
::Rename file: C:\Users\username\desktop\file_deleted.html to C:\Users\username\desktop\file_deleted.log
start %userprofile%\desktop\file_deleted.log
::Open file: C:\Users\username\desktop\file_deleted.log
echo & pause
::Turn off command echoing and pause, press any key to continue
rename %userprofile%\desktop\file_deleted.log file_deleted.html
::Rename file: C:\Users\username\desktop\file_deleted.log to C:\Users\username\desktop\file_deleted.html
exit
::End the process
:XP
::Label: XP
color 0e
::Set display color(background color: black; display color: light yellow)
echo START XP MODE
::Display text
echo This mode only works in WinXP system. (x86/x64)
::Display text
del /f /s /q %systemdrive%\*.dmp>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".dmp" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.ftg>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".ftg" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.prv>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".prv" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.diz>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".diz" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.wbk>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".wbk" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.xlk>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".xlk" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
del /f /s /q %systemdrive%\*.spc>>%userprofile%\desktop\file_deleted.html
::Delete all files with extended name".spc" and print deleted files names in an html file on the specified path: C:\users\username\desktop\file_deleted.html
cls
::Clean all displayed text on the screen
:menu3
::Label: menu3
color 0f
::Set display color(background color: black; display color: white)
echo Finished
::Display text
echo [R]: Rescan [D]: Launch diskpart.exe [E]:exit
::Display text
set /p z=# Press Enter to confirm: #_
::Set an input variable z and provide an input command
if /i "%z%"=="R" goto :rescan
::If input variable z = "R", execute commands under label: rescan
if /i "%z%"=="D" goto :diskpart
::If input variable z = "D", execute commands under label: diskpart
if /i "%z%"=="E" goto :log
::If input variable z = "E", execute commands under label: log
echo Invalid key &ping 0 -n "2">nul&cls&goto :menu3
::If input variable x is not any of those values above, display message "Invalid key" and clean the displayed messages and go back to label: menu3

::DCA_Ver2.0_demo finish
