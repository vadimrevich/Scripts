@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set software restriction policy
set USAGE=unrestricted/basicuser/disallowed/disable/log/nolog

if /I "%~1"=="UNRESTRICTED" (
  call :SRP_Unrestricted
  goto Finish
)
if /I "%~1"=="BASICUSER" (
  call :SRP_BasicUser
  goto Finish
)
if /I "%~1"=="DISALLOWED" (
  call :SRP_Disallowed
  goto Finish
)
if /I "%~1"=="DISABLE" (
  call :SRP_Disable
  goto Finish
)
if /I "%~1"=="LOG" (
  call :SRP_Log
  goto Finish
)
if /I "%~1"=="NOLOG" (
  call :SRP_NoLog
  goto Finish
)
exit /B 255


:SRP_Unrestricted
:: �������� ������� �������� � Unrestricted (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00040000" /F || goto SRP_Unrestricted_Fail
:: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F || goto SRP_Unrestricted_Fail
:: �������� ������� �������� � Unrestricted (��� Windows XP /Windows Server 2003)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F || goto SRP_Unrestricted_Fail
call EchoSucc Set software restriction policy to "Unrestricted"
exit /B 0
:SRP_Unrestricted_Fail
call EchoFail Set software restriction policy to "Unrestricted"
if /I "%DEBUG%"=="YES" (
  :: �������� ������� �������� � Unrestricted (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00040000" /F
  :: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F
  :: �������� ������� �������� � Unrestricted (��� Windows XP /Windows Server 2003)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F
)
exit /B 1

:SRP_BasicUser
:: �������� ������� �������� � Basic User (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00020000" /F || goto SRP_BasicUser_Fail
:: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F || goto SRP_BasicUser_Fail
:: �������� ������� �������� � Basic User (��� Windows XP /Windows Server 2003)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F || goto SRP_BasicUser_Fail
call EchoSucc Set software restriction policy to "Basic User"
exit /B 0
:SRP_BasicUser_Fail
call EchoFail Set software restriction policy to "Basic User"
if /I "%DEBUG%"=="YES" (
  :: �������� ������� �������� � Basic User (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00020000" /F
  :: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F
  :: �������� ������� �������� � Basic User (��� Windows XP /Windows Server 2003)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F
)
exit /B 1

:SRP_Disallowed
:: �������� ������� �������� � Disallowed (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00000000" /F || goto SRP_Disallowed_Fail
:: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F || goto SRP_Disallowed_Fail
:: �������� ������� �������� � Disallowed (��� Windows XP /Windows Server 2003)
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F || goto SRP_Disallowed_Fail
call EchoSucc Set software restriction policy to "Disallowed"
exit /B 0
:SRP_Disallowed_Fail
call EchoFail Set software restriction policy to "Disallowed"
if /I "%DEBUG%"=="YES" (
  :: �������� ������� �������� � Disallowed (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00000000" /F
  :: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F
  :: �������� ������� �������� � Disallowed (��� Windows XP /Windows Server 2003)
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F
)
exit /B 1

:SRP_Disable
:: ��������� SRP
reg.exe>nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers"                                                       /F || goto SRP_Disable_Fail
reg.exe>nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Disallowed\Certificates"                                          /F || goto SRP_Disable_Fail
reg.exe>nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates"                                    /F || goto SRP_Disable_Fail
:: �������� ������� �������� � Unrestricted (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00040000" /F || goto SRP_Disable_Fail
:: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
reg.exe>nul 2>nul add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F || goto SRP_Disable_Fail
:: �������� ������� �������� � Unrestricted (��� Windows XP /Windows Server 2003)
reg.exe>nul 2>nul add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F || goto SRP_Disable_Fail
call EchoSucc Set software restriction policy to "Disable"
exit /B 0
:SRP_Disable_Fail
call EchoFail Set software restriction policy to "Disable"
if /I "%DEBUG%"=="YES" (
  :: ��������� SRP
  reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers"                    /F
  reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Disallowed\Certificates"       /F
  reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /F
  :: �������� ������� �������� � Unrestricted (��� Windows Vista/Windows Server 2008)
  reg.exe add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "DefaultLevel"        /T REG_DWORD /D "0x00040000" /F
  :: ������� ��������������� ��-��� �������� �������� (��� Windows Vista/Windows Server 2008)
  reg.exe add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "PolicyScope"         /T REG_DWORD /D "0x00000001" /F
  :: �������� ������� �������� � Unrestricted (��� Windows XP /Windows Server 2003)
  reg.exe add    "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "AuthenticodeEnabled" /T REG_DWORD /D "0x00000001" /F
)
exit /B 1

:SRP_Log
:: �������� ������ � ��� SRP-�������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "LogFileName" /T REG_SZ /D "C:\\srp.log" /F || goto SRP_Log_Fail
call EchoSucc Enable software restriction policy log to "C:\srp.log"
exit /B 0
:SRP_Log_Fail
call EchoFail Enable software restriction policy log to "C:\srp.log"
if /I "%DEBUG%"=="YES" (
  :: �������� ������ � ��� SRP-�������
  reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "LogFileName" /T REG_SZ /D "C:\\srp.log" /F
)
exit /B 1

:SRP_NoLog
:: ��������� ������ � ��� SRP-�������
reg.exe>nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "LogFileName" /F || goto SRP_NoLog_Fail
call EchoSucc Disable software restriction policy log
exit /B 0
:SRP_NoLog_Fail
call EchoFail Disable software restriction policy log
if /I "%DEBUG%"=="YES" (
  :: ��������� ������ � ��� SRP-�������
  reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /V "LogFileName" /F
)
exit /B 1

:Finish

:: ���������� ��������� ������� ������ SRP:
:: - Disallowed: ����� ������� ������. �� ���������, �������� ������ �����
:: ��������, ����� ��������� � �������� ��������;
:: - Basic User: ����� ��������������� ����������� ����������. ��� ���������
:: ����������� � ������������ �������� ������������, ����� ����������,
:: ��������� ���������;
:: - Unrestricted: ����� �������� ������. �� ���������, ����������� ���������
:: ����� ���������, ����� �������� ��������������� � �������� ��������.
