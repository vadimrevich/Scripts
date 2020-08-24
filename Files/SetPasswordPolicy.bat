@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Set password policy
set USAGE=

call :Set_Password_Policy
goto Finish


:Set_Password_Policy
set DELETE_REG_ENTRY_ERROR=NO

::    ��⠭����  �������쭮�  �����  ��஫�.  ��  ���������   ��   ���ࠣ�����
:: �������騥 ��஫�, � ���������� ⮫쪮 �� ���� ��� ������ �����.  ���:
:: REG_BINARY; ���祭��: �� �����⨬�� (�� 㬮�砭�� ��ࠬ��� ���)
call>nul DeleteRegEntry "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Network" "MinPwdLen"

::    ��� ��ࠬ��� ��।����, �㤥� �� Windows  �ॡ�����  ��䠢�⭮-��஢��
:: ��஫�, � ���� ��஫�, ᮧ����� �� �������権 �㪢 (�, �,  �...)  �  �ᥫ
:: (1,2,3...) ���: REGD_WORD;  ���祭��:  1 - �ॡ����� (�� 㬮�砭�� ��ࠬ���
:: ���)
call>nul DeleteRegEntry "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Network" "AlphanumPwds"

if /I "%DELETE_REG_ENTRY_ERROR%"=="YES" goto Set_Password_Policy_Fail

::    ���epa�⨢�� �xo� � c�c�e��: �a�o���a�� �o��o�a�e�� o� �c�e�e��� cpo�a
:: �e�c⢨� �apo�� �apa�ee. ��।����, �� ����� ������⢮ ����, ��  ���祭��
:: �ப�  ��஫�  ���짮��⥫�,  �⮡ࠧ����  �।�०���饥  ᮮ�饭��.  ���:
:: REG_DWORD; ���祭��: �� �����⨬�� (�� 㬮�砭�� 14). �����쭠�  ����⨪�
:: ������᭮�� > �o�a���e �o��⨪� > �apa�e�p� �e�o�ac�oc�
reg.exe>nul 2>nul add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /V "PasswordExpiryWarning" /T REG_DWORD /D "14" /F || goto Set_Password_Policy_Fail

::   ��������  ��  �㤥�  ������  ��஫�  ᢮��  ��⥬���  ��⭮�   �����.
:: ���⢥��⢥���, �� �� "�뫥��" �� ������, ����  �᫨  ��  ���  ��  ����砫�
:: ��᪮�쪮 ���, ��� �ਬ����� ���� ᭨��� ���ﭨ� ��⥬�.
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /V "DisablePasswordChange" /T REG_DWORD /D "1" /F || goto Set_Password_Policy_Fail

::    ��e�  �o�e�a:  �a�c��a���  cpo�   �e�c⢨�   �apo��   ��e��x   �a��ce�
:: �o�����epa. �����쭠� ����⨪� ������᭮�� > �o�a���e �o��⨪� > �apa�e�p�
:: �e�o�ac�oc�. ���: REG_DWORD; ���祭��: 1 - 1000000 (�� 㬮�砭�� 30 ����)
reg.exe>nul 2>nul add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /V "MaximumPasswordAge" /T REG_DWORD /D "1000000" /F || goto Set_Password_Policy_Fail
net.exe>nul 2>nul accounts /MAXPWAGE:UNLIMITED                                                                                          || goto Set_Password_Policy_Fail
call EchoSucc Set password policy
exit /B 0
:Set_Password_Policy_Fail
call EchoFail Set password policy
if /I "%DEBUG%"=="YES" (
  reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Network" /V "MinPwdLen" /F
  reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Network" /V "AlphanumPwds" /F
  reg.exe add    "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"      /V "PasswordExpiryWarning" /T REG_DWORD /D "14"      /F
  reg.exe add    "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"      /V "DisablePasswordChange" /T REG_DWORD /D "1"       /F
  reg.exe add    "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"      /V "MaximumPasswordAge"    /T REG_DWORD /D "1000000" /F
  net.exe accounts /MAXPWAGE:UNLIMITED
)
exit /B 1

:Finish
