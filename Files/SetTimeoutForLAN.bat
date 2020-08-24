@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set timeout for LAN connections
set USAGE=minuts

call :Set_Timeout_For_LAN "%~1"
goto Finish


:Set_Timeout_For_LAN
if "%~1"=="" exit /B 255
net.exe 2>&1 config server /Y /AUTODISCONNECT:%~1|%SystemRoot%\System32\find.exe>nul 2>nul /I "�ᯥ譮" && (
  call EchoSucc Set timeout for LAN connections: "%~1" min
  exit /B 0
)
call EchoFail Set timeout for LAN connections: "%~1" min
if /I "%DEBUG%"=="YES" net.exe config server /Y /AUTODISCONNECT:%~1
exit /B 1

:: ������� �६��� �� ��⮬���᪮�� �⪫�祭�� ᮥ������� �ࢥ୮� �㦡�:
:: net config server /autodisconnect:N
:: ��� N - ������⢮ ����� (����. 65535), ᮮ⢥�����饥 ���ࢠ�� ��������,
:: �� ���祭�� ���ண� �㤥� ��ࢠ�� ᮥ������� � ������祭�� �⥢�
:: ��᪮�. �� N=0 �ࢥୠ� �㦡� ���뢠�� ᮥ������� � ������祭�묨
:: �⥢묨 ��᪠�� ��᫥ ��᪮�쪨� ᥪ㭤 �������⢨�. �� N=-1
:: ��⮬���᪮� �⪫�祭�� �⬥�����. �� 㬮�砭�� N=15.

:Finish
