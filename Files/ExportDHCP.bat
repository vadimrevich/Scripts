@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Export DHCP-server params to file [DHCP.dat]
set USAGE=[file_name]

call :Export_DHCP "%*"
goto Finish


:Export_DHCP
setlocal
set EXPORT_FILE_NAME=%*
set EXPORT_FILE_NAME=%EXPORT_FILE_NAME:"=%
:Export_DHCP_Loop
if "%EXPORT_FILE_NAME:~-1%"==" " (
  set EXPORT_FILE_NAME=%EXPORT_FILE_NAME:~0,-1%
  goto Export_DHCP_Loop
)
if "%EXPORT_FILE_NAME%"=="" set EXPORT_FILE_NAME=DHCP.dat
netsh.exe 2>&1 >"%TEMP%\ExportDHCP.tmp" dhcp server export "%EXPORT_FILE_NAME%" all && (
  call EchoSucc Export DHCP-server params to file "%EXPORT_FILE_NAME%"
  del>nul 2>nul /A /F /Q "%TEMP%\ExportDHCP.tmp"
  call Wait 15
  exit /B 0
)
call EchoFail Export DHCP-server params to file "%EXPORT_FILE_NAME%"
if /I "%DEBUG%"=="YES" type 2>nul "%TEMP%\ExportDHCP.tmp"
del>nul 2>nul /A /F /Q "%TEMP%\ExportDHCP.tmp"
call Wait 15
exit /B 1

::     �᫨ ��� �ᥣ�-���� �㡫��஢��� ���ଠ�� � 1�� �ࢥ�  ��  ��㣮�,
:: �� ��砩 ��室� �� ���� ��ࢮ��, ��� �� 祣� ���������, � ��  ��⠭�������
:: DHCP �४�᭮ ࠡ�⠥� ⠪�� ��㪠:
::
::     netsh dhcp server export "\\�.�.�.�\d$\dhcp\dhcp.txt" all
::
::     ��� �.�.�.� - ���� ��࣮ ���.  �  ��砥  ��室�  ��  ����  ��ࢮ��  -
:: �����筮 ����㧨�� ����� ��檠� �� ��஬, � ��. ��⭨� � ⠪�� ���窮� �
:: 襤㫫�� �� �믮������ ࠧ � �-�����. � �� ��஬ �ࢥ� -  ���  ������,  ��
:: ᪮�� �� ����஥��. �.�. �㦡� ����饭� � ��. �  ��  �ࢥ�  ���ਧ����.  �
:: ��砥 ����室���� �� ����⠭������� � ������ - �� ᪮��  �  ����ன��  ᠬ�
:: ����⠭����������.

:Finish
