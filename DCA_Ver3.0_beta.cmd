@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if '%errorlevel%' NEQ '0' (
        goto UACPrompt
    ) else ( 
        goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /p
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
CD /D "%~dp0"
@echo off
echo #_Disk_Clean_Application_MS-DOS_Edition_#
echo Admin mode START 
if exist %systemdrive%\dca_runlog (
    goto :setup
) else (
    md %systemdrive%\DCA_runlog
)
:setup
    set ymd=%date:~0,10%%date:~5,2%%date:~8,2%
    set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
    set ymd_t=%ymd_t: =0%
echo start at:%ymd_t%>>%systemdrive%\dca_runlog\deleted_files.history
color 0a
    del /f /s /q %windir%\*.bak>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %windir%\prefetch\*.*>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %windir%\*.tmp>>%systemdrive%\dca_runlog\deleted_files.history
    rd /s /q %windir%\temp & md %windir%\temp>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %userprofile%\cookies\*.*>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %userprofile%\recent\*.*>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*">>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q "%userprofile%\Local Settings\Temp\*.*">>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q "%userprofile%\recent\*.*">>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q "%userprofile%\desktop\errorlog.txt">>%systemdrive%\dca_runlog\deleted_files.history
cls
:menu
color 0f
echo Options:
echo [A]: Advanced mode [X]: XP cleaning mode [D]: Launch Diskpart.exe [E]: exit
    set /p x=# Press Enter to confirm #:_
        if /i "%x%"=="A" goto :advanced
        if /i "%x%"=="E" goto :log
        if /i "%x%"=="X" goto :XP
        if /i "%x%"=="D" goto :diskpart
echo Invalid key &ping 0 -n "2">nul&cls&goto menu
:advanced
color 0b
echo START ADVANCED MODE
echo It may take 5 mins to finish the process.
    del /f /s /q %systemdrive%\*.tmp>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.log>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.dmp>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.gid>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.old>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.chk>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\recycled\*.*>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.bak>>%systemdrive%\dca_runlog\deleted_files.history
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
    start diskpart.exe
:log
    set ymd_t=%ymd%_%time:~0,2%%time:~3,2%%time:~6,2%
    set ymd_t=%ymd_t: =0%
echo Successfully scanned. %ymd_t%>>%systemdrive%\dca_runlog\deleted_files.history
rename %systemdrive%\dca_runlog\deleted_files.history deleted_files.log
start %systemdrive%\dca_runlog\deleted_files.log
rename %systemdrive%\dca_runlog\deleted_files.log deleted_files.history
exit
:XP
color 0e
echo START XP MODE
echo This mode only works in WinXP system. (x86/x64)
    del /f /s /q %systemdrive%\*.dmp>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.ftg>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.prv>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.diz>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.wbk>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.xlk>>%systemdrive%\dca_runlog\deleted_files.history
    del /f /s /q %systemdrive%\*.spc>>%systemdrive%\dca_runlog\deleted_files.history
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
