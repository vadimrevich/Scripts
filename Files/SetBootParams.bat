@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set boot parameters
set USAGE=

call :Set_Boot_Params
goto Finish


:Set_Boot_Params
:: ����� ������⢮ १�ࢭ�� �����, ����� �㤥� �࠭��� ��⥬�.
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager"               /V "BackupCount" /T REG_DWORD /D "2" /F
:: ����砥� �㭪� "����㧪� ��᫥���� 㤠筮� ���䨣��樨" � ��ᯥ��� ����㧪�.
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager\LastKnownGood" /V "Enabled"     /T REG_DWORD /D "1" /F
:: �����頥� ���� ��ᯥ��� ����㧪� � Windows 8, ��뢠��� �� F8 (�������⥫�� ��ਠ��� ����㧪�).
bcdedit.exe>nul 2>nul /SET "{current}" BootMenuPolicy Legacy
:: �몫�砥� ����㧮筮� ���� � Windows (�롮� �� �� ����㧪�).
bcdedit.exe>nul 2>nul /SET "{bootmgr}" DisplayBootMenu No || goto Set_Boot_Params_Fail
call EchoSucc Set boot parameters
exit /B 0
:Set_Boot_Params_Fail
call EchoFail Set boot parameters
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager"               /V "BackupCount" /T REG_DWORD /D "2" /F
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager\LastKnownGood" /V "Enabled"     /T REG_DWORD /D "1" /F
  bcdedit.exe /SET "{current}" BootMenuPolicy Legacy
  bcdedit.exe /SET "{bootmgr}" DisplayBootMenu No
)
exit /B 1

:Finish
