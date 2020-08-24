@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Disable/enable WDigest caching
set USAGE=disable/enable

if /I "%~1"=="DISABLE" (
  call :Disable_WDigest_Caching
  goto Finish
)
if /I "%~1"=="ENABLE" (
  call :Enable_WDigest_Caching
  goto Finish
)
exit /B 255


:Disable_WDigest_Caching
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /V "UseLogonCredential" /T REG_DWORD /D "0" /F || goto Disable_WDigest_Caching_Fail
call EchoSucc Disable WDigest caching
exit /B 0
:Disable_WDigest_Caching_Fail
call EchoFail Disable WDigest caching
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /V "UseLogonCredential" /T REG_DWORD /D "0" /F
)
exit /B 1

:Enable_WDigest_Caching
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /V "UseLogonCredential" /T REG_DWORD /D "1" /F || goto Enable_WDigest_Caching_Fail
call EchoSucc Enable WDigest caching
exit /B 0
:Enable_WDigest_Caching_Fail
call EchoFail Enable WDigest caching
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /V "UseLogonCredential" /T REG_DWORD /D "1" /F
)
exit /B 1

:Finish

:: https://www.atraining.ru/mimikatz-lsa-protection/
::
::    ���� �� �� �����������  ��������-��������������,  ��  �����  �  �����  ����
:: ������� �������, ����� ��� �� ���������� ������� �� ����� ��������� � ��������
:: ����.
::    � ����������� �������� � Windows 8.1+ � Windows Server 2012 R2+ �  ���  ���
:: ��������  ����  ��  ����,  �  ���  �  ����������  �������   ����   �����������
:: ����������� �������� � �������� � ���� ������� HKLM\SYSTEM\CurrentControlSet\
:: Control\SecurityProviders\WDigest �������� UseLogonCredential ����  DWORD32  �
:: ��������� ��� � ����.
::    ���� ���� �������� ������ � ����� �����������,  ��  ������  �  ������������
:: ����� ���� ������������� ���������� ��� ������  �  ��  ����  ������  ���������
:: ��������� ������ ����������� � RAM, � �� ���� ��������  digest.  HTTP-�������,
:: ������� ����� ������ ����� �����, ��������� ���� ��������.
::    ���� �� ����������, ���  ����  �����  �������,  ����������  ��������������,
:: ��������������� ������������ ������, � ��� ������� ����� ��� �����������������
:: �� WDigest � �� � ��� �� ����� ������� HKLM\SYSTEM\CurrentControlSet\Control\
:: SecurityProviders\WDigest ���� �������� Negotiate, ���� DWORD32, ������� �����
:: ���� ��������� � 0 � ����� ������� �������� Negotiate ��  �����  ���  ��������
:: �������  ������������ WDigest.
