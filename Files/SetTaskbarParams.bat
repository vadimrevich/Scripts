@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set taskbar parameters
set USAGE=

call :Set_Taskbar_Params
goto Finish


:Set_Taskbar_Params
:: ����⠭�������� ������ ����� (��� Windows XP)
mkdir  >nul 2>nul       "%APPDATA%\Microsoft\Internet Explorer\Quick Launch"
ren    >nul 2>nul       "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\�������� ����ॢ�⥫� Internet Explorer.lnk" "Internet Explorer.lnk"
copy   >nul 2>nul /Y /Z "%ALLUSERSPROFILE%\������� ����\�ணࠬ��\Google Chrome.lnk" "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\"
for /F "tokens=1,2,*" %%i in ('reg.exe 2^>nul query "HKU"') do (
  :: �ᥣ�� �⮡ࠦ��� �� ���窨 � 㢥�������� �� ������ �����
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer"          /V "EnableAutoTray"        /T REG_DWORD /D "0"      /F || goto Set_Taskbar_Params_Fail
  :: �⪫���� ���箪 "����� �����ন" �� ������ 㢥��������
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V "HideSCAHealth"         /T REG_DWORD /D "1"      /F || goto Set_Taskbar_Params_Fail
  :: �⪫���� �।���⥫�� ��ᬮ�� ࠡ�祣� �⮫� (��� Windows 7)
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "DisablePreviewDesktop" /T REG_DWORD /D "1"      /F || goto Set_Taskbar_Params_Fail
  :: �⪫���� �।���⥫�� ��ᬮ�� ���� ��� ������� ����� (��� Windows 7)
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "ExtendedUIHoverTime"   /T REG_DWORD /D "240000" /F || goto Set_Taskbar_Params_Fail
  :: �⪫���� �� �ᯫ뢠�騥 㢥�������� � �॥
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "EnableBalloonTips"     /T REG_DWORD /D "0"      /F || goto Set_Taskbar_Params_Fail
  :: �� ��㯯�஢��� ������ �� ������ ����� (��� Windows XP)
  reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "TaskbarGlomming"       /T REG_DWORD /D "0"      /F || goto Set_Taskbar_Params_Fail
  :: �� ��㯯�஢��� ������ �� ������ ����� (��� Windows 7)
  rem reg.exe>nul 2>nul add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "TaskbarGlomLevel"  /T REG_DWORD /D "2"      /F || goto Set_Taskbar_Params_Fail
)
:: �� ��㯯�஢��� ������ �� ������ ����� (��� Windows 7)
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"   /V "TaskbarGlomLevel"      /T REG_DWORD /D "2"      /F || goto Set_Taskbar_Params_Fail
:: �⪫���� �।�०����� ��⥬� ��⨢���᭮� �����
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "AntiVirusDisableNotify" /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
:: �⪫���� �।�०����� ��⥬� ��⨢���᭮� �����
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "AntiVirusOverride"      /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
:: �⪫���� �।�०����� �࠭������
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "FirewallDisableNotify"  /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
:: �⪫���� �।�०����� �࠭������
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "FirewallOverride"       /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
:: �⪫���� ᮮ�饭�� 業�� ������᭮��
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "FirstRunDisabled"       /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
:: �⪫���� �।�०����� �㦡� ��⮬���᪮�� ����������
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Security Center" /V "UpdatesDisableNotify"   /T REG_DWORD /D "1" /F || goto Set_Taskbar_Params_Fail
call EchoSucc Set taskbar parameters
exit /B 0
:Set_Taskbar_Params_Fail
call EchoFail Set taskbar parameters
if /I "%DEBUG%"=="YES" (
  for /F "tokens=1,2,*" %%i in ('reg.exe 2^>nul query "HKU"') do (
    :: �ᥣ�� �⮡ࠦ��� �� ���窨 � 㢥�������� �� ������ �����
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer"          /V "EnableAutoTray"        /T REG_DWORD /D "0"      /F
    :: �⪫���� ���箪 "����� �����ন" �� ������ 㢥��������
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V "HideSCAHealth"         /T REG_DWORD /D "1"      /F
    :: �⪫���� �।���⥫�� ��ᬮ�� ࠡ�祣� �⮫� (��� Windows 7)
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "DisablePreviewDesktop" /T REG_DWORD /D "1"      /F
    :: �⪫���� �।���⥫�� ��ᬮ�� ���� ��� ������� ����� (��� Windows 7)
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "ExtendedUIHoverTime"   /T REG_DWORD /D "240000" /F
    :: �⪫���� �� �ᯫ뢠�騥 㢥�������� � �॥
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "EnableBalloonTips"     /T REG_DWORD /D "0"      /F
    :: �� ��㯯�஢��� ������ �� ������ ����� (��� Windows XP)
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "TaskbarGlomming"       /T REG_DWORD /D "0"      /F
    :: �� ��㯯�஢��� ������ �� ������ ����� (��� Windows 7)
    reg.exe add "%%~i\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V "TaskbarGlomLevel"      /T REG_DWORD /D "2"      /F
  )
  :: �⪫���� �।�०����� ��⥬� ��⨢���᭮� �����
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "AntiVirusDisableNotify" /T REG_DWORD /D "1" /F
  :: �⪫���� �।�०����� ��⥬� ��⨢���᭮� �����
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "AntiVirusOverride"      /T REG_DWORD /D "1" /F
  :: �⪫���� �।�०����� �࠭������
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "FirewallDisableNotify"  /T REG_DWORD /D "1" /F
  :: �⪫���� �।�०����� �࠭������
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "FirewallOverride"       /T REG_DWORD /D "1" /F
  :: �⪫���� ᮮ�饭�� 業�� ������᭮��
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "FirstRunDisabled"       /T REG_DWORD /D "1" /F
  :: �⪫���� �।�०����� �㦡� ��⮬���᪮�� ����������
  reg.exe add "HKLM\Software\Microsoft\Security Center" /V "UpdatesDisableNotify"   /T REG_DWORD /D "1" /F
)
exit /B 1

:Finish
