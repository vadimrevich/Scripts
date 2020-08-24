@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set PROGRAM_NAME=Scripts

set KEY=%~1
if defined SFXCMD set SFXCMD=%SFXCMD:*.exe=%
if defined SFXCMD set SFXCMD=%SFXCMD:"=%
if defined SFXCMD set    KEY=%SFXCMD: =%
if defined KEY    set    KEY=%KEY:/=-%

if /I "%KEY%"=="-sfx" goto MakeSFX

:UnInstall
schtasks.exe>nul 2>nul /F /DELETE /TN "Admin_Scripts"
call        >nul 2>nul "%~dp0Files\CheckMemberOfDomain.bat" || (
  reg.exe   >nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Safer\CodeIdentifiers" /F
  reg.exe   >nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\Disallowed\Certificates" /F
  reg.exe   >nul 2>nul delete "HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /F
)
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\Tasks\Admin_Scripts.job"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\user-guide-ASS01.pdf"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\user-guide-ASS01.html"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\descript.ion"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\sed.exe"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\*.bat"
del         >nul 2>nul /A /F /Q "%SYSTEMROOT%\*.hta"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\un_*.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\un_*.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\dd.dll"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\contig.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\ddriverc.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\disknum.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\hidec.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\hs_color.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\hs_echo.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\nircmd.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\regjump.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\psx.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\usbitcmd.exe"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\svc_known.txt"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\scregedit.wsf"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\ospp.vbs"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\ospp.htm"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\nircmd.chm"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\hvremote.wsf"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\actwinxp.vbs"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\RestoreAllGPOs.wsf"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\RenewTray.vbs"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\Lib_CommonGPMCFunctions.js"
del         >nul 2>nul /A /F /A "%SYSTEMROOT%\SYSTEM32\BackupAllGPOs.wsf"
rmdir       >nul 2>nul /S /Q    "%SYSTEMROOT%\REGFILES"
if /I "%KEY%"=="-u" goto Finish

:Install
xcopy.exe   >nul 2>nul /C /H /I /R /S /Y /Z "%~dp0Files" "%SYSTEMROOT%"
for /F "tokens=1,2,*" %%i in ('reg.exe 2^>nul query "HKU"') do (
  reg.exe   >nul 2>nul add "%%~i\Software\Sysinternals\C"       /V "EulaAccepted" /T REG_DWORD /D "1" /F
  reg.exe   >nul 2>nul add "%%~i\Software\Sysinternals\PSExec"  /V "EulaAccepted" /T REG_DWORD /D "1" /F
  reg.exe   >nul 2>nul add "%%~i\Software\Sysinternals\Regjump" /V "EulaAccepted" /T REG_DWORD /D "1" /F
)
call        >nul 2>nul "%~dp0Files\CheckMemberOfDomain.bat" || (
  reg.exe   >nul 2>nul import "%~dp0Files\REGFILES\SRP.reg"
  reg.exe   >nul 2>nul import "%~dp0Files\REGFILES\DisallowedCerts.reg"
  reg.exe   >nul 2>nul import "%~dp0Files\REGFILES\TrustedPublisherCerts.reg"
)
rem schtasks.exe     2>&1  /CREATE /TN "Admin_Scripts" /SC "DAILY" /ST "12:10:00" /TR "ApplySettingsProfile.bat" /RU "SYSTEM" /RL "HIGHEST" /F|findstr.exe>nul 2>nul /I "�ᯥ譮 successfully" && goto Finish
rem schtasks.exe>nul 2>nul /CREATE /TN "Admin_Scripts" /SC "DAILY" /ST "12:10:00" /TR "ApplySettingsProfile.bat" /RU "SYSTEM"
goto Finish

:MakeSFX
setlocal
cd /D "%~dp0"
del>nul 2>nul /A /F /Q "..\%PROGRAM_NAME%.exe"
echo> "%TEMP%\makesfx.cfg" Path=%%TEMP%%\%PROGRAM_NAME%
echo>>"%TEMP%\makesfx.cfg" Overwrite=1
echo>>"%TEMP%\makesfx.cfg" Silent=1
echo>>"%TEMP%\makesfx.cfg" Setup=Files\hidec.exe "%%COMSPEC%%" /C "install.bat %%~1 & ping.exe 127.0.0.1 -n 11 & cd .. && rmdir /S /Q "%%TEMP%%\%PROGRAM_NAME%""
if defined PROGRAM_ICON set PROGRAM_ICON=-iicon"Files\%PROGRAM_ICON%"
start /wait winrar a %PROGRAM_ICON% -z"%TEMP%\makesfx.cfg" -cfg- -ep1 -dh -s -r -m5 -sfx -kb -t "..\%PROGRAM_NAME%.exe" *
del>nul 2>nul /A /F /Q "%TEMP%\makesfx.cfg"
endlocal
goto Finish

:Finish
