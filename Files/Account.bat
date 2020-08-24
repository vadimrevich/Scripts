@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Activate/delete/make account
set USAGE=activate/delete/make account [pass]

if /I "%~1"=="DELETE" (
  call :Delete_Account "%~2"
  goto Finish
)
if /I "%~1"=="MAKE" (
  call :Make_Account "%~2" "%~3"
  goto Finish
)
if /I "%~1"=="ACTIVATE" (
  call :Activate_Account "%~2"
  goto Finish
)
exit /B 255


:Activate_Account
if "%~1"=="" exit /B 255
set ACCOUNT=%~1
set ACCOUNT=%ACCOUNT:*\=%
if /I "%ACCOUNT%"=="Administrator" (
  net.exe>nul 2>nul user "�����������" /EXPIRES:NEVER
  net.exe     2>&1  user "�����������" /ACTIVE:YES|%SystemRoot%\System32\find.exe>nul 2>nul /I "�믮����� �ᯥ譮" && (
    call EchoSucc Activate account "�����������"
    exit /B 0
  )
)
net.exe>nul 2>nul user "%ACCOUNT%" /EXPIRES:NEVER
net.exe     2>&1  user "%ACCOUNT%" /ACTIVE:YES|%SystemRoot%\System32\find.exe>nul 2>nul /I "�믮����� �ᯥ譮" && (
  call EchoSucc Activate account "%ACCOUNT%"
  exit /B 0
)
call EchoFail Activate account "%ACCOUNT%"
if /I "%DEBUG%"=="YES" (
  if /I "%ACCOUNT%"=="Administrator" net.exe user "�����������" /ACTIVE:YES
                                     net.exe user "%~1"           /ACTIVE:YES
)
exit /B 1

:Delete_Account
if "%~1"=="" exit /B 255
set ACCOUNT=%~1
set ACCOUNT=%ACCOUNT:*\=%
net.exe 2>&1 user "%ACCOUNT%" /DELETE|findstr.exe>nul 2>nul /I "�ᯥ譮 ��" && (
  call EchoSucc Delete account "%ACCOUNT%"
  exit /B 0
)
call EchoFail Delete account "%ACCOUNT%"
if /I "%DEBUG%"=="YES" net.exe user "%ACCOUNT%" /DELETE
exit /B 1

:Make_Account
if "%~1"=="" exit /B 255
if "%~2"=="" exit /B 255
set ACCOUNT=%~1
set ACCOUNT=%ACCOUNT:*\=%
net.exe 2>&1 user "%ACCOUNT%" "%~2" /Y /ADD|findstr.exe>nul 2>nul /I "�ᯥ譮 㦥" && (
  net.exe>nul 2>nul user "%ACCOUNT%" "%~2"
  net.exe>nul 2>nul user "%ACCOUNT%" /EXPIRES:NEVER
  call EchoSucc Make account "%ACCOUNT%"
  exit /B 0
)
call EchoFail Make account "%ACCOUNT%"
if /I "%DEBUG%"=="YES" net.exe user "%ACCOUNT%" "%~2" /Y /ADD
exit /B 1

:Finish

::    � Windows 8, ��� � � �।���� ������ ������᪮�  ����樮����  ��⥬�
:: Microsoft ������� ᯥ樠�쭠� ���஥���� ��⭠�  ������  �����������,
:: ����� �� 㬮�砭�� ����. �� ��⭠� ������ ("Administrator")  ᮧ������
:: ��  ��⠭����  ��⥬�  �  ��ॢ������   �   ���ﭨ�   <�⪫�祭�>.   ���
:: ���짮��⥫�  ᮧ������   �⤥�쭠�   ��⭠�   ������,   ⠪��   ���������
:: �����������᪨��   �ਢ�����ﬨ   �   �室���    �    ��㯯�    ��������
:: ����������஢, �� � ��砥 �믮������ ��-��� �⮩ ��⭮� ����� ����権,
:: �ॡ���� ���������⨢��� �������稩, ������ ����� UAC  (User  Account
:: Control). �஬� ⮣� �� ��⥬��� ��⠫���� � 䠩��� ���� �����  �ࠢ���
:: � 㤠����  ��-���  �⮩  ��⪨,  ����  �  ����襭�묨  �ࠢ���.  ���  �⮣�
:: ��室���� ������ ������஢��� NTFS ࠧ�襭�� �� ����� ��ꥪ�� 䠩�����
:: ��⥬�.
::
::    ���஥���� ��⭠� ������ ����������� �������� ����࠭�祭�묨 �ࠢ���
:: � ��⥬� � �������� �믮����� ��� ����樨 � ��⥬� ���  ��࠭�祭��  �
:: ����ᮢ UAC. ����� ������  �����������  �����  (�  �������  �  �㦭�)
:: ��२��������,  ��  㤠����  ��  �����.  �������  ������  �����  ������
:: �����������  �  Windows  8,  ���  �  �  ��㣨�  ��⥬��  Windows,  �����
:: ���ॡ������� ��� ���࠭���� �����-���� ᫮���� ����ࠢ���⥩,  �������⨪�
:: ࠡ��� ��⥬� ��� 㤠����� �।���᭮�� ��.
::
::    ��⭠� ������ �����������  �  Windows  8  �⪫�祭�  ��  ᮮ�ࠦ����
:: ������᭮��. � �����  ��।� - �⮡�  ������  ��⥬�  ��  �����४���
:: ����⢨�  ���짮��⥫�  �  ����࠭�祭�묨  �ࠢ���,   �   ⠪��   �᫮�����
:: �।����� �ணࠬ��� ������ ��ࠦ���� � ����७�� � ����樮���� ��⥬�.
::
::    �� 㬮�砭�� �  ���஥����  �����  �����������  ���  ��஫�,  ���⮬�
:: ����������  ᬥ���  ���  �  ��⮬ �ॡ������ ᫮����� ��஫�. ��⨢����
:: ���஥����� ����������� ⮫쪮 ⮣��, ����� �� ����⢨⥫쭮 ����室���,
:: � �ࠧ�  ��᫥  �믮������  �ॡ㥬��  ����権  �⪫���  ���.  ����ﭭ�
:: ࠡ���� ��� �⮩ ��⪮� ��⥣���᪨ �� ४���������!
