@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Disable autorun on removable drives
set USAGE=

call :Disable_Autorun_Drives
goto Finish


:Disable_Autorun_Drives
reg.exe>nul 2>nul add    "HKLM\SYSTEM\CurrentControlSet\Services\Cdrom"                                                  /V "AutoRun"            /T REG_DWORD /D "0"    /F || goto Disable_Autorun_Drives_Fail
reg.exe>nul 2>nul add    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"                              /V "NoDriveTypeAutoRun" /T REG_DWORD /D "0xDD" /F || goto Disable_Autorun_Drives_Fail
reg.exe>nul 2>nul add    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\CancelAutoplay\Files" /V "*.*"                /T REG_SZ    /D ""     /F || goto Disable_Autorun_Drives_Fail
reg.exe>nul 2>nul delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\Autorun.inf"                                                                 /F

call EchoSucc Disable autorun on removable drives
exit /B 0
:Disable_Autorun_Drives_Fail
call EchoFail Disable autorun on removable drives
if /I "%DEBUG%"=="YES" (
  reg.exe add    "HKLM\SYSTEM\CurrentControlSet\Services\Cdrom"                                                  /V "AutoRun"            /T REG_DWORD /D "0"    /F
  reg.exe add    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"                              /V "NoDriveTypeAutoRun" /T REG_DWORD /D "0xDD" /F
  reg.exe add    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\CancelAutoplay\Files" /V "*.*"                /T REG_SZ    /D ""     /F
  reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\Autorun.inf"                                                                 /F
)
exit /B 1

:: Services\Cdrom - ������ �⪫�祭�� ��类� �����প� ��⮧���᪠
:: �������-��᪮� (���� ��筮��).

:: � ������� NoDriveAutoRun ����頥��� ����㧪� � ��।������� �ਢ���� �� ��
:: �㪢������ ������祭��, � NoDriveTypeAutoRun ����頥� ����㧪� �
:: ��।������� �ਢ���� �� �� ⨯�. ��᪮��� ��� ���࠭ ����� �� �㦥�,
:: �ᯮ��㥬 ��஥.
:: ���祭�� ��ࠬ��� "NoDriveTypeAutoRun":
::   0xFF - �⪫���� ��� ��� ��᪮�.
::   0xDD - �⪫���� ��� ��� ��᪮�, �஬� CD/DVD.

:: � CancelAutoplay\Files ��室���� ⥪�⮢� ��ࠬ����, ᮤ�ঠ騥 �����
:: 䠩���, ���᪠� ����� �� ���⥫� ���஥��� AutoRun ����᪠���� �� �⠭��
:: � �������� �������� ���⥫� �१ autorun.inf. ������塞 ��ப���
:: ��ࠬ��� ᫥���饣� ᮤ�ঠ���: *.* (�� 䠩��).

:: !!! �������� !!! ���ᮡ, ४�����㥬� ���୥⮬ ��� �⪫�祭�� ��⮧���᪠
:: (㪠��� ����), �ਢ���� � �஡����� � ��⠭����� �������⥫쭮�� �� �
:: ᪠���� HP ScanJet 300.
::
:: http://ru.wikipedia.org/wiki/Autorun.inf
:: ����ୠ⨢��, ����� ࠤ������, ᯮᮡ ����� ��ࠡ�⪨ autorun.inf:
::
:: reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\Autorun.inf" /VE /T REG_SZ /D "@SYS:DoesNotExist" /F
::
:: �� ��� �� �������� ᮤ�ন��� 䠩�� autorun.inf ���祭��� �� ॥���,
:: ���஥ ���筮 �������� �����/������. �� �ਢ���� � ⮬�, �� �᫨ ��
:: ��᪥ � ���� 䠩� autorun.inf, � �� ���ਭ������� ��� ���⮩.
:: �������� ᯮᮡ ᫥��� ����� ᠬ� �����.
::
:: @SYS:DoesNotExist ������ Explorer'�, �⮡� �� �� �⠫ ��ࠬ���� ����᪠ ��
:: 䠩�� Autorun.inf, � �⠫ �� �� ��⪨ ॥��� HKLM\SOFTWARE\DoesNotExist,
:: ����� �� �������. � �⮣� �᫨ ���譨� ���⥫� ᮤ�ন� 䠩�
:: Autorun.inf - � �� ������祭�� ���⥫� � ���������, Autorun.inf ��
:: ����᪠����. ����� ⮣� - �� ����᪠���� �� � �� ������� ����� �� �㪢�
:: ��᪠ �⮣� ���⥫� � �஢������.

:Finish
