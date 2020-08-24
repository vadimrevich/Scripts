@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set attachment manager policy
set USAGE=

call :Set_Attachment_Manager_Policy
goto Finish


:Set_Attachment_Manager_Policy
:: �������� �� ����������� ��� �������� �������� � ����:
::   0 - ��� (�� ���������).
::   1 - ��.
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "HideZoneInfoOnProperties" /T REG_DWORD /D "0" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "HideZoneInfoOnProperties" /T REG_DWORD /D "0" /F || goto Set_Attachment_Manager_Policy_Fail

:: ��������� �� �������� � ���� ������������� ��������:
::   1 - ���.
::   2 - �� (�� ���������).
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "SaveZoneInformation"      /T REG_DWORD /D "1" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "SaveZoneInformation"      /T REG_DWORD /D "1" /F || goto Set_Attachment_Manager_Policy_Fail

:: ���������� �� ������������ ��������� ��� �������� ��������:
::   1 - ���.
::   2 - �������������.
::   3 - ��.
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "ScanWithAntiVirus"        /T REG_DWORD /D "3" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "ScanWithAntiVirus"        /T REG_DWORD /D "3" /F || goto Set_Attachment_Manager_Policy_Fail

:: ��� �������� ����� ��������:
::   1 - ���� �����.
::   2 - ����������� ����� (�� ���������).
::   3 - ���� � ����������� �����.
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "UseTrustedHandlers"       /T REG_DWORD /D "2" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "UseTrustedHandlers"       /T REG_DWORD /D "2" /F || goto Set_Attachment_Manager_Policy_Fail

:: ������� ����� �� ��������� ��� ��������� ������:
::   6150 - �������. ���� �������� ��������� � ������ �����  ������  �  �������
:: ������ � �������� ��  ����  ������������  �����,  Windows  ���������  ������
:: ������������ � �����. ���� ���� ������� �� ����  ���������,  Windows  ������
:: ��������������, ������ ��� ������������ ������� ������ � �����.
::   6151 - �������. ���� �������� ��������� � ������ ����� ������  ��  �������
:: ������ � �������� �� ���� ������������ �����  ���  ����  ���������,  Windows
:: ������ ��������������, ������ ��� ������������ ������� ������  �  �����  (��
:: ���������).
::   6152 - ������. ���� �������� ��������� �  ������  �����  ������  �  ������
:: ������, Windows �� ������ �������������� (���������� ��  ��������  �  ����),
:: ������ ��� ������������ ������� ������ � �����.
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "DefaultFileTypeRisk" /T REG_DWORD /D "6152" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "DefaultFileTypeRisk" /T REG_DWORD /D "6152" /F || goto Set_Attachment_Manager_Policy_Fail

:: ������ ����� ������ � ������ ������.
reg.exe>nul 2>nul add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "LowRiskFileTypes"    /T REG_SZ /D ".7z;.bat;.cmd.;.com;.exe;.ini;.log;.msi;.rar;.reg;.txt;.zip;" /F || goto Set_Attachment_Manager_Policy_Fail
reg.exe>nul 2>nul add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "LowRiskFileTypes"    /T REG_SZ /D ".7z;.bat;.cmd.;.com;.exe;.ini;.log;.msi;.rar;.reg;.txt;.zip;" /F || goto Set_Attachment_Manager_Policy_Fail

call EchoSucc Set attachment manager policy
exit /B 0
:Set_Attachment_Manager_Policy_Fail
call EchoFail Set attachment manager policy
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "HideZoneInfoOnProperties" /T REG_DWORD /D "0" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "HideZoneInfoOnProperties" /T REG_DWORD /D "0" /F
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "SaveZoneInformation"      /T REG_DWORD /D "1" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "SaveZoneInformation"      /T REG_DWORD /D "1" /F
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "ScanWithAntiVirus"        /T REG_DWORD /D "3" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "ScanWithAntiVirus"        /T REG_DWORD /D "3" /F
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "UseTrustedHandlers"       /T REG_DWORD /D "2" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments"  /V "UseTrustedHandlers"       /T REG_DWORD /D "2" /F
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "DefaultFileTypeRisk"      /T REG_DWORD /D "6152" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "DefaultFileTypeRisk"      /T REG_DWORD /D "6152" /F
  reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "LowRiskFileTypes"         /T REG_SZ /D ".7z;.bat;.cmd.;.com;.exe;.ini;.log;.msi;.rar;.reg;.txt;.zip;" /F
  reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "LowRiskFileTypes"         /T REG_SZ /D ".7z;.bat;.cmd.;.com;.exe;.ini;.log;.msi;.rar;.reg;.txt;.zip;" /F
)
exit /B 1

:Finish


:: ��������� ���������� ��������.
:: http://support.microsoft.com/kb/883260/ru
::
::   ��������� �������� � ������������ ������� Windows  ��������  ���������  ��
:: ������������ ��������, ���������� ��  �����������  �����  ��� ����������� ��
:: ���������.
::
::   � ������ ���� ��������� �������� ������������ ��������, ������� ����� ����
:: ������������,  ��   �������������   ��������   ������   �����   ���   ������
:: �������������� ��� ��� ��������. ��������� ���������  ����������,  �����  ��
:: �������� ����� ������������� ��� ������ �������������� ��� ��� ��������:
::   - ��� ������������ ���������;
::   - ��� ������������ ��� ������������ �����;
::   - ��������� ������ ������������ ���� ���������,  ��  �������  ������������
:: �������� �����.
::
::   ��������� ���� ��������� ����� � �������� Microsoft Internet  Explorer  ��
:: ������� "������������". ��� ���������  ���  ���������  ��������  �����  ����
:: "������", ����� "�������� ������������", � ����� �������� ��������
:: "������������". ��������� ������ ���� ���������:
::   - ��������;
::   - ������� ���������;
::   - �������� ����;
::   - ������������ ����.
::
::   ��������� �������� ��������������  ����������  ���  �����������  �����  ��
:: ���� � ���������� �����. ����  ������  ����������������  ��  �������  �����,
:: ��������� �������� �������� ������ ��������, �������� � �������  �����.  ���
:: ���������� �� �������  ����  ����������  �����  ��  ���������,  ������������
:: ��������� ��������, ������������ ����������� �������� � ����  ���������  ���
:: ������� �����.
::   ��������, ��� ���������� �� ������� ���� ���������� ������� �����  (.zip),
:: ���������������  �  ������������  ���������,  ��������  �   ����   ���������
:: ����������� ������������ � ����������� ������� �����. ��� ������� ����������
:: ����������� ������� ����� ��� ���������� ����� �������� �� �����������.
::   �������� � ���� ��������� �����������  ������������  �  �����������  �����
:: ������ � ������, ���� �������� �������� �������� ����� �������� NTFS.
::   ��� ������� ��������� ��� ������� ���� �  ���-����,  ������������  �  ����
:: �������������  ���������,  �����  ���������  ���������  �  ���,   ���   ����
:: ������������.
::   ��� ������� ������� ���� �������� ������ ����� � ����, ������������ � ����
:: ��������� � ������������� ������ "��������", ����� ��������� ���������������
:: ���������, ������ ����� ������� ���� �������� ��� ��������.
::   ���� ������, ������� ��������� �������� �� ������� � ������  ��������  ���
:: ������� �����, ���������� � ������ �������� �����.
::   ��� �������  �������  ����  ��������  ������  �����,  �����������  �  ����
:: ��������� � ������� ������������ "��������" ��� ������������ ���� ���������,
:: �����  ���������  ���������������  ���������,  ������  �����  �������   ����
:: �������� ��� ��������.
