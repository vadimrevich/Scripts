@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Check on member of domain
set USAGE=

call :Check_Member_Of_Domain
goto Finish


:Check_Member_Of_Domain
if /I "%CHECK_MEMBER_OF_DOMAIN%"=="YES" goto Check_Member_Of_Domain_Succ
if /I "%CHECK_MEMBER_OF_DOMAIN%"=="NO"  goto Check_Member_Of_Domain_Fail
for /F "tokens=1,2,*" %%i in ('reg.exe 2^>nul query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /V "Domain"') do if /I "%%i"=="Domain" if not "%%k"=="" goto Check_Member_Of_Domain_Succ
:Check_Member_Of_Domain_Fail
set CHECK_MEMBER_OF_DOMAIN=NO
call EchoWarn It is not member of domain
if /I "%DEBUG%"=="YES" reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /V "Domain"
exit /B 1
:Check_Member_Of_Domain_Succ
set CHECK_MEMBER_OF_DOMAIN=YES
call EchoWarn It is member of domain
if /I "%DEBUG%"=="YES" reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /V "Domain"
exit /B 0

:: http://technet.microsoft.com/ru-ru/library/aa998420%28v=exchg.80%29.aspx
::
::    ��ࠬ��� "NV Domain" ॥��� ᮤ�ন�  �᭮����  DNS-���䨪�  ��������.
:: ��ࠬ���  "Domain"  ॥���  ᮤ�ন�  �᭮����  DNS-�����  ��������.   ��
:: 㬮�砭��  �᭮����  ����  DNS-���䨪�  �������  ���������  �����   (FQDN)
:: ��������  ������  ᮢ������  �  ������  ������  �㦡�  ��⠫����   Active
:: Directory,  �  ���஬  ��室����  ��������.  ��ᮢ�����騥   �����   �����
:: ���९���⢮����  �ࠢ��쭮��  �믮������  DNS-ॣ����樨.  �᫨   DNS-���
:: �������� �� ᮢ������  �  ������  ������  Active  Directory,  �����  �㤥�
:: ������ ᮮ�饭�� �� �訡��� � ��⥬��� ��ୠ�� �訡�� ��������  �����
:: 22 ������. ����� ����� �����⭠ ��� ࠧ���쭮� ����࠭�⢮ ����.

:Finish
