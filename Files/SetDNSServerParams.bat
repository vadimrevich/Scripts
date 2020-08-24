@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set DNS-server parameters
set USAGE=

call :Set_DNSServer_Params
goto Finish


:Set_DNSServer_Params
dnscmd.exe 2>&1 . /Config /DefaultAgingState          1|%SystemRoot%\System32\find.exe>nul 2>nul /I "������� �ᯥ譮" || goto Set_DNSServer_Params_Fail
dnscmd.exe 2>&1 . /Config /ScavengingInterval       168|%SystemRoot%\System32\find.exe>nul 2>nul /I "������� �ᯥ譮" || goto Set_DNSServer_Params_Fail
dnscmd.exe 2>&1 . /Config /DefaultNoRefreshInterval 168|%SystemRoot%\System32\find.exe>nul 2>nul /I "������� �ᯥ譮" || goto Set_DNSServer_Params_Fail
dnscmd.exe 2>&1 . /Config /DefaultRefreshInterval   168|%SystemRoot%\System32\find.exe>nul 2>nul /I "������� �ᯥ譮" || goto Set_DNSServer_Params_Fail
call EchoSucc Set DNS-server parameters
exit /B 0
:Set_DNSServer_Params_Fail
call EchoFail Set DNS-server parameters
if /I "%DEBUG%"=="YES" (
  dnscmd.exe . /Config /DefaultAgingState          1
  dnscmd.exe . /Config /ScavengingInterval       168
  dnscmd.exe . /Config /DefaultNoRefreshInterval 168
  dnscmd.exe . /Config /DefaultRefreshInterval   168
)
exit /B 1

:: dnscmd <ServerName> /Config {/ScavengingInterval <Value>
::                             |/DefaultAgingState <Value>
::                             |/DefaultNoRefreshInterval <Value>
::                             |/DefaultRefreshInterval <Value>}
:: <ServerName>              - IP/��� DNS-�ࢥ� ("." - ⥪�騩 �ࢥ�).
:: /Config                   - ����ன�� �ࢥ�.
:: /DefaultAgingState        - ����ன�� ���⪨ �� 㬮�砭�� ��� ��� ���
::                             (0 - �⪫����, 1 - �������).
:: /ScavengingInterval       - ����� ���⪨ ��� ��� (� ���).
::                             �� 㬮�砭�� - 168 (���� ������).
:: /DefaultNoRefreshInterval - ���ࢠ� �����஢���� �� 㬮�砭�� (� ���).
::                             �� 㬮�砭�� - 168 (���� ������).
:: /DefaultRefreshInterval   - ���ࢠ� ���������� �� 㬮�砭�� (� ���).
::                             �� 㬮�砭�� - 168 (���� ������).

:Finish
