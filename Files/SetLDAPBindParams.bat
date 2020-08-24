@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set LDAP BIND command request settings
set USAGE=default/sasl

if /I "%~1"=="DEFAULT" (
  call :Set_LDAP_Bind_Default
  goto Finish
)
if /I "%~1"=="SASL" (
  call :Set_LDAP_Bind_SASL
  goto Finish
)
exit /B 255


:Set_LDAP_Bind_Default
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" /V "LdapServerIntegrity" /T REG_DWORD /D "1" /F && (
  call EchoSucc Set LDAP BIND command request settings: "Default"
  exit /B 0
)
call EchoFail Set LDAP BIND command request settings: "Default"
if /I "%DEBUG%"=="YES" reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" /V "LdapServerIntegrity" /T REG_DWORD /D "1" /F
exit /B 1

:Set_LDAP_Bind_SASL
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" /V "LdapServerIntegrity" /T REG_DWORD /D "2" /F && (
  call EchoSucc Set LDAP BIND command request settings: "SASL"
  exit /B 0
)
call EchoFail Set LDAP BIND command request settings: "SASL"
if /I "%DEBUG%"=="YES" reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" /V "LdapServerIntegrity" /T REG_DWORD /D "2" /F
exit /B 1

:: LDAP BIND command request settings
::
::    ������᭮���  �ࢥ�  ��⠫����   �����   ����⢥���   �������,   �᫨
:: ����ந�� ��� �� �⪫������ �ਢ燐� SASL (ᮣ��ᮢ����, Kerberos, NTLM  ���
:: �롮ઠ), ����� �� ����訢��� ������ (�஢�ન  楫��⭮��)  �  ������
:: �ਢ燐� LDAP, ����� �믮�������  ���  ������祭��  LDAP  �  ������  (��
:: ����஢���� SSL/TLS) ⥪�⮬. ���� �᫨ ���� �� �����⮢  ⠪��  �ਢ離�
:: �� �ᯮ����, ����ன�� �ࢥ�  ��  ��  �⪫������  ���蠥�  ������᭮���
:: �ࢥ�.
::    �ࠧ� ��᫥ ��⠭���� �������� �㦡 Active Directory  �������  �������
:: ����� �����뢠�� �� �������ᠭ�� �ਢ離� SASL ��� ����� �ਢ離�  LDAP
:: ��� ������祭�� ��� SSL/TLS � ����� ������� ࠡ����, �᫨  �㤥�  ᤥ����
:: ᫥���饥 ��������� ���䨣��樨. �⮡� ������  ����  �����⮢,  �  ������
:: �������  ⠪��  �ਢ離�,  �ࢥ�  ��⠫����  ����  ࠧ  �����  24  ��
:: ॣ������� �⮣���� ᮡ�⨥, 㪠�뢠�饥 ��  �,  ᪮�쪮  ⠪��  �ਢ燐�
:: �ந��諮.  ������������  ����ந��  ⠪��  �������  ⠪,  �⮡�   ���   ��
:: �ᯮ�짮���� �� �ਢ離�. ��� ⮫쪮 ᮮ⢥�����騥 ᮡ��� �  �����  2887
:: ����⠭�� ॣ����஢����� � �祭�� �����筮  �த����⥫쭮��  ��ਮ��,
:: ४��������� ����ந�� �ࢥ� �� �⪫������ ⠪�� �ਢ燐�. �� 㬮�砭��  �
:: ��ୠ��    ᮡ�⨩    �����    ����    ��୨���     �     ᮡ�⨥�     2886
:: "ActiveDirectory_DomainService".  ���  �襭��  ������  �஡����  ����室���
:: ������� �ॡ������ ��஢�� ������ ���  LDAP-�ࢥ�.  ��  �����  ᤥ����
:: ���� ��⮤���: �� ����� ��⥬���� ॥���, � ⠪�� �  �������  ��㯯����
:: ����⨪.
::
:: 1. ���⥬�� ॥���:
::
:: [HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesNTDSParameters]
:: "LDAPServerIntegrity"=dword:00000001 (Default)
:: "LDAPServerIntegrity"=dword:00000002 (SASL)
::
:: 2. ��㯯��� ����⨪�:
::
:: ��ࠬ���:
::   ���䨣���� ��������
::     ����⨪�
::       ���䨣���� Windows
::         ��ࠬ���� ������᭮��
::           ������� ����⨪�/��ࠬ���� ������᭮��
::             ����஫��� ������: �ॡ������ ��஢�� ������ ��� LDAP-�ࢥ�.
:: ���祭�� ��ࠬ���:
::   ���                        - "LDAPServerIntegrity"=dword:00000001
::   �ॡ���� ��஢�� ������� - "LDAPServerIntegrity"=dword:00000002

:Finish
