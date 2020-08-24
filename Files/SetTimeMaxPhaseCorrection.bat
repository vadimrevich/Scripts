@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set time max phase correction
set USAGE=fordc/always

if /I "%~1"=="FORDC"  call :Set_Time_Max_Phase_Correction 0x0002A300
if /I "%~1"=="ALWAYS" call :Set_Time_Max_Phase_Correction 0xFFFFFFFF
exit /B 255


:Set_Time_Max_Phase_Correction
if "%~1"=="" exit /B 255
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /V "MaxNegPhaseCorrection" /T REG_DWORD /D "%~1" /F || goto Set_Time_Max_Phase_Correction_Fail
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /V "MaxPosPhaseCorrection" /T REG_DWORD /D "%~1" /F || goto Set_Time_Max_Phase_Correction_Fail
call EchoSucc Set time max phase correction: "%~1"
exit /B 0
:Set_Time_Max_Phase_Correction_Fail
call EchoFail Set time max phase correction: "%~1"
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /V "MaxNegPhaseCorrection" /T REG_DWORD /D "%~1" /F
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config" /V "MaxPosPhaseCorrection" /T REG_DWORD /D "%~1" /F
)
exit /B 1

:: ������ ������������ �������� �������������/������������� ��������� �������
:: (� ��������), ������� ����� ��������� ������ �������. ���� ��������, ���
:: �������� ��������� ��������� ���������� ��������, �� ��������� �����������
:: �� �����, � ����� ���������������� ��������������� �������. ���� ������
:: �������� ����� 0xFFFFFFFF, �� ��������� ������� ����� ����������� ������.
:: �� ��������� ��� �����������-������ ������ ������������ �������� 0xFFFFFFFF.
:: ��� ������������� ����������� � �������� �� ��������� ������������ ��������
:: 0x0000D2F0 (15 �����). ��� ������������ ������ - 0x0002A300 (48 �����).

:Finish
