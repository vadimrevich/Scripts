@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set user access control policy
set USAGE=disable/enable/default

if /I "%~1"=="DISABLE" (
  call :Disable_UAC
  goto Finish
)
if /I "%~1"=="ENABLE" (
  call :Enable_UAC
  goto Finish
)
if /I "%~1"=="DEFAULT" (
  call :Default_UAC
  goto Finish
)
exit /B 255


:Disable_UAC
:: ��� �������������� �������� � ������ ��������� ���������������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ����������� ��������� ���������� � ������ �� ��������� ����: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ������������ � ����������� �������� ����� ��� ���������� ������� �� ��������� ����: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ��������������� � ������ ��������� ���������������: ��������� ��� �������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ������� �������������: ������ ������� ������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F || goto Disable_UAC_Fail
:: �������� ����� ��� UIAccess-���������� ������ ��� ��������� � ���������� ������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ��������� ���� ������ ��� ����������� � ����������� ����������� ������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ��� ����� ������ � ���� ��� ������ ������������� � ����� ���������� ������������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F || goto Disable_UAC_Fail
:: ��������� UIAccess-����������� ����������� ��������� ����, �� ��������� ���������� ������� ����: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "1" /F || goto Disable_UAC_Fail
:: ����� ��������� ��������������� ��� ���������� ������� ������ ��������������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F || goto Disable_UAC_Fail
:: ��������� ������ ������ ���. ��������������� ���������������� ����������� � �������� ����������� � ������� �������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "1" /F || goto Disable_UAC_Fail
call EchoSucc Set user access control policy to "Disable"
exit /B 0
:Disable_UAC_Fail
call EchoFail Set user access control policy to "Disable"
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "1" /F
)
exit /B 1

:Enable_UAC
:: ��� �������������� �������� � ������ ��������� ���������������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
:: ����������� ��������� ���������� � ������ �� ��������� ����: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
:: ������������ � ����������� �������� ����� ��� ���������� ������� �� ��������� ����: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "0" /F || goto Enable_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ��������������� � ������ ��������� ���������������: ��������� ��� �������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "0" /F || goto Enable_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ������� �������������: ������ ������� ������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F || goto Enable_UAC_Fail
:: �������� ����� ��� UIAccess-���������� ������ ��� ��������� � ���������� ������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
:: ��������� ���� ������ ��� ����������� � ����������� ����������� ������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F || goto Enable_UAC_Fail
:: ��� ����� ������ � ���� ��� ������ ������������� � ����� ���������� ������������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
:: ��������� UIAccess-����������� ����������� ��������� ����, �� ��������� ���������� ������� ����: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
:: ����� ��������� ��������������� ��� ���������� ������� ������ ��������������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F || goto Enable_UAC_Fail
:: ��������� ������ ������ ���. ��������������� ���������������� ����������� � �������� ����������� � ������� �������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "1" /F || goto Enable_UAC_Fail
call EchoSucc Set user access control policy to "Enable"
exit /B 0
:Enable_UAC_Fail
call EchoFail Setuser access control policy to "Enable"
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "1" /F
)
exit /B 1

