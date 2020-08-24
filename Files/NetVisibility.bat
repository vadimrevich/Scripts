@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Disable/enable visibility in a network neighborhood
set USAGE=disable/enable

if /I "%~1"=="DISABLE" (
  call :Disable_Net_Visibility
  goto Finish
)
if /I "%~1"=="ENABLE" (
  call :Enable_Net_Visibility
  goto Finish
)
exit /B 255


:Disable_Net_Visibility
net.exe 2>&1 config server /HIDDEN:YES|%SystemRoot%\System32\find.exe>nul 2>nul /I "�믮����� �ᯥ譮" && (
  call EchoSucc Disable visibility in a network neighborhood
  exit /B 0
)
call EchoFail Disable visibility in a network neighborhood
if /I "%DEBUG%"=="YES" net.exe config server /HIDDEN:YES
exit /B 1

:Enable_Net_Visibility
net.exe 2>&1 config server /HIDDEN:NO|%SystemRoot%\System32\find.exe>nul 2>nul /I "�믮����� �ᯥ譮" && (
  call EchoSucc Enable visibility in a network neighborhood
  exit /B 0
)
call EchoFail Enable visibility in a network neighborhood
if /I "%DEBUG%"=="YES" net.exe config server /HIDDEN:NO
exit /B 1

::    �� ����� ����� ��設�, �⮡� ��� ��  ������  �  ᯨ᪨  ����ᮢ  ��,
:: ���ࠢ ᫥������ ������� � ��������� ��ப�: net config server /hidden:yes
::    �� ������� ��⠭�������� � ॥��� ���� HKEY_LOCAL_MACHINE\SYSTEM\
:: CurrentControlSet\Services\Lanman-Server\Parameters\Hidden � 1.
::    � ��設� ����  ��������  ���  �  �⥢���  �ࢥ��,  ��  ���짮��⥫�
:: �ਤ���� ������ ����� ����� � ��� � �ࢥ�� � ��� ᮢ���⭮  �ᯮ��㥬�
:: ����ᠬ � �ଠ� Uniform Naming Convention (UNC) - ��設�  ��  �����  �
:: ᯨ᪠� ����ᮢ ��.
::    ��᫥ ⮣�, ��� �� ᤥ���� �� ���������, �� ������ ��१�������  �ࢨ�
:: Server ��� ��१���㧨�� ��設�. �஬� ⮣�, �����  ���ॡ�������  �����  50
:: ����� �� �, �⮡�  ��設�  �뫠  㤠����  ��  ᯨ᪠  ����ᮢ  ��  ��-��
:: ����⨪� ����砭�� �ப� ����⢨� �ࢨᮢ ��ᬮ�� �� � Windows.

:Finish
