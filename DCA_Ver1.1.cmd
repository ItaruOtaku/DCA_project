@echo off

echo #_Disk_Clean_Application_MS-DOS_Edition_#

echo START 

pause

del /f /s /q %sytemdrive%\*.tmp

del /f /s /q %sytemdrive%\*.log

del /f /s /q %sytemdrive%\*._mp

del /f /s /q %sytemdrive%\*.gid

del /f /s /q %sytemdrive%\*.old

del /f /s /q %sytemdrive%\*.chk

del /f /s /q %sytemdrive%\recycled\*.*

del /f /s /q %sytemdrive%\*.bak

echo press any key to start advanced mode

del /f /s /q %windir%\*.bak

del /f /s /q %windir%\prefetch\*.*

del /f /s /q %windir%\*.tmp

rd /s /q %windir%\temp & md %windir%\temp

del /f /s /q %userprofile%\cookies\*.*

del /f /s /q %userprofile%\recent\*.*

del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"

del /f /s /q "%userprofile%\Local Settings\Temp\*.*"

del /f /s /q "%userprofile%\recent\*.*"

echo Finished

echo & pause

exit

