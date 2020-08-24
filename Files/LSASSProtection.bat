@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Disable/enable LSASS protection from third-party modules
set USAGE=disable/enable

if /I "%~1"=="DISABLE" (
  call :Disable_LSASS_Protection
  goto Finish
)
if /I "%~1"=="ENABLE" (
  call :Enable_LSASS_Protection
  goto Finish
)
exit /B 255


:Disable_LSASS_Protection
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /V "RunAsPPL" /T REG_DWORD /D "0" /F || goto Disable_LSASS_Protection_Fail
call EchoSucc Disable LSASS protection from third-party modules
exit /B 0
:Disable_LSASS_Protection_Fail
call EchoFail Disable LSASS protection from third-party modules
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /V "RunAsPPL" /T REG_DWORD /D "0" /F
)
exit /B 1

:Enable_LSASS_Protection
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /V "RunAsPPL" /T REG_DWORD /D "1" /F || goto Enable_LSASS_Protection_Fail
call EchoSucc Enable LSASS protection from third-party modules
exit /B 0
:Enable_LSASS_Protection_Fail
call EchoFail Enable LSASS protection from third-party modules
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /V "RunAsPPL" /T REG_DWORD /D "1" /F
)
exit /B 1

:Finish

:: https://www.atraining.ru/mimikatz-lsa-protection/
::
::   ������� � Windows 8.1 � Windows Server 2012 R2,  ����������  ��������������
:: ����������� ��� ������. ��� ������ ����������� ���  �����������  ��������  ���
:: ������� LSASS - ���� ��������� LSASS ������ ���� ��������, �� �����  ���������
:: ������ �������������� �  �����  (��������,  ������  �����  ������)  ��  ������
:: ��������� � ������ ������� ������� (���������� �� ���������  �������  ������),
:: �� � ����������� ����������� �� ������� Microsoft. ��  ������  �����������,  �
:: ��� � ����������������� ������� � ����������� �������� �������.
::
::    ����������     ����     �����     ������     �     �     �����      �������
:: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa   ��������   ��������
:: RunAsPPL ���� DWORD32 � ������������ � 1.
::
::    ��� �������� ��������� � ������� System �� ���� WinInit ����� �������:
::    LSASS.exe was started as a protected process with level: 4
::
::    �������  �  ����������  ������  LSASS  ��  �����  ����������  �������������
:: �������. ���� �  ���  ���  �  ��  ������������,  ��  ���  ����������  ��������
:: ��������������  �����������  ����  �������  �����  LocalSystem  ���������   ��
:: �����������  ������  ��������  LSA.  ��  ������  �����������,   ����   �   ���
:: ������������:
::
::    - ���������� ������� �������  -  ��������,  ���  �������  ������  ���������
:: ��������� � �������� ������ � ������� �� ����������� ������ � ������;
::    - ������������, ������ ��� ���������  �����-��  �����������  �����������  �
:: ��������, Kerberos �� ���.������������;
::    - ���������   ��������   �����-����,   �����������   �����-��   �����������
:: ����������;
::
::    ���� �� ����� ��������� ����� ������ ���� ���� ��� ������������  Microsoft,
:: ��� ��� �� ����� �����������, � � ����� ����� ������� 3033 � 3036.
::
::    �������, ���� ����� ���������� LSA �� ������������,  ���  ���  ������  ����
:: �������� ������ � �����������. �� ����������� ���, ���  ���,  �����  ������  �
:: 8.1+ � 2012 R2+.
