@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set time synchronization from sources
set USAGE=[ntp_server1 [ntp_server2] ..]

call :Set_Time_Sync_From_Src "%*"
goto Finish


:Set_Time_Sync_From_Src
setlocal
set NTP_SERVERS=%*
set NTP_SERVERS=%NTP_SERVERS:"=%
:Set_Time_Sync_From_Src_Loop
if "%NTP_SERVERS:~-1%"==" " (
  set NTP_SERVERS=%NTP_SERVERS:~0,-1%
  goto Set_Time_Sync_From_Src_Loop
)
if "%NTP_SERVERS%"=="" set NTP_SERVERS=pool.ntp.org ntp.mobatime.ru ntp2.aas.ru
w32tm.exe 2>&1 /config /update /syncfromflags:MANUAL /manualpeerlist:"%NTP_SERVERS%"|%SystemRoot%\System32\find.exe>nul 2>nul /I "�믮����� �ᯥ譮" && (
  call EchoSucc Set time sync from "%NTP_SERVERS%"
  exit /B 0
)
call EchoFail Set time sync from "%NTP_SERVERS%"
if /I "%DEBUG%"=="YES" w32tm.exe /config /update /syncfromflags:MANUAL /manualpeerlist:"%NTP_SERVERS%"
exit /B 1

:: :Set_Time_Sync_From_Src
:: if "%~1"=="" exit /B 255
:: net.exe stop  "w32time" /Y
:: reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config"                  /V "AnnounceFlags" /T REG_DWORD /D "5"   /F
:: reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters"              /V "Type"          /T REG_SZ    /D "NTP" /F
:: reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters"              /V "NtpServer"     /T REG_SZ    /D "%~1" /F
:: reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer" /V "Enabled"       /T REG_DWORD /D "1"   /F
:: net.exe start "w32time"
:: exit /B

:: ������� ��᪮�쪮 ��ਠ�⮢ ࠡ��� �㦡� SNTP, �室�饩 � Windows:
::  - ������᪠� (NT5DS). �ᯮ������ �� 㬮�砭�� ��� ��� �������஢,
:: ��ꥤ������� � �����. ����஭����� �६��� �� ࠡ��� �⠭��� � �ࢥ��
:: ������ �ந�������� �� ����娨. ����� ��ࠧ��, ࠡ�稥 �⠭樨 � �冷��
:: �ࢥ�� ᨭ�஭��������� � ����஫��஬ ������, ��⥭���஢��訬 �室,
:: ����஫���� ������ - � 宧鶴�� ����樨 <����� PDC>, ����� � ᢮�
:: ��।� ᨭ�஭�������� � ����஫��஬ ������, ���騬 �� ����� ��᮪��
:: �஢�� ����娨. ������ �������, �� ����� ���冷� ᨭ�஭���樨
:: �ᯮ������ <�� 㬮�砭��> � ����� ���� ��८�।���� ������ ��� �
:: �ᯮ�짮������ ��㯯���� ����⨪.
::  - �ਭ㤨⥫쭠� ᨭ�஭����� � ��࠭�� NTP-�ࢥ஬ (NTP). � ������
:: ��砥 ���筨� �⠫������ �६��� ��� �㦡� Windows Time ��⠭����������
:: ���� ������, ���� � ������� ��㯯���� ����⨪.
::  - �⪫�祭�� ᨭ�஭���樨 (NoSync). ��� ०�� ����室�� ��� ᬥ蠭���
:: �奬� �����ঠ��� �६���, � ���ன ��� ᨭ�஭���樨 � ���譨� ���筨���
:: �ᯮ������ �த�� ���쥩 ���, � ��� �����ঠ��� �६��� � ࠬ���
:: ������ �ᯮ������ Windows Time.
::
:: ����ன�� �㦡� Windows Time �࠭���� � ॥��� Windows � ࠧ����
:: "HKLM\SYSTEM\CurrentControlSet\Services\W32Time".
:: � ��୥ ࠧ���� ��।������� ��ࠬ���� ࠡ��� ᠬ�� �㦡�, � �������
:: Config - ����ன��, �易��� � ࠡ�⮩ ᠬ��� ��⮪��� SNTP.
:: ����� ᨭ�஭���樨 ��।������ � ������� Parameters. ����ன��
:: SNTP-������ � �ࢥ� ��室���� � �������� TimeProviders\NtpClient �
:: TimeProviders\NtpServer ᮮ⢥��⢥���. ���ᬮ�ਬ �᭮��� ���祭��,
:: ��।����騥 ����ன�� NTP ������ � �ࢥ�:
::  - Type - ��।���� ०�� ࠡ��� NTP-������:
::    - NTDS5   - ������᪠�;
::    - NTP     - ������;
::    - NoSync  - �� ᨭ�஭���஢���;
::    - AllSync - ����㯭� �� ⨯� ᨭ�஭���樨.
::  - Enabled - ��।����, ����祭 �� ����� ��������� (������ ��� �ࢥ�);
::  - CrossSiteSyncFlags - ��।����, ����� �� ᨭ�஭���஢��� �६� �
:: ���筨���, ��室�騬�� �� �।����� ������, � ��砥 �᫨ �ᯮ������
:: ������᪠� ᨭ�஭�����:
::    - 0 - �����;
::    - 1 - ⮫쪮 � ����஬ PDC;
::    - 2 - � �ᥬ�.
::  - EventLogFlags - ��।����, ���� �� ᮮ�饭�� �� Windows Time ��������
:: � ��ୠ� ��� ���.

:Finish
