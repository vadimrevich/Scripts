@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Show network interfaces
set USAGE=

call :Show_Interfaces
goto Finish


:Show_Interfaces
setlocal EnableDelayedExpansion
echo ID  Metric  Status  Connection  IP/Mask  [GW]
echo --  ------  ------  ----------  -------  ----
for /F "tokens=1-4*" %%a in ('netsh.exe int ip show int^|%SystemRoot%\System32\find.exe /I "connected"^|%SystemRoot%\System32\find.exe /I /V "Loopback"') do (
  set IP=
  for /F "tokens=1-2" %%i in ('netsh.exe int ip show addr "%%a"^|%SystemRoot%\System32\find.exe /I "IP-����"       ') do set IP=%%j
  set MASK=
  for /F "tokens=1-5" %%i in ('netsh.exe int ip show addr "%%a"^|%SystemRoot%\System32\find.exe /I "��䨪� �����"') do set MASK=%%m
  if not "!MASK!"=="" set MASK=!MASK:^)=!
  set GW=
  for /F "tokens=1-3" %%i in ('netsh.exe int ip show addr "%%a"^|%SystemRoot%\System32\find.exe /I "�᭮���� ��"  ') do set GW=%%k
  if not "!IP!"==""   set IP=!IP!/!MASK!
  if not "!GW!"==""   set GW=[!GW!]
  echo %%a  %%b  %%d  "%%e"  !IP!  !GW!
)

echo.
ipconfig.exe /all| ^
findstr.exe /I "�����쭮� ������祭�� ���ᠭ�� �����᪨� IPv4-���� ��᪠ ��"| ^
%SystemRoot%\System32\find.exe /I /V "������ Microsoft"| ^
%SystemRoot%\System32\find.exe /I /V "Tunneling"
exit /B

:Finish
