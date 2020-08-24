@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Disable or enable SFC
set USAGE=disable/enable

if /I "%~1"=="DISABLE" (
  call :Disable_SFC
  goto Finish
)
if /I "%~1"=="ENABLE" (
  call :Enable_SFC
  goto Finish
)
exit /B 255


:Disable_SFC
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCQuota"   /T REG_DWORD /D "0" /F
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCScan"    /T REG_DWORD /D "2" /F
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCDisable" /T REG_DWORD /D "2" /F && (
  call EchoSucc Disable SFC
  exit /B 0
)
call EchoFail Disable SFC
if /I "%DEBUG%"=="YES" reg.exe add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCDisable" /T REG_DWORD /D "2" /F
exit /B 1

:Enable_SFC
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCQuota"   /T REG_DWORD /D "0xFFFFFFFF" /F
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCScan"    /T REG_DWORD /D "0" /F
reg.exe>nul 2>nul add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCDisable" /T REG_DWORD /D "0" /F && (
  call EchoSucc Enable  SFC
  exit /B 0
)
call EchoFail Enable  SFC
if /I "%DEBUG%"=="YES" reg.exe add "HLKM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "SFCDisable" /T REG_DWORD /D "0" /F
exit /B 1

:Finish

:: SFC - �㦡� �஢�ન ��⥬��� 䠩���. �� ��⥬�� 䠩�� ��室���� �
:: ������ %SYSTEMROOT% � %SYSTEMROOT%\System32. SFC ��⮬���᪨
:: ����⠭�������� �� �� ����� %SYSTEMROOT%\System32\dllcache, �᫨ ��� �뫨
:: ��砩�� 㤠���� ��� ���०����.
::
:: KEY Name: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
::
:: Entry Name: SFCDisable
:: Data Type: REG_DWORD
:: Value: 0,1,2,3,4
::   0 - SFC ����祭� (�� 㬮�砭��).
::   1 - SFC �⪫�祭�, �� ��訢��� ���짮��⥫� � ����祭�� �� ����㧪� ��.
::   2 - SFC �⪫�祭� ��������� � ���짮��⥫� �� ����� ᭮�� ������� ��.
::   4 - SFC ����祭�, �� �ᯫ뢠�騥 ���� �����������.
::
:: ��ࠬ��� SFCScan ����� ���� ������� ��� �믮������ ᪠��஢���� 䠩���,
:: ���饭��� ��⥬��.
::
:: Entry Name: SFCScan
:: Data Type: REG_DWORD
:: Value: 0,1,2
::   0 - �� �஢����� ���饭�� 䠩�� �� ����㧪� ��⥬� (�� 㬮�砭��).
::   1 - ᪠��஢��� ���饭�� 䠩�� �� ������ ����㧪�.
::   2 - ࠧ��� ᪠��஢��� 䠩��, ���饭�� ��⥬��.
::
:: ��ࠬ��� SFCQuota ������ ࠧ��� ����� %SYSTEMROOT%\System32\dllcache. ��
:: 㬮�砭�� �� ࠧ��� - 400 �� (0xFFFFFFFF). ������ ����� ����� ᮪���� ��
:: ��� � ������� �������: sfc /cachesize=0.
::
:: Entry Name: SFCQuota
:: Data Type: REG_DWORD
:: Value: 0x00000000..0xFFFFFFFF
::
:: http://winitpro.ru/index.php/2010/07/28/windows-sfc-i-klyuchi-reestra/
:: http://citforum.ru/operating_systems/windows/optimXP/
