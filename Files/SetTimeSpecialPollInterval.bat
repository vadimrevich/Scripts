@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set time special poll interval
set USAGE=seconds

call :Set_Time_Special_Poll_Interval "%~1"
exit /B 255


:Set_Time_Special_Poll_Interval
if "%~1"=="" exit /B 255
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /V "SpecialPollInterval" /T REG_DWORD /D "%~1" /F || goto Set_Time_Special_Poll_Interval_Fail
call EchoSucc Set time special poll interval: "%~1"
exit /B 0
:Set_Time_Special_Poll_Interval_Fail
call EchoFail Set time special poll interval: "%~1"
if /I "%DEBUG%"=="YES" (
  reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient" /V "SpecialPollInterval" /T REG_DWORD /D "%~1" /F
)
exit /B 1

:: ������ ���������� W32Time ������������� ����� �������� �������
:: HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters\NtpServer
:: �� �������� ������ �������� �������, ����������� ���������. ������ ������
:: ����� ����� ������������� ����������������� �������� ������, �����������
:: ����� ������� ����� �������. ���������� 4 ��������� �������� ������:
::   0x01 SpecialInterval
::   0x02 UseAsFallbackOnly
::   0x04 SymmatricActive
::   0x08 Client
::
:: ��� ������������� ����� SpecialInterval, ������������ �������� �������
:: HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient\
:: SpecialPollInterval - �������� ������������� ������� � ��������.
:: �� ��������� �� ����� 7 ���� (604800 ���). ��� ����� ��������� ���� �����
:: ����� ����������� �� ���������� �����. ���������� ��������� ��������
:: ������������� �� 6 ����� (21600 ���). ��� ��������� �� �������� �� �������,
:: �� �������� �� NTP-�������, � ��� ���� �������� ������������ ����� �������
:: �������� ���� ����� ������ ����������.
::
:: ��� �������� ����� UseAsFallbackOnly ������ ������� ����������, ��� ������
:: ������ ����� �������������� ��� ��������� � ����� �������������� � ���
:: ����� ���������� ��������� � ������ �������� ������.
::
:: ����� �������� ����������� �������� � ����� ���������� ������������
:: ����������� � ������� ��������: w32tm /config /update. � ��� �������������
:: ��������� ����������� �������������: w32tm /resync.

:Finish
