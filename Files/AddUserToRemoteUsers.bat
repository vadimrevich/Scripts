@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Add user to group Remote Access Users 
set USAGE=[host\]user

call :Add_User_To_DCOMUsers "%~1"
goto Finish


:Add_User_To_DCOMUsers
if "%~1"=="" exit /B 255
net.exe 2>&1 localgroup "Remote Desktop Users" /ADD %~1|findstr.exe>nul 2>nul /I "�ᯥ譮 㦥" && goto Add_User_To_DCOMUsers_Succ
net.exe 2>&1 localgroup "���짮��⥫� 㤠������� ࠡ�祣� �⮫�" /ADD %~1|findstr.exe>nul 2>nul /I "�ᯥ譮 㦥" && goto Add_User_To_DCOMUsers_Succ
call EchoFail Add user "%~1" to group "Remote Desktop Users"
exit /B 1
:Add_User_To_DCOMUsers_Succ
call EchoSucc Add user "%~1" to group "Remote Desktop Users"
exit /B 0

:Finish
