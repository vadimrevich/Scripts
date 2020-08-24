@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Enable connect to server from console
set USAGE=server_name [host_or_domain\user [password]]

call :Enable_Connect_To_Server "%~1" "%~2" "%~3"
goto Finish


:Enable_Connect_To_Server
if "%~1"=="" exit /B 255
for /F "delims=." %%i in ('echo.%~1') do set SERVER_NAME=%%i
set USER=%~2
set PASS=%~3
if "%USER%"=="" set USER=%COMPUTERNAME%\coreadmin
if "%PASS%"=="" set PASS=Core_Admin
call Account Make       "%USER%" "%PASS%"
call AddUserToAdmins    "%USER%"
call AddUserToDCOMUsers "%USER%"
:: Set credentials for server
cmdkey.exe /LIST:%SERVER_NAME%
cmdkey.exe /DELETE:%SERVER_NAME%
cmdkey.exe /ADD:%SERVER_NAME% /USER:%USER% /PASS:%PASS%
:: Permit ANONYMOUS LOGON remote DCOM access
cscript.exe /NOLOGO %SYSTEMROOT%\SYSTEM32\hvremote.wsf /mode:client /anondcom:grant
exit /B

:: �᫨ �� ��� �ࠢ���� Server Core ��� �ᯮ�짮����� ��������
:: ��⥭�䨪�樨, ��� �ᯮ�짮����� ����ୠ⨢��� ����� ������ ��
:: ������祭�� � �ࠢ�塞��� ��������� �믮���� ᫥������ ������� ��
:: �ࠢ���饬 ��������:
::
::   cmdkey /add:server.argon.com.ru /user:server\admin /pass:argonforever
::
::    �� ���஢� ������� ������祭�� �� WinRM � ᤥ���� �������� � �ਭ樯�
:: �ࠢ����� �� MMC.

:Finish
