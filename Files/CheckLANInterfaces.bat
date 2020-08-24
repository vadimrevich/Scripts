@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Check LAN interfaces
set USAGE=

call :Check_LAN_Interfaces
goto Finish


:Check_LAN_Interfaces
if /I "%CHECK_LAN_INTERFACES%"=="YES" goto Succ
if /I "%CHECK_LAN_INTERFACES%"=="NO"  goto Fail
ipconfig.exe 2>&1|%SystemRoot%\System32\find.exe>nul 2>nul /I "������祭�� �� �����쭮� ��" && goto Succ
ipconfig.exe 2>&1|%SystemRoot%\System32\find.exe>nul 2>nul /I "����������� �� ��������� ����" && goto Succ
ipconfig.exe 2>&1|%SystemRoot%\System32\find.exe>nul 2>nul /I "������ Ethernet" && goto Succ
ipconfig.exe 2>&1|%SystemRoot%\System32\find.exe>nul 2>nul /I "������� Ethernet" && goto Succ
:Fail
set CHECK_LAN_INTERFACES=NO
call EchoWarn LAN interfaces not found
if /I "%DEBUG%"=="YES" ipconfig.exe
exit /B 1
:Succ
set CHECK_LAN_INTERFACES=YES
call EchoSucc LAN interfaces found
exit /B 0

:Finish