:Default_UAC
:: ��� �������������� �������� � ������ ��������� ���������������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "1" /F || goto Default_UAC_Fail
:: ����������� ��������� ���������� � ������ �� ��������� ����: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "1" /F || goto Default_UAC_Fail
:: ������������ � ����������� �������� ����� ��� ���������� ������� �� ��������� ����: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "1" /F || goto Default_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ��������������� � ������ ��������� ���������������: ������ �������� ��� �������� ������ �� �� Windows
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "5" /F || goto Default_UAC_Fail
:: ��������� ������� �� ��������� ���� ��� ������� �������������: ������ ������� ������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F || goto Default_UAC_Fail
:: �������� ����� ��� UIAccess-���������� ������ ��� ��������� � ���������� ������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "1" /F || goto Default_UAC_Fail
:: ��������� ���� ������ ��� ����������� � ����������� ����������� ������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F || goto Default_UAC_Fail
:: ��� ����� ������ � ���� ��� ������ ������������� � ����� ���������� ������������: ��������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F || goto Default_UAC_Fail
:: ��������� UIAccess-����������� ����������� ��������� ����, �� ��������� ���������� ������� ����: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "0" /F || goto Default_UAC_Fail
:: ����� ��������� ��������������� ��� ���������� ������� ������ ��������������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F || goto Default_UAC_Fail
:: ��������� ������ ������ ���. ��������������� ���������������� ����������� � �������� ����������� � ������� �������: ���������
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "0" /F || goto Default_UAC_Fail
call EchoSucc Set user access control policy to "Default"
exit /B 0
:Default_UAC_Fail
call EchoFail Set user access control policy to "Default"
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableLUA"                     /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableInstallerDetection"      /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "PromptOnSecureDesktop"         /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorAdmin"    /T REG_DWORD /D "5" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ConsentPromptBehaviorUser"     /T REG_DWORD /D "3" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableSecureUIAPaths"          /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "ValidateAdminCodeSignatures"   /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableVirtualization"          /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "EnableUIADesktopToggle"        /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "FilterAdministratorToken"      /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V "LocalAccountTokenFilterPolicy" /T REG_DWORD /D "0" /F
)
exit /B 1

