@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set access mode for file or directory
set USAGE=file_or_dir [read/write/full]

call :Set_Access_Mode "%~1" "%~2"
goto Finish


:Set_Access_Mode
if "%~1"=="" exit /B 255
if not exist "%~1" exit /B 2
if "%~2"=="" (
  cacls.exe "%~1"
  exit /B 0
)
if /I "%~2"=="READ" (
  set MODE=R
  set MODE_NAME=Read
  goto Set_Access_Mode_Begin
)
if /I "%~2"=="WRITE" (
  set MODE=W
  set MODE_NAME=Write
  goto Set_Access_Mode_Begin
)
if /I "%~2"=="FULL" (
  set MODE=F
  set MODE_NAME=Full
  goto Set_Access_Mode_Begin
)
exit /B 255
:Set_Access_Mode_Begin
call>nul SetOwner "%~1"
set CACLS_KEYS=/C /E /P
call>nul Directory Check "%~1" && set CACLS_KEYS=/T /C /E /P
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "SYSTEM":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "������������":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "Administrators":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "�����������":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "Administrator":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "Admin":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "����� ���짮��⥫�":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "Power users":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "���짮��⥫�":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "Users":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "��":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "All":%MODE%
cacls.exe>nul 2>nul "%~1" %CACLS_KEYS% "%USERNAME%":%MODE% && (
  call EchoSucc Set access mode "%MODE_NAME%" to "%~1"
  exit /B 0
)
call EchoFail Set access mode "%MODE_NAME%" to "%~1"
if /I "%DEBUG%"=="YES" (
  cacls.exe "%~1" %CACLS_KEYS% "%USERNAME%":%MODE%
)
exit /B 1

:: CACLS ����� [/T] [/E] [/C] [/G ���:�����] [/R ��� [...]]
::
::                [/P ���:����� [...]] [/D ��� [...]]
::
::    �����       �뢮� ⠡��� �ࠢ����� ����㯮�.
::
::    /T             ������ ⠡��� �ࠢ����� ����㯮� ��� 㪠������ 䠩���
::                   � ⥪�饬 ��⠫��� � ��� �����⠫����.
::
::    /E             ��������� ⠡���� �ࠢ����� ����㯮� ����� �� ������.
::
::    /C             �த������� �� �訡��� �⪠�� � ����㯥.
::
::    /G ���:�����  ��।������ ࠧ�襭�� ��� 㪠������ ���짮��⥫��.
::                   "�����": R  �⥭��
::                             W  ������
::                             C  ��������� (������)
::                             F  ����� �����
::
::    /R ���         ��� ࠧ�襭�� ��� ���짮��⥫� (⮫쪮 ����� � /E).
::
::    /P ���:�����  ������ ࠧ�襭�� ��� 㪠������� ���짮��⥫�.
::                   "�����": N  ���������
::                             R  �⥭��
::                             W  ������
::                             C  ��������� (������)
::                             F  ����� �����
::    /D ���         ����� �� ����� ��� 㪠������� ���짮��⥫�.
::
:: � १���� �믮������ ������� 㪠������� ���짮��⥫� �㤥� �।��⠢���
:: ����� ����� � ����� System Volume Information.
:: cacls "C:\System Volume Information" /E /G ���_���짮��⥫�:F
::
:: � १���� �믮������ ������� ��������� 㪠������� ���짮��⥫� ����
:: ���㫨஢���.
:: cacls "C:\System Volume Information" /E /R ���_���짮��⥫�

:Finish