:: ��������� ��������� ������� �������� ������� �������
:: ----------------------------------------------------
:: http://dimanb.wordpress.com/2010/02/16/���������-���������-�������-�������/
::
:: RegKey RegValue:Disable/Enable/Default PolicyName
:: ------ ------------------------------- -----------------------------------------------------------------------------------------------
:: EnableLUA                     0/1/1    ��� �������������� �������� � ������ ��������� ��������������� (UAC for users)
:: EnableInstallerDetection      0/1/1    ����������� ��������� ���������� � ������ �� ��������� ����
:: PromptOnSecureDesktop         0/0/1    ������������ � ����������� �������� ����� ��� ���������� ������� �� ��������� ����
:: ConsentPromptBehaviorAdmin    0/0/5    ��������� ������� �� ��������� ���� ��� ��������������� � ������ ��������� ���������������
:: ConsentPromptBehaviorUser     3/3/3    ��������� ������� �� ��������� ���� ��� ������� �������������
:: EnableSecureUIAPaths          0/1/1    �������� ����� ��� UIAccess-���������� ������ ��� ��������� � ���������� ������
:: ValidateAdminCodeSignatures   0/0/0    ��������� ���� ������ ��� ����������� � ����������� ����������� ������
:: EnableVirtualization          1/1/1    ��� ����� ������ � ���� ��� ������ ������������� � ����� ���������� ������������
:: EnableUIADesktopToggle        1/1/0    ��������� UIAccess-����������� ����������� ��������� ����, �� ��������� ���������� ������� ����
:: FilterAdministratorToken      0/0/0    ����� ��������� ��������������� ��� ���������� ������� ������ �������������� (UAC for admin)
:: LocalAccountTokenFilterPolicy 1/1/0    ��������� ������ ������ ���. ��������������� ���������������� ����������� � �������� ����������� � ������� �������
::
:: � ���� ������ �������������� ��� ���� ��������� ���������� �������� �������
:: ������� �������������. ����������� ��� ������ ���������� ��������
:: ������������, ������� �������� �� ��� ��������� ��������, ��������� � UAC.
:: ����� ��������� �������� ������� ������� ��� ������ ��������� ��������,
:: ����� ����������� ������������� �� ����� �������.
::
:: ----------------------------------------------------------------------------
:: ��� �������������� �������� � ������ ��������� ���������������
:: ----------------------------------------------------------------------------
:: ���� �������� �������� ���������� �������������� ���� ������� ��������
:: ������� ������� ��� ����������. �� ������� ��������� �������, ����� ��
:: ������� ������ ��������������� ����������� � "������ ���������
:: ���������������", �� ���� ����� �� ������������ ������� � �������� ��
:: ��������� ����������. ���������� ���� ���������, ����� ������, ���������
:: ��������� ���������� �������� �������� �������� �������������. ��� ���������
:: ����� ��������� �������� ���������� ������������� ���������. �������� ��
:: ��������� � ��������.
::
:: ��������� �������� ���������:
::
:: - ���������. ����� ��������� ��������������� � ��� ��������������� ���������
:: �������� �������� ������� ������� ����� ���������.
:: "EnableLUA"="0"
::
:: - ��������. ����� ��������� ��������������� ������� ��� ����, �����
:: ��������� ���������� ������� ������ �������������� � ���� ���������
:: �������������, ���������� ������� ������ "��������������", �������� � ������
:: ��������� ���������������.
:: "EnableLUA"="1"
::
:: ----------------------------------------------------------------------------
:: ����������� ��������� ���������� � ������ �� ��������� ����
:: ----------------------------------------------------------------------------
:: ��� ��������� ���������� �������������� ����������� ��������� ����������
:: ��� ����������, �������� ��������� �� ���������, ����������� ���
:: ������������ ���������� ��� ���. �� ���������, ���� ������������ ������ �
:: ������� ������, ��� ��������.
::
:: ��������� �������� ���������:
::
:: - ��������� (�� ��������� ��� �����������). ��� ������ ���� ���������,
:: ����������� ��������� ��������� ���������� �� ������ ������ �� ���������
:: ����������. ������ ��� ��������� ����������� � ������������, ���������� �
:: ������������ ������� ������ � ������ ������ � ��� ������������� ����������
:: ������������ ���������� �������������� ��������� (Group Policy Software
:: Install � GPSI). ��������������, ������������� � ����������� �����������
:: ��������.
:: "EnableInstallerDetection"="0"
::
:: - �������� (�� ��������� ��� ����). � ��� ������, ���� ��������� ���������
:: ���������� ������������ ������������� ��������� ����������, ������������
:: ������������ ������ ��� ������������ � ������ ������� ������ ��������������.
:: ���� ������������ ������ ���������� ������� ������, �������� ������������ �
:: ���������������� �������. ��� ������� ������� �� ����, � ����� ������
:: ����������� ������������.
:: "EnableInstallerDetection"="1"
::
:: ----------------------------------------------------------------------------
:: ������������ � ����������� �������� ����� ��� ���������� ������� ��
:: ��������� ����
:: ----------------------------------------------------------------------------
:: ������ �������� �������� ����������, ����� �� ������� �� ���������
:: ���������� ��������� �� ������������� ������� ���� ������������ ��� ��
:: ���������� ������� ���� ��� ������������� UAC-�������. �������� �� ���������
:: � ��������. ��� ��������� ����� ��������� �������� ���������� �������������
:: ���������.
::
:: ��������� �������� ���������:
::
:: - ���������. ��� ������� �� ��������� ���� ��������� �� �������������
:: ������� ���� ������������.
:: "PromptOnSecureDesktop"="0"
::
:: - ��������. ��� ������� �� ��������� ���� ��������� �� ���������� �������
:: ���� ���������� �� ���������� �������� ��������� ����������� ���
:: ��������������� � ������� �������������.
:: "PromptOnSecureDesktop"="1"
::
:: ----------------------------------------------------------------------------
:: ��������� ������� �� ��������� ���� ��� ��������������� � ������ ���������
:: ���������������
:: ----------------------------------------------------------------------------
:: ������� ��������� ��������� ���������� �������� ������������, ������� ������
:: � ������ "��������������" ��� ���������� ��������, ��������� ��������� ����.
:: �������� �� ��������� ����������� "������ �������� ��� ��������� ��������
:: ������ (�� Windows)".
::
:: ��������� �������� ���������:
::
:: - ��������� ��� �������. ��������� ����������������� ������� �������
:: ��������� ��������, ��������� ��������� ����, ��� ������������� �������� ���
:: ����� ������� ������. ���������� ������������ ������ ����� ������ � ������ �
:: ������������� ������������� �������������. ��� ������ ���� ���������,
:: ���������������� ���������� ������ ����������� ���������� ������� ������
:: ��������������.
:: "ConsentPromptBehaviorAdmin"="0"
::
:: - ������ ������� ������ �� ���������� ������� �����. ��� ����� ��������,
:: ��������� ��������� ����, �� ���������� ������� ����� ����� ����������
:: ����������� ������ ��� � ������ ������������������ ������������. ����
:: �������� ���������� ������� ������, �������� ����� ���������� �
:: ������������� ���������� ������� ������������.
:: "ConsentPromptBehaviorAdmin"="1"
::
:: - ������ �������� �� ���������� ������� �����. ��� ����� ��������, ���������
:: ��������� ����, �� ���������� ������� ����� ����� ���������� �����������
:: �������: "���������" ��� "���������". ��� ������ ����� "���������", ��������
:: ����� ���������� � ������������� ���������� ������� ������������.
:: "ConsentPromptBehaviorAdmin"="2"
::
:: - ������ ������� ������. ��� ����� ��������, ������� ������� ���������
:: ����������, ����� ���������� ����������� ������ ��� ������������ � ������
:: ������� ������ ��������������. ��� ����� ���������� ������� ������, ��������
:: ����� ���������� � ����������� ������������.
:: "ConsentPromptBehaviorAdmin"="3"
::
:: - ������ ��������. ��� ������ ���� �����, ��� ����� ��������, ���������
:: ��������� ����, ������������ ����� ������������ ������� ������ �� ������:
:: "���������" ��� "���������". ��� ������� �� ������ "���������", ��������
:: ����� ���������� � ������������� ���������� ������������ ������������.
:: "ConsentPromptBehaviorAdmin"="4"
::
:: - ������ �������� ��� �������� ������ �� �� Windows. ��� ������ ���� �����,
:: �� ���������� ������� ����� ����� ���������� ����������� ������: "���������"
:: ��� "���������", � ��� ������, ����� �������� ��� ���������� ���������� (��
:: ����������) ������������� ������� ��������� ����. �� ������� �� ������
:: "���������", �������� ����� ���������� � ������������� ����������
:: ������������ ������������.
:: "ConsentPromptBehaviorAdmin"="5"
::
:: ----------------------------------------------------------------------------
:: ��������� ������� �� ��������� ���� ��� ������� �������������
:: ----------------------------------------------------------------------------
:: ������ �������� �������� ���������� ����������� �������� ��� ��������������
:: �������� ������������ � ������������, ���������� ��������� ����. �������� ��
:: ��������� � "������ ������� ������ �� ���������� ������� �����".
::
:: ��������� �������� ���������:
::
:: - ������������� ��������� ������� �� ��������� ����. ��� ������ �����
:: ���������, ��� �������� ������������ ����� �������� ��������� �� ������ �
:: ����� � �������� �� ������ � ������ ���������� ��������, ��������� ���������
:: ����������. �����������, ���������� ���������� ������� ������������ ��������
:: ��������������, ����� ������� ���� �������� �������� ��� ���������� �����
:: ��������� � ������ ���������.
:: "ConsentPromptBehaviorUser"="0"
::
:: - ������ ������� ������ �� ���������� ������� �����. ������ ������ ��������,
:: �������� ������������ ������������ ������� ������� ������ �������������� �
:: ������ ������ ��� ���������� ����������� �������� ������ �� ����������
:: ������� �����. �������� ����� ���������� ������ � ��� ������, ���� �������
:: ������ ������� ���������.
:: "ConsentPromptBehaviorUser"="1"
::
:: - ������ ������� ������. ��������� ���� ��������, �������� ������������
:: ������������ ������� ������� ������ �������������� � ������ ������ ���
:: ���������� ����������� ��������. �������� ����� ���������� ������ � ���
:: ������, ���� ������� ������ ������� ���������.
:: "ConsentPromptBehaviorUser"="3"
::
:: ----------------------------------------------------------------------------
:: �������� ����� ��� UIAccess-���������� ������ ��� ��������� � ����������
:: ������
:: ----------------------------------------------------------------------------
:: ������� �������� �������� ��������� ��������� ����������� �� ���������������
:: ����������, ������� ����������� ���������� �� ������ �����������,
:: �������������� ��������� ����������������� ���������� ������� (User
:: Interface of Access � UIAccess) � ���������� ����� �������� �������. ��
:: ���������, ��� ��������� �������� � � ���������� �� ������������
:: �������������, ��� �������� UIAccess � ��������� ��������������� ��������
:: True ��� ���������� ���� ������� ��������� ����������. ���� � ����������
:: �������� false, �� ���� ���� ������� ������ ��� ����������� �������� ���
:: ������, ���������� �� ������ �������� ������ � ����������� �����������������
:: ����������. ����������� ��������� ������ ��������� �����:
:: - Program Files (������� ��������� �����)
:: - Program Files (x86) (������� ��������� �����)
:: - Windows\System32
::
:: ��������� �������� ���������:
::
:: - ���������. ���������� ����� ����������� � ������� ����������� UIAccess,
:: ���� ���� ��� �� ��������� � ���������� ����� �������� �������.
:: "EnableSecureUIAPaths"="0"
::
:: - ��������. ���������� ����� ����������� � ������� ����������� UIAccess
:: ������ � ��� ������, ���� ��� ��������� � ���������� ����� �������� �������.
:: "EnableSecureUIAPaths"="1"
::
:: ----------------------------------------------------------------------------
:: ��������� ���� ������ ��� ����������� � ����������� ����������� ������
:: ----------------------------------------------------------------------------
:: ������ ��������� ��������� �������� �������� ������� ������� ���������
:: ����������, ����� �� ��������� �������� ����������� �������� �������������
:: ���������� � ��������������� ��������� ����� (Public key infrastructure
:: PKI), ������� ������� ��������� ����������. ������� PKI �������� �����������
:: �������� ������� �������� ������������, ������ �� � �������������, ��������
:: ����������, ����������� ��� ����������� �������� ������������ ������������.
:: � ����� ����������, �������������� PKI, ������: ���������� �����������
:: �����, ��������� ��������, ����������� ����, ����������� ����� �����������,
:: ������ ������ � ����� � ���������� IP, ����������� ����� � ��������� �
:: ����������� �������� ��������. ���� �������� ��� ��������, �� ���������
:: ���������� �������� ���� �����������. �������� ���� ��������� �� ��������� �
:: ���������.
::
:: ��������� �������� ���������:
::
:: - ���������. ��� ��������� ����� ���������, �������� ������� ������� ��
:: ���������� �������� ������� ����������� PKI-������������, ������ ���
:: ��������� ���������� ������� ������������ �����.
:: "ValidateAdminCodeSignatures"="0"
::
:: - ��������. ������������� ������������ �������� ���� PKI-������������,
:: ������ ��� ����������� �� ���������� ������ ����. � �������� ������
:: ��������� ������������ � ������������ � �������, � ��� ������ ����
:: ������������� �������� PKI-����������� � ��������� ������� ���������.
:: "ValidateAdminCodeSignatures"="1"
::
:: ----------------------------------------------------------------------------
:: ��� ����� ������ � ���� ��� ������ ������������� � ����� ����������
:: ������������
:: ----------------------------------------------------------------------------
:: ���� �������� ��������� ���������������� ����� ������ ���������� �
:: ����������� ������������ � ������� � �������� �������. � ������, ���� ���
:: ��������� ��������, ��� ���������� ����������, ������� �������� ���������
:: ��� ���������� ����������, ��������� ���������� ������� �������, ��������
:: ������� ������� �������������� ������ � �������� �������. ��������� ����
:: ���������, UAC ��������� ��������� ��������� ���������� ����������, �������
:: ����������� �� ����� �������������� � �� ����� ���������� ���������� ������
:: � ����� %ProgramFiles%, %SystemRoot%, %SystemRoot%\System32 ��� � ������
:: ���������� ������� HKLM\Software. �������� �� ��������� � ��������.
::
:: ��������� �������� ���������:
::
:: - ���������. ���������� ����������, ������������ ������ � ����������
:: ������������, ������������� �������, � �� ����� �����������.
:: "EnableVirtualization"="0"
::
:: - ��������. ���� ������ ���������� ���������������� �� ����� ���������� �
:: ����������� ������������� ������������ � �������� ������� � �������.
:: "EnableVirtualization"="1"
::
:: ----------------------------------------------------------------------------
:: ��������� UIAccess-����������� ����������� ��������� ����, �� ���������
:: ���������� ������� ����
:: ----------------------------------------------------------------------------
:: ���� ����� �������� ��������, ����������� � ������������ �������� Windows 7
:: � Windows Server 2008 R2, ����������, ����� �� UIAccess-����������
:: ������������� ��������� ���������� ������� ���� ��� �������� �� ���������
:: ����������, ������������ ������� �������������. �������� �� ��������� �
:: ���������.
::
:: ��������� �������� ���������:
::
:: - ���������. ��� ������ ����� ���������, ���������� ������� ���� ����� ����
:: �������� ������ ������������� �������������� �������� ����� ��� ����
:: ���������� ��������� �������� "�������� ������� �������: ������������ �
:: ����������� �������� ����� ��� ���������� ������� �� ��������� ����".
:: "EnableUIADesktopToggle"="0"
::
:: - ��������. ��� ������ ���� ���������, UIAccess-���������, � ��� �����
:: �������� �������� Windows, ������������� ��������� ���������� ������� ����
:: ��� �������� �� ��������� ����������. ���� �������� �������� "��������
:: ������� �������: ������������ � ����������� �������� ����� ��� ����������
:: ������� �� ��������� ����" �������, �� ����������� �������� �� �������������
:: ������� ����� ������������, � �� �� ���������� ������� �����.
:: "EnableUIADesktopToggle"="1"
::
:: ----------------------------------------------------------------------------
:: ����� ��������� ��������������� ��� ���������� ������� ������ ��������������
:: ----------------------------------------------------------------------------
:: ������ ��������� ����������, ����������� �� � �������� ������� �������
:: ������������� ����� ��������� ��������������� � ���������� ������� ������
:: "�������������". ��� ���������� ������� ������ �� ��������� ���������
:: ������������ ������� � ������� � ������ ������������� � Windows XP, ���
:: ��������� ��������� ����� ���������� � ������� ������� ��������������. ��
:: ��������� ���� �������� �������� ��������.
::
:: ��������� �������� ���������:
::
:: - ���������. ���������� ������� ������ �������������� ��������� ���
:: ���������� � ������� ������� ��������������.
:: "FilterAdministratorToken"="0"
::
:: - ��������. ��� ������ ����� �������� ���������, ��� ���������� �������
:: ������ �������������� ����� �������������� ����� ��������� ���������������.
:: ��� ���� ����� ��������, ��������� ��������� ����, ����� ��������������
:: �������� �� ������������� ��������.
:: "FilterAdministratorToken"="1"
::
:: ----------------------------------------------------------------------------
:: ��������� ������ ������ ���. ��������������� ���������������� ����������� �
:: �������� ����������� � ������� �������
:: ----------------------------------------------------------------------------
:: ��������, ��� �����������: \\remotehost\Admin$
::
:: ��������� �������� ���������:
::
:: - ���������. �� �������� ����� ������ ������ ���. ��������������� ���
:: ���������������� ������������ � �������� �����������.
:: "LocalAccountTokenFilterPolicy"="0"
::
:: - ��������. �������� ����� ������ ������ ���. ��������������� ���
:: ���������������� ������������ � �������� �����������.
:: "LocalAccountTokenFilterPolicy"="1"

:Finish
