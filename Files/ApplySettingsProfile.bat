@echo off
set PATH=%SystemRoot%\SYSTEM32;%SystemRoot%;%SystemRoot%\SYSTEM32\WBEM;

set  HELP=Apply settings profile
set USAGE=[home/work]

call :Set_Profile "%~1"
goto :EoF


:Set_Profile
:: *** Set variable OS_CORE ***
set OS_CORE=
call CheckOSType|%SystemRoot%\System32\find.exe>nul 2>nul /I "Core" && set OS_CORE=YES

:: *** Set variable OS_SERVER ***
set OS_SERVER=
call CheckOSType|%SystemRoot%\System32\find.exe>nul 2>nul /I "Server" && set OS_SERVER=YES

:: *** Set variable OS_WINXP ***
set OS_WINXP=
call CheckOSType|%SystemRoot%\System32\find.exe>nul 2>nul /I "Windows XP" && set OS_WINXP=YES

:: *** Set variable OS_WIN8 ***
set OS_WIN8=
call CheckOSType|%SystemRoot%\System32\find.exe>nul 2>nul /I "Windows 8" && set OS_WIN8=YES

:: *** Set variable OS_PROFILE ***
set OS_PROFILE=WORK
if /I "%~1"==""  if exist "%SystemRoot%\osprofile.txt" set /P OS_PROFILE=<"%SystemRoot%\osprofile.txt"
if /I "%~1"=="HOME"        set OS_PROFILE=HOME
if /I "%OS_SERVER%"=="YES" set OS_PROFILE=WORK
echo>"%SystemRoot%\osprofile.txt" %OS_PROFILE%

:: *** Set variable SVC_SPOOLER ***
::set SVC_SPOOLER=
::call ShowPrinters "Real"|%SystemRoot%\System32\find.exe>nul 2>nul /I """" && set SVC_SPOOLER=YES
::if /I "%OS_PROFILE%"=="WORK"                           set SVC_SPOOLER=YES

:: *** Begin ***
call EchoTitl Apply settings profile "%OS_PROFILE%"

:: *** Services ***
                                         call Svc Disable "2GISUpdateService"
                                         call Svc Disable "4game-service"
                                         call Svc Disable "AdAppMgrSvc"
                                         call Svc Disable "AdobeARMservice"
                                         call Svc Disable "AdobeFlashPlayerUpdateSvc"
                                         call Svc Auto    "ADWS"
                                         call Svc Demand  "AppIDSvc"
                                         call Svc Demand  "AppMgmt"
                                         call Svc Disable "Application Updater"
                                         call Svc Demand  "AeLookupSvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "Alerter"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "Alerter"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "ALG"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "ALG"
                                         call Svc Disable "AMD External Events Utility"
                                         call Svc Disable "AnviCsbSvc"
                                         call Svc Demand  "AppInfo"
                                         call Svc Demand  "Apple Mobile Device"
                                         call Svc Disable "aspnet_state"
                                         call Svc Disable "ATI External Events Utility"
if /I "%OS_SERVER%"==""                  call Svc Auto    "AudioSrv"
if /I "%OS_SERVER%"=="YES"               call Svc Disable "AudioSrv"
                                         call Svc Disable "BaiduHips"
                                         call Svc Disable "BBSvc"
                                         call Svc Disable "BBUpdate"
                                         call Svc Disable "bckd"
                                         call Svc Disable "bckwfs"
                                         call Svc Disable "BCUService"
                                         call Svc Disable "bd0001"
                                         call Svc Disable "bd0002"
                                         call Svc Disable "bd0003"
                                         call Svc Disable "bd0004"
                                         call Svc Disable "BDArKit"
                                         call Svc Disable "BDDefence"
                                         call Svc Disable "BDSafeBrowser"
                                         call Svc Disable "BDSGRTP"
                                         call Svc Disable "BDKVRTP"
                                         call Svc Disable "BDMNetMon"
                                         call Svc Disable "BDMRTP"
                                         call Svc Disable "BDMWrench"
                                         call Svc Disable "BDMWrench_x64"
                                         call Svc Demand  "BITS"
                                         call Svc Demand  "Bonjour Service"
if /I "%OS_CORE%"=="YES"                 call Svc Disable "CcmExec"
                                         call Svc Disable "Changer"
                                         call Svc Disable "CiSvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "ClipSrv"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "ClipSrv"
                                         call Svc Disable "clr_optimization_v2.0.50727"
                                         call Svc Disable "clr_optimization_v2.0.50727_32"
                                         call Svc Disable "clr_optimization_v2.0.50727_64"
                                         call Svc Disable "clr_optimization_v4.0.30319_32"
                                         call Svc Disable "clr_optimization_v4.0.30319_64"
                                         call Svc Disable "CltMngSvc"
if /I "%OS_CORE%"=="YES"                 call Svc Disable "CmRcService"
                                         call Svc Disable "Com4QLBEx"
                                         call Svc Disable "comyninu"
                                         call Svc Disable "ContentDefender"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "CryptSvc"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "CryptSvc"
                                         call Svc Auto    "CscService"
                                         call Svc Demand  "defragsvc"
                                         call Svc Auto    "DcomLaunch"
                                         call Svc Auto    "Dhcp"
                                         call Svc Auto    "dmserver"
                                         call Svc Auto    "Dnscache"
                                         call Svc Auto    "DPS"
                                         call Svc Disable "DWMRCS"
                                         call Svc Disable "ehSched"
                                         call Svc Disable "ERSvc"
                                         call Svc Disable "ES lite Service"
                                         call Svc Auto    "eventlog"
                                         call Svc Auto    "EventSystem"
                                         call Svc Disable "FastUserSwitchingCompatibility"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "Fax"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "Fax"
                                         call Svc Demand  "FontCache"
                                         call Svc Disable "FontCache3.0.0.0"
                                         call Svc Disable "gopibeko"
                                         call Svc Auto    "gpsvc"
                                         call Svc Disable "Guard.Mail.ru"
                                         call Svc Disable "gupdate"
                                         call Svc Disable "gupdatem"
                                         call Svc Disable "gusvc"
                                         call Svc Disable "HelpSvc"
if /I "%OS_SERVER%"==""                  call Svc Demand  "HidServ"
if /I "%OS_SERVER%"=="YES"               call Svc Disable "HidServ"
                                         call Svc Disable "HomeGroupListener"
                                         call Svc Disable "HomeGroupProvider"
                                         call Svc Auto    "HPSIService"
                                         call Svc Disable "HWDeviceService.exe"
                                         call Svc Disable "hyverumu"
                                         call Svc Disable "i2omgmt"
                                         call Svc Disable "IAANTMON"
                                         call Svc Disable "ICQ Service"
                                         call Svc Disable "IHProtect Service"
                                         call Svc Disable "idsvc"
                                         call Svc Demand  "igfxCUIService1.0.0.0"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "ImapiService"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "ImapiService"
                                         call Svc Disable "Intel(R) Capability Licensing Service Interface"
                                         call Svc Disable "iPod Service"
                                         call Svc Disable "JavaQuickStarterService"
                                         call Svc Disable "jhi_service"
                                         call Svc Disable "jizirexy"
                                         call Svc Auto    "LanmanServer"
                                         call Svc Auto    "LanmanWorkstation"
                                         call Svc Disable "lbrtfdc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "lmhosts"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "lmhosts"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "lpasvc"
if /I "%OS_PROFILE%%OS_CORE%"=="WORKYES" call Svc Disable "lpasvc"
if /I "%OS_PROFILE%%OS_CORE%"=="WORK"    call Svc Demand  "lpasvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "lppsvc"
if /I "%OS_PROFILE%%OS_CORE%"=="WORKYES" call Svc Disable "lppsvc"
if /I "%OS_PROFILE%%OS_CORE%"=="WORK"    call Svc Demand  "lppsvc"
                                         call Svc Disable "McComponentHostService"
                                         call Svc Disable "MDM"
                                         call Svc Disable "MegaFon Modem. RunOuc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "Messenger"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "Messenger"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "Microsoft SharePoint Workspace Audit Service"
                                         call Svc Disable "mnmsrvc"
                                         call Svc Disable "MozillaMaintenance"
                                         call Svc Disable "MPCKpt"
                                         call Svc Disable "MPCProtectService"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "MpsSvc"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "MpsSvc"
                                         call Svc Demand  "MSDTC"
                                         call Svc Demand  "msiserver"
                                         call Svc Disable "napagent"
                                         call Svc Disable "NAUpdate"
                                         call Svc Auto    "NetDDE"
                                         call Svc Demand  "Netman"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "Netlogon"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "Netlogon"
                                         call Svc Demand  "NisSrv"
                                         call Svc Auto    "Nla"
                                         call Svc Auto    "NlaSvc"
                                         call Svc Disable "NvStreamSvc"
                                         call Svc Demand  "NVSvc"
                                         call Svc Disable "nvUpdatusService"
                                         call Svc Demand  "ose"
                                         call Svc Demand  "osppsvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "p2psvc"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "p2psvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "p2pimsvc"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "p2pimsvc"
                                         call Svc Disable "PCIDump"
                                         call Svc Disable "PDCOMP"
                                         call Svc Disable "PDFRAME"
                                         call Svc Disable "PDRELI"
                                         call Svc Disable "PDRFRAME"
                                         call Svc Disable "PicexaService"
                                         call Svc Demand  "pla"
                                         call Svc Auto    "PlugPlay"
                                         call Svc Disable "PnkBstrA"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "PolicyAgent"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "PolicyAgent"
if /I "%OS_CORE%"==""                    call Svc Demand  "ProtectedStorage"
if /I "%OS_CORE%"=="YES"                 call Svc Disable "ProtectedStorage"
                                         call Svc Disable "QipGuard"
                                         call Svc Disable "qrnfd_1_10_0_12"
                                         call Svc Demand  "RapiMgr"
                                         call Svc Demand  "RasAuto"
                                         call Svc Demand  "RasMan"
                                         call Svc Demand  "RpcLocator"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "RemoteRegistry"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "RemoteRegistry"
                                         call Svc Disable "ROMService_Support"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "SamSs"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "SamSs"
                                         call Svc Auto    "SCardSvr"
                                         call Svc Auto    "Schedule"
                                         call Svc Demand  "SDRSVC"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "SecLogon"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "SecLogon"
                                         call Svc Auto    "SENS"
                                         call Svc Demand  "SensrSvc"
                                         call Svc Disable "servervo"
                                         call Svc Disable "SharedAccess"
                                         call Svc Auto    "ShellHWDetection"
                                         call Svc Disable "SkypeUpdate"
if /I "%OS_CORE%"=="YES"                 call Svc Disable "smstsmgr"
                                         call Svc Auto    "Spooler"
                                         call Svc Auto    "srservice"
                                         call Svc Demand  "Srv"
                                         call Svc Disable "STacSV"
                                         call Svc Auto    "stisvc"
                                         call Svc Demand  "SSDPSRV"
                                         call Svc Disable "SSUService"
                                         call Svc Disable "Stereo Service"
                                         call Svc Disable "SynTPEnhService"
                                         call Svc Demand  "TapiSrv"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "TermService"
if /I "%OS_PROFILE%"=="WORK"             call Svc Demand  "TermService"
                                         call Svc Auto    "Themes"
                                         call Svc Disable "TrkWks"
                                         call Svc Demand  "TrustedInstaller"
                                         call Svc Disable "UALSVC"
                                         call Svc Disable "UFDSVC"
                                         call Svc Disable "UI0Detect"
                                         call Svc Disable "UPHClean"
if /I "%OS_SERVER%"==""                  call Svc Demand  "upnphost"
if /I "%OS_SERVER%"=="YES"               call Svc Disable "upnphost"
                                         call Svc Disable "UserAccess"
                                         call Svc Demand  "w32time"
                                         call Svc Demand  "WcesComm"
                                         call Svc Disable "WDICA"
                                         call Svc Demand  "WdiSystemHost"
                                         call Svc Demand  "WebClient"
                                         call Svc Disable "VIAKaraokeService"
                                         call Svc Demand  "WinHttpAutoProxySvc"
                                         call Svc Auto    "Winmgmt"
if /I "%OS_SERVER%"==""                  call Svc Disable "WinRM"
if /I "%OS_SERVER%"=="YES"               call Svc Auto    "WinRM"
                                         call Svc Disable "WLTRYSVC"
                                         call Svc Disable "WmdmPMSN"
                                         call Svc Demand  "wmiApSrv"
                                         call Svc Disable "WMPNetworkSvc"
                                         call Svc Disable "WPCSvc"
                                         call Svc Demand  "WPDBusEnum"
                                         call Svc Disable "WPFFontCache_v0400"
                                         call Svc Disable "wscsvc"
if /I "%OS_PROFILE%"=="HOME"             call Svc Disable "WSearch"
if /I "%OS_PROFILE%"=="WORK"             call Svc Auto    "WSearch"
                                         call Svc Disable "vToolbarUpdater10.2.0"
                                         call Svc Disable "wsasvc_1.10.0.19"
                                         call Svc Demand  "wuauserv"
                                         call Svc Auto    "WZCSVC"
                                         call Svc Disable "xohisiwe"

:: *** RDP ***
if /I "%OS_PROFILE%"=="HOME"             call RDP "Disable"
if /I "%OS_PROFILE%"=="WORK"             call RDP "Enable"

:: *** Remote Access To PnP ***
if /I "%OS_PROFILE%"=="WORK"             call RemoteAccessToPnP "Enable"

:: *** Network Power Management ***
if /I "%OS_SERVER%"=="YES"               call NetPowerManagement "Disable"

:: *** Short File Names ***
if /I "%OS_SERVER%"=="YES"               call ShortFileNames "Disable"

:: *** Enable Windows XPx32 security updates ***
::if /I "%OS_WINXP%"=="YES"              call WinXPx32SecurityUpdates "Enable"

:: *** Set Timeout For LAN ***
if /I "%OS_PROFILE%"=="WORK"             call SetTimeoutForLAN "5"

:: *** Features ***
::call Feature Disable "InboxGames"
call Feature Disable "WindowsGadgetPlatform"
call Feature Enable  "TelnetClient"
if /I "%OS_CORE%"=="YES" (
  :: ��� �����প� 32-����� �ਫ������
  call Feature Enable "ServerCore-WOW64"
  :: ��� �����প� 32-����� .NET-�ਫ������
  call Feature Enable "NetFx2-ServerCore"
  call Feature Enable "NetFx3-ServerCore"
)
call Feature Enable "NetFx3"
:: *** Server settings ***
if /I "%OS_PROFILE%"=="WORK" (
  call>nul CheckDC                              && call :Is_DC
  call>nul Feature Check "DNS-Server-Full-Role" && call :Is_DNSServer
  call>nul Feature Check "DNS-Server-Core-Role" && call :Is_DNSServer
  call>nul TaskBackupDHCP "Delete"
  call>nul Feature Check "DHCPServer"           && call :Is_DHCPServer
  call>nul Feature Check "DHCPServerCore"       && call :Is_DHCPServer
  call Firewall "Disable"
)

:: *** Common Settings ***
call EnableRegEdit
call ImportProxySettingsFromIE
call IP6 "Disable"
call Hibernation "Disable"
call USBDevOnSoftRemove "Disable"
call DisableAutorunDrives
call DisableGWX
call CAD "Disable"
call ThumbCache "Disable"
call Thumbs "Enable"
call MobilityCenter "Enable"
call Account Delete "UpdatusUser"
call Account Activate "Administrator"
call CachingWDigest "Disable"
call LSASSProtection "Enable"
::call SetSRPPolicy "Unrestricted"
call SetUACPolicy "Enable"
call SetPasswordPolicy
call SetAttachManagerPolicy
call SetTCPIPParams
call SetIEParams
call SetTaskbarParams
call SetDesktopParams
call SetExplorerParams
call SetMenuParams
call SetBootParams
::call SetLayoutEn
call SetToggleCS
call SetNumLock "Off"
call SetTimeSyncParams
call SyncTime
::call RepairMSI
call RepairVBS
call RepairIcons
call CleanSoft
call CleanProcesses
call CleanFiles
call CleanHosts
call CleanRegistry
call CleanTasks
call CleanTemp
exit /B


:Is_DC
call CCM "Remove"
call SIADebugTracing "Disable"
call NetVisibility "Disable"
call StopReplicationOnAutoRecovery "Disable"
call SetLDAPBindParams "Default"
call Account Make       "DHCPDNSupd" "mEsIBynXb7OPwy"
call AddUserToDNSAdmins "DHCPDNSupd"
exit /B

:Is_DNSServer
if /I "%IS_DNSServer%"=="YES" exit /B
set IS_DNSServer=YES
call SetDNSServerParams
exit /B

:Is_DHCPServer
if /I "%IS_DHCPServer%"=="YES" exit /B
set IS_DHCPServer=YES
call SetDHCPDNSCredentials
call TaskBackupDHCP "Add"
exit /B


:: ����ன�� �㦡 � windows 7 - http://w7q.ru/sluzhbyi-v-windows-7/

:: 2GISUpdateService
:: ��㦡� ��� ���������� �� ��� �㡫새�.

:: 4game-service
:: Responsible for installing, updating, repairing and uninstalling 4Game
:: software.

:: AdAppMgrSvc
:: Autodesk Application Manager
:: %Program Files(x86)%\Common Files\Autodesk Shared\AppManager\R1\AdAppMgrSvc.exe

:: AdobeARMservice
:: Adobe Acrobat Update Service (��㦡� ���������� Adobe Acrobat)
:: �।�⢮ ���������� Adobe Acrobat ���ᯥ稢��� ����㧪� � ��⠭����
:: ���㠫��� ���������� �ணࠬ��.

:: AdobeFlashPlayerUpdateSvc (��㦡� ���������� Adobe Flash Player)
:: Adobe Flash Player Update Service
:: �����ন���� ���㠫쭮��� ��⠭���� Adobe Flash Player � ������� ��᫥����
:: ���襭�� � ��ࠢ����� ��⥬� ������᭮��.

:: ADWS
:: Active Directory Web Services (���-�㦡� Active Directory)
:: �� �㦡� �।��⠢��� ����䥩� ���-�㦡� ��� ������஢ �㦡�
:: ��⠫���� (AD DS � AD LDS), ����� �믮������� �� �ࢥ� �����쭮. �᫨
:: �� �㦡� ��⠭������ ��� �⪫�祭�, ������᪨� �ਫ������, ���ਬ��,
:: Active Directory PowerShell, �� �।��⠢������ ���������� ����㯠 �
:: ������ࠬ �㦡� ��⠫����, ����� �믮������� �� �ࢥ� �����쭮, ���
:: �ࠢ����� ���.

:: aksfridge
:: Sentinel Fridge
:: SafeNet Inc. Sentinel Ancillary Function Driver
:: �ࠩ���: %SystemRoot%\System32\drivers\aksfridge.sys. ����� ��뢠�� BSOD.

:: AppIDSvc
:: Application Identity (����⮢�७�� �ਫ������)
:: ��।���� � �஢���� 㤮�⮢�७�� �ਫ������. �⪫�祭�� ������ �㦡�
:: ������ ���������� �ਭ㤨⥫쭮� �ਬ������ ����⨪� AppLocker.
:: ����������: AppLocker ࠡ�⠥� ⮫쪮 �� ������ Windows 7 ���ᨬ��쭠� �
:: ��௮�⨢���. � �� ��⠫��� ������ - ���.

:: AppMgmt
:: Application Management (��ࠢ����� �ਫ�����ﬨ)
:: ��ࠡ�⪠ ����ᮢ �� ��⠭����, 㤠����� � ����஥��� ᯨ᪮� ��� �ணࠬ�,
:: ��⠭�������� �१ ��㯯���� ����⨪�. �� �⪫�祭�� �⮩ �㦡�
:: ���짮��⥫� �� ᬮ��� ��⠭��������, 㤠���� � ᮧ������ ᯨ᪨ �ணࠬ�,
:: ��⠭�������� �१ ��㯯���� ����⨪�.

:: Alerter
:: Alerter (������⥫�)
:: ���뫠�� ��࠭�� ���짮��⥫� � �������ࠬ ���������⨢�� �����饭��.
:: �᫨ �㦡� ��⠭������, �ணࠬ��, �ᯮ������ ���������⨢�� �����饭��
:: �� �� ������. �� ������ �᫮���� �� �㦡� �� �㦭�.

:: ALG
:: Application Layer Gateway Service (��㦡� � �஢�� �ਫ������)
:: ����뢠�� �����প� ��⮪���� ���쥩 ��஭� ��⮪���� PnP ��� ��饣�
:: ����㯠 � ������祭�� � ���୥�� � ������祭�� � ���୥�� � �ᯮ�짮������
:: �࠭������. �� �㦡� �㦭� �� �ᯮ�짮����� �࠭������ ���୥�/��饣�
:: ����㯠 � ���୥�� ��� ������祭�� � ��. ��㦡� �������� ����� 1.5 Mb �
:: ����⨢��� �����. � ���� ��� �� ����� �⪫���� ��� �㦡�.

:: AMD External Events Utility
:: ATI External Events Utility
:: %SystemRoot%\SYSTEM32\atiesrxx.exe
:: ��㦡� AMD/ATI External Events Utility �⢥砥� �� ᡮ� � ��ࠡ��� ���譨�
:: ᮡ�⨩. ����� �ࢨ� ⠪�� �⢥砥� �� ����祥 ������祭��, � �筥�
:: ��।������ ����� �����஢. �᫨ �� �㤥� �몫�祭, � �� ����⪥
:: ���ᮥ������ �������⥫�� ��ᯫ��, �ࠩ��� ��� ������� �� 㢨���,
:: ���ॡ���� ��१���㧪� ��⥬�.
:: ��� ࠭�� � Windows XP �� �㦡� ���뢠���� ATI Hotkey Poller.

:: AnviCsbSvc
:: Anvi Cloud System Booster Speed Service

:: AppInfo
:: Application Information (�������� � �ਫ������)
:: ���ᯥ稢��� �믮������ ���ࠪ⨢��� �ਫ������ � �������⥫�묨
:: ���������⨢�묨 �ਢ�����ﬨ. �᫨ �� �㦡� �㤥� ��⠭������,
:: ���짮��⥫� �� ᬮ��� ����᪠�� �ਫ������ � �������⥫�묨
:: ���������⨢�묨 �ਢ�����ﬨ, ����� ����� ���ॡ������� ��� �믮������
:: �㦭�� ���짮��⥫�᪨� �������. ����� ����᪠ �� 㬮�砭��: ������.

:: Apple Mobile Device
:: ��ࢨ� ��� ������祭�� ���ன�� Apple, ��⠭���������� ����� � iTunes.

:: Application Updater
:: �㩭� �����-�.

:: aspnet_state
:: ASP.NET State Service
:: Provides support for out-of-process session states for ASP.NET. If this
:: service is stopped, out-of-process requests will not be processed. If this
:: service is disabled, any services that explicitly depend on it will fail to
:: start.

:: AudioSrv
:: Windows Audio (����� �㤨� Windows)
:: ��ࠢ����� ��㪮�묨 ���ன�⢠�� ��� Windows-�ணࠬ�. �᫨ �� �㦡�
:: ��⠭������, ��㪮�� ���ன�⢠ � ��䥪�� �� ���� ࠡ���� ������
:: ��ࠧ��. �� �㦡� ����室��� ��� ���ந�������� ������ ��㪠. �⪫����
:: ����� ⮫쪮 �� ������⢨� ��㪮��� �����, ���� �� �� �㤥� ����� ��㪨
:: �����.

:: BBSvc
:: BBUpdate
:: BingBar Toolbar

:: bckd
:: bckwfs
:: K9 Web Protection
:: ����⥫�᪨� ����஫� � ��࠭�祭�� ���짮��⥫�� �� ������⥫쭮��
:: ���⥭�.

:: BCUService
:: Browser Configuration Utility
:: ������-���᪮��� ��� ��㧥஢, �⠢���� � �ࠩ��ࠬ� �� ���ਭ��� �����.

:: BaiduHips
:: bd0001
:: bd0002
:: bd0003
:: BDKVRTP
:: BDMNetMon
:: BDMRTP
:: BDMWrench
:: Baidu Trojan

:: BITS
:: Background Intelligent Transfer Service (������� ��⥫����㠫쭠� �㦡�
:: ��।��)

:: Bonjour Service
:: �������� ��⮬���᪨ �����㦨���� � ࠡ���� � �⥢묨 ���ன�⢠�� ���
:: �������⥫��� ����஥�.

:: CcmExec
:: ���� ����� SMS
:: ����� ������ Configuration Manager. �⢥砥� �� ��⠭���� ���������� �
:: ࠧ���� �ணࠬ��� �� �⥢�� ���������.

:: CiSvc
:: CiSvc (��㦡� ������஢����)
:: ��������� ᮤ�ন��� � ᢮��⢠ 䠩��� �� �����쭮� � 㤠����
:: ���������, ���ᯥ稢��� ������ ����� � 䠩��� � ������� ������� �몠
:: ����ᮢ.

:: ClipSrv
:: ClipSrv (��ࢥ� ����� ������)
:: �������� ��ᬠ�ਢ��� ��࠭��� ����� ������ 㤠���� �������஢. �᫨
:: �� �㦡� ��⠭������, �ணࠬ�� ��ᬮ�� ��࠭�� ����� ������ �� �����
:: ������������ ���ଠ樥� � 㤠��묨 �������ࠬ�. �᫨ �� �㦡�
:: �⪫�祭�, ��� �㦡�, ����� � ������� �� ���, �� ����� ����
:: ����饭�.

:: CltMngSvc
:: This service loads the Search Protector, which maintains your selected
:: Search settings, and enables auto-updates.

:: clr_optimization_v2.0.50727_32
:: clr_optimization_v2.0.50727_64
:: clr_optimization_v2.0.50727
:: .NET Runtime Optimization Service v2.0.50727_X86
:: Microsoft .NET Framework NGEN

:: CmRcService (����񭭮� �ࠢ����� Configuration Manager)
:: ����� ������ Configuration Manager. �������� ���ਧ������ ���짮��⥫�
:: 㤠�񭭮 �ࠢ���� ��⥬��.

:: Com4QLBEx
:: HP Quick Launch Buttons
:: Com4QLBEx is a part of the HP Quick Launch Buttons package which enables the
:: Quick Launch Buttons on the keyboard for easy control of various bezel
:: buttons such as volume, internal/external display, and mute on/off; HotKeys,
:: and Docked Events.

:: CryptSvc
:: Cryptographic Services (��㦡� �ਯ⮣�䨨)
:: �।��⠢��� �� �㦡� �ࠢ�����: �㦡� ��� ������ ��⠫���, �����
:: �஢���� ��஢� ������ 䠩��� Windows; �㦡� ���饭���� ����, �����
:: �������� � 㤠��� ���䨪��� ����७���� ���� 業�� ���䨪�樨 �
:: �⮣� ��������; � �㦡� ���祩, ����� �������� �������� ��� ��
:: ���䨪��� � �⮣� ��������. �᫨ �� �㦡� ��⠭������, �� �� �㦡�
:: �ࠢ����� �� ���� ࠡ����. �� ���, �� �㦡� �஢���� ������ 䠩���
:: Windows. ������ �� �� ࠢ�� ����� ������� ���誮 � �।�०������ �
:: �������ᠭ��� �ࠩ���. �� �㦡� ����室��� ��� ���������� Windows �
:: ��筮� � ��⮬���᪮� ०����, � ⠪�� ��� ���⠫��樨 Service Pack'�� �
:: DirectX 9.0. Windows Media Player � ������� .NET �ਫ������ �����
:: �ॡ����� ��� �㦡� ��� �㭪樮��஢���� �������� �㭪権. ��㦡� ��������
:: ����� 1.9 �� � ����⨢��� �����.

:: CscService
:: Offline Files (��⮭���� 䠩��)
:: ���ᯥ稢��� ࠧ���� �㭪樨 ���㦨����� ��� ��䫠�� 䠩���. ����設���
:: ���짮��⥫��, ࠡ����� �� ࠡ��� �⠭���, ��� �ࢨ� �� �㦥�.  ������
:: ���㬠�� ������, �०�� 祬 �⪫���� ��� �ࢨ� �� ����㪥. ��������,  �
:: ���쭥�襬 �� ��� �ਣ������. ��������㥬� ०�� ����᪠:  "��⮬���᪨",
:: ���� ���ࠢ��쭮 ࠡ���� NAS (WD MyBook Live).

:: defragsvc
:: Disk Defragmenter (���ࠣ������ ��᪠)
:: ��� ����᪠: ������.

:: DcomLaunch
:: DCOM Server Process Launcher (����� �ࢥ��� ����ᮢ DCOM)
:: Provides launch functionality for DCOM services

:: Dhcp
:: DHCP Client (DHCP-������)
:: ��ࠢ��� ���䨣��樥� �� ���।�⢮� ॣ����樨 � ���������� IP-���ᮢ
:: � DNS-����. �� �㦡� ��⮬���᪨ ����砥� ��� �������᪨� IP ���� ��
:: ��襣� DHCP �ࢥ� � DNS ����������. ����室��� ��� ISC (���୥� ������)
:: � � ��砥, �᫨ � ��� �ᯮ������ IPSEC. ����� ���� �⪫�祭� �� ��⥬��
:: � ����᪨� ip-���ᮬ. �ਬ�砭��: ����� �����, �� ������ DSL ���
:: ������� ������祭�� �ॡ��� ��� �㦡� ��� �।��⠢����� ����㯠 �
:: ���୥�. �᫨ �� �⪫��� ��� �㦡� � ��� ���୥� ᮥ������� ����⠭��
:: ࠡ����, � ��୨� ���祭�� � ��⮬���᪨.

:: dmserver
:: Logical Disk Manager (��ᯥ��� �����᪨� ��᪮�)
:: �����㦥��� � ������� �� ���묨 ���⪨�� ��᪠�� � ��।�� ���ଠ樨 �
:: ⮬�� ���⪨� ��᪮� �㦡� �ࠢ����� ��ᯥ��� �����᪨� ��᪮�. �᫨
:: �� �㦡� ��⠭������, ���ﭨ� �������᪨� ��᪮� � ���ଠ�� �
:: ���䨣��樨 ����� ��������� ���ॢ襩. �᫨ �� �㦡� �⪫�祭�, ���
:: �㦡�, ����� � ������� �� ���, �� ����� ���� ����饭�.

:: Dnscache
:: DNS Client (DNS-������)
:: ����蠥� ��� ������� �������� DNS-����� � ���� � ����頥� �� � ���.
:: �᫨ �㦡� ��⠭������, �� 㤠���� ࠧ���� DNS-����� � ࠧ������ �㦡�
:: ��⠫���� Active Directory ����஫��஢ ������. ������ �㦡� ����砥� �
:: ������ DNS ����� � 䭪樨 ����஫��� ������ Active Directory. ������, DNS
:: ������ ����室�� ��� IPSEC. �᫨ �� ��⠥��� "��ࠢ���" ��� �⥢��
:: ᮥ������� � ����砥� ���������� ����: "DNS resolver failed to flush the
:: cache", � ������ �㦡� ���� ��稭�� ������������� ������ �訡��.

:: DPS
:: Diagnostic Policy Service (��㦡� ����⨪� �������⨪�)

:: DWMRCS
:: DameWare Mini Remote Control
:: A component of the DameWare NT Utilities System Management Suite. The
:: DameWare Mini Remote Client Agent Service allows Administrators (or
:: authorized users) the ability to quickly provide Remote Assistance, by
:: interactively accessing the Desktop of a computer from a remote location.
:: Additional benefits include: Troubleshooting, Working from Home, System &
:: Application Configuration, Collaboration, or even Remote Instruction &
:: Teaching.

:: ehSched
:: Windows Media Center Scheduler Service (��㦡� �����஢騪� Windows Media
:: Center)
:: ��砫� � ��⠭���� ����� ⥫��ணࠬ� � Windows Media Center.

:: ERSvc
:: Error Reporting Service (��㦡� ॣ����樨 �訡��)
:: �������� ॣ����஢��� �訡�� ��� �㦡 � �ਫ������, �믮�������� �
:: ���⠭���⭮� �।�. �� ������������� �訡�� ��ࠢ��� ���ଠ�� ��
:: �訡�� � ��௮��� Microsoft. � ����, �� �� ����� ��� �����.
:: ������, �᫨ ��� ��⥬� ����ﭭ� "������", � ������ �㦡� ����
:: ����� �� ����� ᯮᮡ�� ���� ��� �஡����.

:: ES lite Service
:: ES lite Service for program management
:: %ProgramFiles%\Gigabyte\EasySaver\essvr.exe

:: eventlog
:: Event Log (��ୠ� ᮡ�⨩)
:: ���ᯥ稢��� �����প� ᮮ�饭�� ��ୠ��� ᮡ�⨩, �뤠������
:: Windows-�ணࠬ���� � ��������⠬� ��⥬�, � ��ᬮ�� ��� ᮮ�饭��. ��
:: �㦡� �� ����� ���� ��⠭������. C ������� ������ �㦡� ����� ��ᬮ����
:: ����� �ணࠬ�� "�뫥���" �� ࠡ�� ����樮���� ��⥬�, �祭� �������
:: �����㬥�� ��� ���⭮�� ���짮��⥫�.

:: EventSystem
:: COM+ Event System (���⥬� ᮡ�⨩ COM+)
:: �����প� �㦡� 㢥�������� � ��⥬��� ᮡ���� (SENS), ���ᯥ稢��饩
:: ��⮬���᪮� �����࠭���� ᮡ�⨩ �����ᠢ訬�� ��������⠬ COM. �᫨
:: ������ �㦡� ��⠭������, SENS �㤥� ������ � �� ᬮ��� �।��⠢����
:: 㢥�������� �室� � ��室�.

:: FastUserSwitchingCompatibility
:: Fast User Switching Compatibility (������⨬���� ����ண� ��४��祭��
:: ���짮��⥫��)
:: ������ �㦡� �����⢫�� �ࠢ����� �ਫ�����ﬨ, ����� �ॡ���
:: �����প� � ��������짮��⥫�᪮� �।�. ��㦡� ����� ��� �������, �᫨ �
:: ��襩 ��⥬� ࠡ�⠥� ��᪮�쪮 ���짮��⥫��, � ��⨢��� ��砥 ���
:: ����室����� � ����᪥ �⮩ �㦡�. �᫨ �� ��-⠪� �訫� �������
:: �㦡�, � ��� �������� ��४������� ����� ���짮��⥫ﬨ ��� �������
:: ࠡ����� �ணࠬ�, �� �뢠�� �祭� 㤮���.

:: Fax
:: Fax (����)
:: �������� ��ࠢ���� � ������� 䠪��, �ᯮ���� ������ �⮣� �������� �
:: �⥢� ������.

:: FontCache
:: Windows Font Cache Service (��㦡� ��� ���⮢ Windows)
:: ��ࠢ��� ��⥬�� � ���짮��⥫�᪨� ��襬 ���⮢ Windows.

:: FontCache3.0.0.0
:: Windows Presentation Foundation Font Cache 3.0.0.0 (��� ���⮢ Windows
:: Presentation Foundation 3.0.0.0)
:: ��⨬������ �ந�����⥫쭮��� �ਫ������ Windows Presentation Foundation
:: (WPF) ��⥬ ���஢���� ���筮 �ᯮ��㥬�� ������ ���⮢. �ਫ������ WPF
:: ����᪠�� ��� �㦡�, �᫨ ��� �� �� ����饭�. �� ����� �⪫����, ������
:: �� ����� �ந�����⥫쭮��� �ਫ������ WPF. WPF - ����᪠�
:: (�१���樮����) �����⥬� � ��⠢� .NET Framework.

:: gpsvc
:: Group Policy Client (������ ��㯯���� ����⨪�)
:: ������ �㦡� �⢥��⢥��� �� �ਬ������ ��ࠬ��஢, ��।�������
:: ����������ࠬ� ��� �������஢ � ���짮��⥫�� �१ ��������� ��㯯����
:: ����⨪�. �᫨ �� �㦡� ��⠭������ ��� �⪫�祭�, ��ࠬ���� �� ����
:: �ਬ�����. ����� �� �㤥� �������� �ࠢ����� �ਫ�����ﬨ � ��������⠬�
:: �१ ��㯯���� ����⨪�.

:: Guard.Mail.ru
:: ���ᯥ稢��� ����� ����஥� ��㧥஢ �� ��ᠭ�樮��஢������ ���������.

:: gupdate
:: Google Update Service (��㦡� Google Update (gupdate))
:: ���ᯥ稢��� ���������� �ணࠬ �� Google - ���ਬ��, Picasa.
:: ������ �� ⥬, �⮡� ��� �� Google �ᥣ�� ������﫮��. �᫨ �⪫���� ���
:: ��⠭����� ��� �㦡�, ��� �� Google �� �㤥� �����������. �� �����
:: ���⠢��� ������᭮��� ��� �஧�, � ⠪�� �ਢ��� � ⮬�, �� �������
:: �㭪樨 ����⠭�� ࠡ����. �� �㦡� 㤠����� ��⮬���᪨, �᫨ ��� ��
:: Google, ���஥ �� �ᯮ����.

:: gupdatem
:: Google Update Service (��㦡� Google Update (gupdatem))
:: ���ᯥ稢��� ���������� �ணࠬ �� Google - ���ਬ��, Picasa.
:: ������ �� ⥬, �⮡� ��� �� Google �ᥣ�� ������﫮��. �᫨ �⪫���� ���
:: ��⠭����� ��� �㦡�, ��� �� Google �� �㤥� �����������. �� �����
:: ���⠢��� ������᭮��� ��� �஧�, � ⠪�� �ਢ��� � ⮬�, �� �������
:: �㭪樨 ����⠭�� ࠡ����. �� �㦡� 㤠����� ��⮬���᪨, �᫨ ��� ��
:: Google, ���஥ �� �ᯮ����.

:: gusvc
:: Google Update Service (��㦡� ���������� Google)
:: ���ᯥ稢��� ���������� �ணࠬ �� Google - ���ਬ��, Picasa.

:: HelpSvc
:: Help and Support (��ࠢ�� � �����প�)
:: ���ᯥ稢��� ����������� ࠡ��� 業�� �ࠢ�� � �����প� �� �⮬
:: ��������. �᫨ �� �㦡� ��⠭������, 業�� �ࠢ�� � �����প� �� �㤥�
:: ����㯥�. ������ �㦡� ����室��� ��� ����᪠ �ࠢ���� ���㬥�⮢
:: Microsoft. �᫨ �� ����᪠�� �ணࠬ�� ��ࠢ�� � �����প� �१ ���� ���,
:: � ������ �㦡� �㤥� ����祭� � �� ��砥, ���� �᫨ �⮨� ���祭��
:: �⪫�祭�.

:: HomeGroupListener
:: Home Group Listener (����訢�⥫� ����譥� ��㯯�)
:: ��������� ��ࠬ��஢ �����쭮�� ��������, �易���� � ���䨣��樥� �
:: ���㦨������ ������祭��� � ����譥� ��㯯� �������஢. �᫨ �� �㦡�
:: ��⠭������ ��� �⪫�祭�, �������� �訡�� � ࠡ�� �������� � ����譥�
:: ��㯯�, � ⠪�� � ࠡ�� ᠬ�� ��㯯�.

:: HomeGroupProvider
:: Home Group Provider (���⠢騪 ����譥� ��㯯�)
:: �믮������ �⥢�� �����, �易���� � ����ன��� � ���㦨������ ����譨�
:: ��㯯. �᫨ �� �㦡� ��⠭������ ��� �⪫�祭�, �������� �訡�� ��
:: �����㦥��� ��㣨� ����譨� ��㯯, � ⠪�� �訡�� � ࠡ�� ᮡ�⢥����
:: ����譥� ��㯯�.

:: HidServ
:: HID Input Service (����� � HID-���ன�⢠�)
:: ���ᯥ稢��� 㭨���ᠫ�� ����� � HID-���ன�⢠� (Human Interface
:: Devices), ����� ��⨢������ � �����ন���� �ᯮ�짮����� ��࠭��
:: ��।������� ������ ����ண� �맮�� �� ���������, ���ன�⢠� �ࠢ�����
:: ��� ���� ���ன�⢠� ���⨬����. �᫨ �� �㦡� ��⠭������, ������
:: ����ண� �맮��, �ࠢ�塞� �⮩ �㦡��, �� ���� ࠡ����. �� ����� ��
:: ����� �஡��� � ���譨�� ���ன�⢠�� �� �⪫�祭�� �⮩ �㦡�. �᫨ ��
:: �����-����� "㭨���쭠�" �㭪�� ��襣� ���ன�⢠ ����⠭�� ࠡ����, �
:: ������� ���祭�� �� "��⮬���᪨".

:: HPSIService
:: HP Smart-Install Service
:: %SystemRoot%\System32\hpsisvc.exe
:: �᫨ �⪫���� ��� �㦡�, �� ࠡ���� �ਭ��� HP LJ P1102.

:: HWDeviceService.exe
:: Service for runing Mobile applications autorun
:: ����᪠�� �� ����㧪� �ணࠬ�� ������祭�� ����䮭-������.

:: IAANTMON
:: Intel Matrix Storage Event Monitor (������ RAID-����஫��஢ Intel)
:: ������ �� ����஫��ࠬ� ���⪨� ��᪮� �� 稯��� Intel.

:: ICQ Service
:: ICQ Toolbar

:: IHProtect Service
:: Adware do-search.com
:: %ProgramFiles%\XTab\CmdShell.exe
:: %ProgramFiles%\XTab\HPNotify.exe
:: %ProgramFiles%\XTab\ProtectService.exe
:: %ProgramData%\WindowsMangerProtect\ProtectWindowsManager.exe

:: idsvc
:: Windows CardSpace
:: ���ᯥ稢��� �������� ����������� ᮧ�����, �ࠢ����� � ������ ��஢��
:: 㤮�⮢�७��. ��� ����᪠: ������.

:: igfxCUIService1.0.0.0
:: Intel(R) HD Graphics Control Panel Service
:: ��㦡� ��� Intel(R) HD Graphics Control Panel.

:: ImapiService
:: IMAPI CD-Burning COM Service (��㦡� COM ����� �������-��᪮� IMAPI)
:: ������ �㦡� �����⢫�� �ࠢ����� ������� �������-��᪮� � ������� IMAPI
:: (Image Mastering Applications Programming Interface). �᫨ �� �㦡�
:: ��⠭������, � �������� �� ����� �����뢠�� �������-��᪨. �� �����
:: ��⠭����� ���祭�� � �����, ⮣�� �㦡� �㤥� ����᪠���� � �� ������,
:: ����� �� �㤥� �����뢠�� ���, � ��⮬ �⪫������. �᫨ �� � ��� �����
:: ��������� �஡���� � ������� ��᪮� ��᫥ ��⠭���� ���祭�� "������", �
:: ������� ���祭�� �� "��⮬���᪨". ������ �㦡� �������� ����� 1.6 �� �
:: ����⨢��� ����� � ०��� �������⢨�.

:: Intel(R) Capability Licensing Service Interface
:: heciserver.exe
:: �� 㬮�砭�� �� �㦡� ����祭� � ��⮬���᪮� ०���.

:: JavaQuickStarterService
:: Prefetches JRE files for faster startup of Java applets and applications.

:: jhi_service
:: Jhi_Service.exe
:: Intel(R) Dynamic Application Loader Host Interface

:: LanmanServer
:: Server (��ࢥ�)
:: ���ᯥ稢��� �����প� ��騩 ����� � 䠩���, �ਭ�ࠬ � ����������
:: ������� ��� ������� �������� �१ �⥢�� ������祭��. �᫨ �㦡�
:: ��⠭������, ⠪�� �㭪樨 �� 㤠���� �믮�����. ������ �㦡� �ᯮ������
:: ��� ������ �� ����� ���� 䠩��� � �ਭ�஢, � ⠪�� ��� ࠡ��� �ࢨ�
:: Message Queuing. �� ����� �⪫���� ��� �㦡� ��� �������⥫쭮�
:: ������᭮��, �᫨ � ��� ��� ����室����� ���뢠�� ����� � ��訬 䠩��� �
:: �ਭ�ࠬ. � ���� ��� �� ����� �⪫���� ��� �㦡�.

:: LanmanWorkstation
:: Workstation (������ �⠭��)
:: ���ᯥ稢��� �����প� �⥢�� ������祭�� � ���. ������ �㦡� �㦭� ���
:: ������祭�� �����쭮�� �������� �� 㤠��� ��������. ������ �㦡�
:: �ॡ��� ࠡ��� ������� �ࢨ� ��� ��ଠ�쭮�� �㭪樮��஢����, ���⮬�
:: ४������� ��⠢��� ������ �㦡� � ०��� "��⮬���᪨".

:: lmhosts
:: TCP/IP NetBIOS Helper Service (����� �����প� NetBIOS �१ TCP/IP)
:: ����砥� �����প� �㦡� NetBIOS �१ TCP/IP (NetBT) � ࠧ�襭��
:: NetBIOS-���� � ����. ������ �㦡� ����室��� ��� ��ଠ�쭮� �����প�
:: NetBIOS �१ TCP/IP. �᫨ ��� ��� �� �ᯮ���� NetBIOS ��� WINS, �
:: �⪫��� ������ �㦡�.

:: lpasvc
:: Microsoft Policy Platform Local Authority
:: %ProgramFiles%\Microsoft Policy Platform\policyHost.exe
:: ����� ������ Configuration Manager.

:: lppsvc
:: Microsoft Policy Platform Processor
:: %ProgramFiles%\Microsoft Policy Platform\policyHost.exe
:: ����� ������ Configuration Manager.

:: McComponentHostService
:: McAfee Security Scan Component Host Service
:: %Program Files%\McAfee Security Scan\3.8.141\McCHSvc.exe

:: MDM
:: Machine Debug Manager
:: Supports local and remote debugging for Visual Studio and script debuggers.
:: If this service is stopped, the debuggers will not function properly.

:: Messenger
:: Messenger (��㦡� ᮮ�饭��)
:: ���뫠�� � ����砥� ᮮ�饭��, ��।���� ����������ࠬ� ��� �㦡��
:: �����饭��. ������ �㦡� �� ����� �⭮襭�� � �ணࠬ�� Windows Messenger.
:: �᫨ �㦡� ��⠭������, �����饭�� �� �㤥� ��।���. �᫨ ������ �㦡�
:: ��ࠧ�襭�, �� 㤠���� �������� ��� � ����ᨬ� �㦡�.

:: Microsoft SharePoint Workspace Audit Service
:: "%ProgramFiles%\Microsoft Office\Office14\GROOVE.EXE" /auditservice
:: "%ProgramFiles%\Microsoft Office\Office15\GROOVE.EXE" /auditservice
:: Microsoft Office Groove, is a desktop application designed for document
:: collaboration in teams with members who are regularly off-line or who do not
:: share the same network security clearance.

:: mnmsrvc
:: NetMeeting Remote Desktop Sharing
:: ���⥬��� �㦡� ��饣� ����㯠 � ࠡ�祬� �⮫� NetMeeting ��������
:: ��襤訬 �஢��� ���짮��⥫� 㤠�񭭮 �ࠢ���� ࠡ�稬 �⮫�� Windows
:: � ������� �ணࠬ�� Windows NetMeeting � ��㣮�� �������� �� ����७���
:: �� �।�����. ��㦡� ����室��� � ������� � NetMeeting, � ���
:: �⪫�祭�� ��� ������� �।�����祭 ���箪 � ������ 㢥�������� Windows.
:: �᫨ �� �������� � ������᭮�� ��襣� ��������, � � ᮢ���� ���
:: �⪫���� ������ �㦡�.

:: MozillaMaintenance
:: Mozilla maintenance service
:: �⢥砥� �� �⪫�祭�� UAC �� ���������� Firefox.
:: ��� �㦡� ����� ���� �⪫���� ���� ᮢᥬ 㤠����. �� �� ������� ��
:: �⠡��쭮��� ࠡ��� ��㧥�. �ࠢ�� �ਤ���� ���⢥ত��� ��⠭����
:: ����������. � � � ���� WinXP ����� ��祣� �� �������.

:: MPCKpt
:: More Powerful Cleaner (MPC)
:: "%SYSTEMROOT%\SYSTEM32\DRIVERS\mpckpt.sys"

:: MPCProtectService
:: More Powerful Cleaner (MPC)
:: "%ProgramFiles(x86)%\MPC Cleaner\MPCProtectService.exe"

:: MpsSvc
:: Windows Firewall (�࠭������ Windows)
:: �������� �।������ ��ᠭ�樮��஢���� ����� � ��襬� ��������� �१
:: ���୥� ��� ���. �᫨ �⪫���� �㦡�, � �� ����ன�� ��饣� ����㯠
:: ����� ������� �訡��.

:: MSDTC
:: Distributed Transaction Coordinator (���न���� ��।������� �࠭���権)
:: ���ᯥ稢��� �ࠢ����� �࠭����ﬨ ����� ������묨 ��������묨
:: ����ᠬ� � ��⥬��� �ࠢ����� ������ ������, ��।ﬨ ᮮ�饭�� ��� �
:: �ਬ��� 䠩����� ��⥬��. ����室�� ��� ���䨣��樨 (�� �� ࠡ���!) COM+
:: ���������, � ⠪�� ��⥬ ��� Message Queuing (MSMQ) ��� Microsoft SQL
:: Server.

:: msiserver
:: Windows Installer (��⠭��騪 Windows)
:: msiexec.exe
:: ��� ����᪠: ������.

:: MsMpSvc
:: Microsoft Antimalware Service (��㦡� �������� �� ���� �� �।������
:: �ணࠬ�)
:: "%ProgramFiles%\Microsoft Security Essentials\MsMpEng.exe"
:: �室�� � ��⠢ Microsoft Security Essentials. �������� ������
:: ���짮��⥫�� �� �ணࠬ�-诨���� � ��㣨� ��⥭樠�쭮 ������⥫���
:: �ணࠬ�.

:: napagent
:: Network Access Protection Agent (����� ����� ����㯠 � ��)
:: �������� �����⠬ Windows �ਭ����� ���⨥ � ���� ����㯠 � ��.
:: ��������㥬�� ���祭��: ������.
:: �� ������祭�� ������ � ��� �஢������ ����稥 䠩ࢮ��, ��᫥����
:: ���������� ������᭮��, ���������� ��⨢������ �ணࠬ� � �.�. �᫨
:: �������� �� 㤮���⢮��� �ਭ��� ����⨪��, � ������ ����㯥 ��� �㤥�
:: �⪠���� �� �� ���, ���� ������ �஡���� �� ���� ���࠭���. �
:: ����ᨬ��� �� ����஥�, ���������, �� ��襤訥 ����஫�, ���� �����������
:: ���������, ���� ��������� � ��࠭⨭ (���ਬ��, �� �뤠���� IP-���� ��
:: ��㣮�� ���������). ��� ��ਠ��, ����� ����ந�� ⮫쪮 ��ୠ��஢����
:: �������� ᮡ�⨩ ��� �ਭ��� �����-���� ���. � ��࠭⨭��� ����� �����
:: �ᯮ�������� ���४樮��� �ࢥ� (Remediation Server), �।��⠢���騥
:: ������ ��� ���࠭���� ������� ������⪮�, � �ਬ���, �ࢥ� ����������
:: WSUS (Windows Server Update Services) ��� ��⨢���᭠� ����. ��᫥
:: ���������� ᮮ⢥��⢨� ����⨪�� �஢������ ����୮, - �᫨ ��
:: ��ଠ�쭮, ��⥬� ����砥� ����� � ����. �।� ����஥� ����� 㪠����
:: ���-��࠭���, �� ���ன ���ᠭ�, ��祬� ���짮��⥫� �� �����
:: �����������, � �� ��� ��� �⮣� �㦭� ᤥ����.
:: NAP �믮���� �� ⮫쪮 ��������騥 �㭪樨, �� � ���� �।�⢮�,
:: �������騬 ���࠭��� �������� ������⪨. ��� ࠡ�� �� ᢮����� �
:: ������⭮� �஢�થ �� ������祭�� (��᫥ ���ன ���짮��⥫� �����
:: �⪫���� ��⨢����, "�⮡� �� ��蠫"). �஢�ઠ ���ﭨ� �ந��������
:: ��ਮ���᪨ � �祭�� �ᥣ� �६���, ����� �������� ������祭 � ���.

:: NAUpdate
:: Nero Update
:: This module assists in the automatic update function for Nero software. If
:: disabled, the NERO software will not automatically seek updates.

:: NetDDE
:: NetDDE (��㦡� �⥢��� DDE)
:: ���ᯥ稢��� �⥢�� �࠭ᯮ�� � ������᭮��� ��� �������᪮�� ������
:: ����묨 (DDE) ��� �ணࠬ�, �믮�������� �� ����� ��� �� ࠧ�����
:: ���������. �᫨ �� �㦡� ��⠭������, �⥢�� �࠭ᯮ�� � ������᭮���
:: DDE �� ���� ����㯭�. �᫨ �� �㦡� �⪫�祭�, ��� �㦡�, ����� �
:: ������� �� ���, �� ����� ���� ����饭�.

:: Netlogon
:: Net Logon (��⥢�� �室 � ��⥬�)
:: ��� �஢�ન ���������� ���짮��⥫�� � �㦡 ��⥬��� �㦡� �����ন����
:: �������� ����� ����� �������஬ � ����஫��஬ ������. ��� ��।��� ��
:: ����஫��� ������ ���� ����� ���짮��⥫�, � �����頥� �������
:: �����䨪���� ������᭮�� � �����祭�� ���짮��⥫� �ࠢ�. ���筮 ���
:: ����� ���뢠���� ᪢����� �஢�મ� ����������. ��㦡� Net Logon
:: ��⮬���᪨ ����᪠����, ⮫쪮 ����� � ������ ������砥��� �冷���
:: �������� ��� ����஫��� ������. ������ �㦡� �� �㦭� � ����譨� �᫮����
:: ��� � �᫮���� ����譨� �⥩, ���⮬� ����� �� �⪫����.

:: Netman
:: Network Connections (��⥢� ������祭��)
:: ��ࠢ��� ��ꥪ⠬� ����� ���� � 㤠��� ����� � ��, �⮡ࠦ��饩
:: ᢮��⢠ �����쭮� �� � ������祭�� 㤠�񭭮�� ����㯠. ������ �㦡�
:: ����室��� ��� �����প� �⥢�� ᮥ�������. �⪫��� ������ �㦡�, �᫨
:: ��� �������� ��室���� ��� ����. �᫨ ��᫥ �⪫�祭�� ������ �㦡� � ���
:: ������ �஡���� � �⥢묨 ������祭�ﬨ, � ���⠢�� ���祭�� �
:: ��⮬���᪨. �ਬ�砭��: �᫨ �� �⪫��� ������ �㦡�, � � ��� �����
:: � ��⥬��� �॥ �� �㤥� ������� ���箪 ᮥ������� (2 ������稪�) ����
:: ��� �������� ᮥ�������.

:: NisSrv
:: Microsoft Network Inspection System (�஢�ઠ �� ��������)
:: "%ProgramFiles%\Microsoft Security Client\Antimalware\NisSrv.exe
:: ����� �⮩ �㦡� �᭮���� �� ᨣ����୮� ������� � � �� �㭪樨 �室��
:: �।���饭�� �⠪ �� ������� �梨�����. �ᯮ������ ��� ��� �६������
:: �����஢���� �梨����� � ������ �� �����㦥��� �� ��室� ����������.
:: �室�� � ��⠢ Microsoft Security Essentials.

:: Nla
:: NlaSvc
:: Network Location Awareness NLA (��㦡� �⥢��� �ᯮ������� NLA)
:: ������ �㦡� ᮡ�ࠥ� � �࠭�� ᢥ����� � ࠧ��饭�� � ����ன�� ��, �
:: ⠪�� 㢥������ �ਫ������ �� �� ���������.

:: NvStreamSvc
:: NVIDIA Streamer Service
:: %ProgramFiles%\NVIDIA Corporation\NvStreamSrv\nvstreamsvc.exe
:: ��㦡� ��� SHIELD Streaming. �㦭� ��� ⮣�, �⮡� ����� � ���� �� ��஢��
:: ���᮫� �� nVidia, ����饭�� �� ��. �� ��� �⮩ �㦡� ����� �����뢠��
:: ���� � Shadow Play.

:: NVSvc
:: NVidia Display Driver Service (����䥩� �ࠢ����� �ࠩ��஬ ���������
:: NVidia)
:: %SystemRoot%\System32\nvsvc32.exe
:: Provides system and desktop level support to the NVIDIA display driver.
:: �᫨ �㦡� �⪫�祭�, � �� ����᪠���� NVIDIA Control Panel Application
:: (������ �ࠢ����� NVIDIA).

:: nvUpdatusService
:: NVIDIA Update Service Daemon
:: NVIDIA Settings Update Manager service, used to check new updates from
:: NVIDIA server.

:: ose
:: Office Source Engine
:: ���࠭���� ��⠭������ 䠩��� ��� ��᫥���饣� ���������� � ����⠭�������
:: �த��. �ᯮ������ ⠪�� ��� ����㧪� ����������� ���ᨩ �ணࠬ��
:: ��⠭���� � ���⮢ �� �訡��� Watson. ��� �⮩ �㦡� �� �⠢���� Office
:: 2013 �� Windows 8.

:: osppsvc
:: Microsoft Office Software Protection Platform Service
:: %CommonProgramFiles%\Microsoft Shared\OfficeSoftwareProtectionPlatform\osppsvc.exe
:: %SystemRoot%\System32\osppsvc.exe
:: ��㦡� �஢���� ��業��� Microsoft Office. �᫨ �� �⪫����, � Microsoft
:: Office ����뢠����, ���⮬� ०�� ����᪠: ������.

:: p2psvc
:: Peer Networking Grouping (��㯯�஢�� �⥢�� ���⭨���)
:: ����砥� �������஭��� ����������⢨� � ������� ��㯯�஢�� ����࠭�����
:: ��. �� �⪫�祭�� ������� �ਫ������, ���ਬ�� ������� ��㯯�, �����
:: ������� ࠡ����.

:: p2pimsvc
:: Peer Networking Identity Manager (��ᯥ��� 㤮�⮢�७�� �⥢�� ���⭨���)
:: �।��⠢��� �㦡� �����䨪�樨 ��� ��⮪��� ����࠭������ ࠧ�襭��
:: ��� (PNRP) � ��㯯�஢�� ����࠭����� ��. � ��砥 ����饭�� �㦡� ���
:: ��⮪��� ����࠭������ ࠧ�襭�� ��� (PNRP) � ��㯯�஢�� ����࠭�����
:: ��, � ⠪�� ������� �ਫ������, ���ਬ�� ������� ��㯯� � Remote
:: Assistance, ����� ������� ࠡ����.

:: PicexaService
:: �����.

:: pla
:: Performance Logs & Alerts (��ୠ�� � �����饭�� �ந�����⥫쭮��)
:: ��㦡� ��ୠ��� �ந�����⥫쭮�� � �����饭�� ᮡ�ࠥ� ����� � ��������
:: � 㤠���� �������஢ ᮮ⢥��⢥��� ������� ��ࠬ��ࠬ �ᯨᠭ��, �
:: ��⥬ �����뢠�� ����� � ��ୠ� ��� �뤠�� �����饭��. �᫨ ������ �㦡�
:: ��⠭������, �� ᢥ����� � �ந�����⥫쭮�� �� ᮡ������.

:: PlugPlay
:: Plug and Play
:: �������� ��������� �ᯮ������� ��������� � ��⠭�������� ����㤮����� �
:: �����ࠨ������ ��� ���, ����, �� �ॡ�� ����⥫��⢠ ���짮��⥫�, ����
:: ᢮�� ��� � �������. ��⠭���� ��� �⪫�祭�� �⮩ �㦡� ����� �ਢ��� �
:: ���⠡��쭮� ࠡ�� ��⥬�. �� �㦡� ���� "��楬" �ᥩ ��⥬� Plug
:: and Play ���ன�� �� ��������. � �ࠩ�� �� ४������� �⪫���� ������
:: �㦡�, ⠪ ��� �� ����� �⮫������� � ������⢮� �஡���. ����� �����,
:: �� UPnP �� ���� ᠬ��, �� � PnP. UPnP �㦨� ��� �裡 �१ TCP/IP �
:: ����㤮������ (᪠��ࠬ�, �ਭ�ࠬ� � �.�.). ��� ��㪮��� ���� - �� PnP
:: ���ன�⢮. �� ���������� �㦡� Plug and Play.

:: PnkBstrA
:: PunkBuster Service Component (http://www.evenbalance.com) - ��⮬���᪨
:: ᠬ������������� ��⥬� �ணࠬ����� ���ᯥ祭�� �������⢠ �� �ࢥ�.
:: �� ����砥�, �� �� ��ப�� � ����� ���� ��⠭���������� �������
:: PunkBuster��, ���஥ ���뫠�� �� �ࢥ� �� ����襭�� �����⭮�� ��ப�.
:: ���⥬� PunkBuster ࠧࠡ�⠭�, ��� ⮣� �⮡� �� ��ப� �뫨 �⢥��⢥���
:: �� ᢮� ����㯪� � ������ ����, �� �ᯮ�짮����� ���᪨� ������.
:: PunkBuster �� ������� ������� 䠩��� ��� �㭪樨 ����ன�� �� ��襬
:: ��������, ���� �᫨ � �����㦨������ ������� ⨯� ����襭�� �� �६�
:: ���� � ������� ��ப�, � ���� �뢮��� ᮮ�饭�� ��� � ����襭���
:: ����饭��� �� � ������ (㤠���) ��ப� � �ࢥ� ��� �� �����. �����
:: �ࢥ� � �ࠢ� ������� �� �ࢥ� ��� �� ������� PunkBuster, ��� ������
:: ⮫쪮 �� ��� �������. �� ����� � ����ன��� ���� �⪫���� PunkBuster, ��
:: �� �⮬ � ��� �㤥� 㦥 ��࠭�祭�� ᯨ᮪ �ࢥ஢, �� ������ ⮦�
:: PunkBuster �㤥� �⪫���. PunkBuster �� ���� ����᭮� �ணࠬ��� �
:: ᮧ��� ��� ��⭮� ���� �� �ࢥ�. �������⥫쭮, PunkBuster �� ��।���
:: ��� ���� ����� �� �� ��㣮� ��������, �� ᮤ�থ� ᮡ�⢥���� ���
:: ������ � ������ ���ᠭ� ��� ���ᮭ���� �����. PunkBuster � �᭮����
:: ⮫쪮 ��� ���⠭����� ����⢨� � ����� ��襩 ����.

:: PolicyAgent
:: ����� ����⨪� IPsec
:: IPSEC Services (��㦡� IPSEC)
:: ������᭮��� ��⮪��� IP (IPsec) �����ন���� �஢��� ����������
:: �������� 㧫�� �� �⥢�� �஢��, �஢��� ���������� ���筨�� ������,
:: �஢��� 楫��⭮�� ������, �� ���䨤��樠�쭮��� (��஢����) � �����
:: ����७��. �� �㦡� ������ � ����⢨� ����⨪� IPsec, ᮧ����� � �������
:: �᭠�⪨ "����⨪� IP-������᭮��" ��� �।�⢮� ��������� ��ப� "netsh
:: ipsec". ��⠭���� �⮩ �㦡� ����� �ਢ��� � ������������� �஡��� �
:: �⥢묨 ������祭�ﬨ, �᫨ ����⨪� �ॡ��, �⮡� ᮥ������� �ᯮ�짮����
:: IPsec. �஬� ⮣�, �᫨ ��⠭������ �� �㦡�, � 㤠������ �ࠢ�����
:: �࠭�����஬ Windows ������㯭�. ������ �㦡� ����� ������������ ��
:: �ᯮ�짮����� VPN ��� ������. ��� ����譥�� �ᯮ�짮����� ������ �㦡�
:: ����� �⪫����.

:: ProtectedStorage
:: Protected Storage (���饭��� �࠭����)
:: ���ᯥ稢��� ���饭��� �࠭���� ᥪ���� ������, ⠪��, ��� �������
:: ����, ��� �।���饭�� ��ᠭ�樮��஢������ ����㯠 �㦡, ����ᮢ ���
:: ���짮��⥫��. �������� ��࠭��� ������� ��஫� ��� ���-���ଠ��
:: (��⮧���������). �� 㬮�砭�� ������ �㦡� ����祭� � ��⮬���᪮�
:: ०���. �� �� ᮮ�ࠦ���� ������᭮�� � ४������� �⪫���� ��. � ��㣮�
:: ��஭�, ������ �㦡� ����� ��� ������������ �� ࠡ�� � ����஢���묨
:: ����묨 � ���砬� �� ࠧ����� �ணࠬ�, � ⠪�� ��砥 ��୨� �㦡� �
:: ���祭�� ��⮬���᪨. �᫨ �� ��࠭�� ��஫� � Outlook Express`�,
:: ������祭��� � ���୥�� �� ������ ��� �१ ����஫��� ������, �� �ॡ��
:: �����䨪�樨, � ��⠢�� �㦡� � ०��� "��⮬���᪨".

:: RapiMgr
:: ActiveSync RAPI Manager
:: %ProgramFiles%\Microsoft ActiveSync\rapimgr.exe
:: �ਭ������� �ணࠬ�� Microsoft ActiveSync (��� � ���ன�⢠�� �� ��
:: Windows Mobile). ���蠥� ��� 諥� ����� �� ������ ����� � �� ��� ��
:: ���୥��.

:: RasAuto
:: Remote Access Auto Connection Manager (��ᯥ��� ��⮬���᪨� ������祭��
:: 㤠�񭭮�� ����㯠)
:: ������� ������祭�� � 㤠�񭭮� ��, ����� �ணࠬ�� ���頥��� � 㤠�񭭮��
:: DNS- ��� NetBIOS-����� ��� �����.

:: RasMan
:: Remote Access Connection Manager (��ᯥ��� ������祭�� 㤠�񭭮�� ����㯠)
:: ��ࠢ��� ������祭�ﬨ 㤠�񭭮�� ����㯠 � ����㠫쭮� ��⭮� �� (VPN)
:: � ������� �������� � ���୥�� ��� ��㣨� 㤠��� ���.

:: RemoteRegistry
:: Remote Registry (������ ॥���)
:: �������� 㤠��� ���짮��⥫� �������� ��ࠬ���� ॥��� �� �⮬
:: ��������. �᫨ �� �㦡� ��⠭������, ॥��� ����� ���� ������� ⮫쪮
:: ������묨 ���짮��⥫ﬨ, ࠡ���騬� �� �⮬ ��������. ������ �㦡� ���
:: � ����樮���� ��⥬� Windows XP Home. �� � � Windows XP Pro ��� ��᮫�⭮
:: �� �㦭�, �� �㦡� ���� ����� �� �����, ������ � �⪫��� ��᫥
:: ��⠭���� ����樮���� ��⥬�.

:: ROMService_Support
:: ����񭭮� �ࠢ����� (rmansys.ru).

:: RpcLocator
:: Remote Procedure Call (������ 㤠�񭭮�� �맮�� ��楤�� (RPC))
:: ������� �⥢�� ������祭��. ������ �㦡� ����室���, �᫨ ��  �ᯮ����
:: ��騩 ����� � ���୥��. ���஡�� �⪫����  ��,  �᫨  �  ���  ����⠫
:: ࠡ���� ���୥�, � ��୨� ���祭��  �㦡�  �  "��⮬���᪨".  �����
:: �����,  ��  ������  �㦡�  �����  ���ॡ�������  ���   ��������   �����
:: ������祭�� ��� DSL-������祭��.

:: SamSs
:: Security Accounts Manager (��ᯥ��� ����� ����ᥩ ������᭮��)
:: �࠭�� ���ଠ�� � ������᭮�� ��� ��⭮� ����� �����쭮�� ���짮��⥫�.
:: ��� �⮩ �㦡� �� �㤥� ࠡ���� �㦡� IIS Admin (IIS Admin). �᫨ �� ��
:: ������ ������� ��������� � �����쭮� ����⨪� ������᭮�� (gpedit.msc), �
:: ����� �⪫���� ������ �㦡�. �᫨ �� �� ������ ��������� � �����쭮�
:: ����⨪� ������᭮�� � �⪫��� ������ �㦡�, � �� ���������, �����
:: �� ������, ����⠭�� ࠡ����. ���⮬� � ४������� ��⠢��� ०�� ����᪠
:: �⮩ �㦡� �� 㬮�砭��, � ���� "��⮬���᪨".

:: SDRSVC
:: Windows Backup (��娢��� Windows)
:: �����প� ��娢�樨 � ����⠭������� � Windows.

:: Schedule
:: Task Scheduler (�����஢騪 �������)
:: �������� ����᪠�� ������ �� ����� ��㣮�� ���짮��⥫�. �᫨ �� �㦡�
:: ��⠭������, ��� ⨯ ॣ����樨 ���짮��⥫� ������㯥�.

:: SecLogon
:: Secondary Logon (����� �室 � ��⥬�)
:: �������� ����᪠�� ������ �� ����� ��㣮�� ���짮��⥫�. �᫨ �� �㦡�
:: ��⠭������, ��� ⨯ ॣ����樨 ���짮��⥫� ������㯥�.

:: SENS
:: System Event Notification (����������� � ��⥬��� ᮡ����)
:: ������ �㦡� ��⮪������ ��⥬�� ᮡ���, ⠪�� ��� ॣ������ �
:: Windows, � �� � ��������� � ����� ���ய�⠭��. ��������� ������稪��
:: �� ࠧ�鸞 COM+ ��⥬��� ᮡ�⨥, ���뫠� �����饭��. �᫨ �㦡� ��
:: ����饭�, ���筮�� ���짮��⥫� ���������� ���� � ������ ������, ⥪��
:: �訡��: Windows �� 㤠���� ����������� � �㦡� "��㦡� 㢥�������� �
:: ��⥬��� ᮡ����".

:: SensrSvc
:: Adaptive Brightness (����⨢��� ॣ㫨஢�� �મ��)
:: �।�����祭� ��� ������� �� ���稪�� ���譥�� �ᢥ饭�� � ���४�஢��
:: �મ�� ������ � ᮮ⢥��⢨� � ��������ﬨ �ᢥ饭����. � ��砥
:: ��⠭���� ��� �⪫�祭�� �⮩ �㦡� ���४�஢�� �મ�� ������ �
:: ᮮ⢥��⢨� � �ᢥ�񭭮���� �� �ந��������.

:: servervo
:: VO Service component
:: Remote Desktop Access (VuuPC).
:: %AppData%\VOPackage\VOsrv.exe
:: �����.

:: SCardSvr
:: Smart Card Helper (����� �����প� ᬠ��-����)
:: SCardSvr.exe
:: �� 㬮�砭�� ������ �㦡� ����祭� � ��⮬���᪮� ०���. ���ᯥ稢���
:: �����প� ��� ����� ���ன�� �⥭�� ᬠ��-���� (��� PnP). �᫨ �� �㦡�
:: ��⠭������, �� �������� �� ���� �����ন������ ���� ���ன�⢠ �⥭��
:: ᬠ��-����. ��㦡� �ᯮ������ ��� �����প� �����쭮� ��� �⥢��
:: ���ਧ�樨 �१ ᬠ��-����� (����-�������).

:: SharedAccess
:: Windows Firewall/Internet Connection Sharing (�࠭������ Windows / ��騩
:: ����� � ���୥�� (ICS))
:: ���ᯥ稢��� �����প� �㦡 �࠭��樨 ���ᮢ, ����樨 � ࠧ�襭�� ����
:: ��� �।���頥� ��থ��� �㦡 � ����譥� �� ��� �� ������讣� ���.
:: �������� ⮭�� ����ந�� 䨫����� �⥢��� ��䨪�. �᫨ �� �ᯮ����
:: 䠩�ࢮ�� ��஭��� �ந�����⥫�� (Outpost firewall, Norton Personal
:: Firewall, ZoneAlarm � �.�.), � ����室��� �⪫���� ������ �㦡�.

:: ShellHWDetection
:: Shell Hardware Detection (��।������ ����㤮����� �����窨)
:: ��㦨� ��� ��⮧���᪠ ����㤮�����: CD-ROM � �.�. ��㦡� ����㧪�
:: ����ࠦ���� Windows (WIA) ���� ����ᨬ�� �� �⮩ �㦡�.

:: SkypeUpdate
:: Skype Updater
:: �����㦥���, ����㧪� � ��⠭���� ���������� ��� Skype.

:: smstsmgr
:: ����� ��᫥����⥫쭮�� ����� Configuration Manager
:: %SystemRoot%\CCM\TSManager.exe
:: ����� ������ Configuration Manager ��� �믮������ ��᫥����⥫쭮�� �����.

:: Spooler
:: Print Spooler (��ᯥ��� ��।� ����)
:: ����㦠�� � ������ 䠩�� ��� ��᫥���饩 ����. �᫨ �� �� �ᯮ����
:: ����� � � ��� � ��⥬� �� ��⠭������ �� ������ �ਭ��, � �⪫���
:: ������ �㦡�.

:: SSDPSRV
:: SSDP Discovery Service (��㦡� �����㦥��� SSDP)
:: ������ �㦡� ����砥� �����㦥��� UPnP-���ன�� � ����譥� ��. ������,
:: ����室������ ������� �ࢨ� � ����譨� �᫮���� ��뢠�� ����讥 ᮬ�����.
:: ��� ����᪠: ������.

:: SSUService
:: Splashtop software updater (��㦡� ���������� Splashtop)
:: Enables updates and enhancements to the SmartView browser extension.

:: srservice
:: System Restore Service (��㦡� ����⠭������� ��⥬�)
:: �믮���� �㭪樨 ����⠭������� ��⥬�. �⮡� ��⠭����� ������ �㦡�,
:: ᫥��� �⪫���� ����⠭������� ��⥬� �� ������� ����⠭������� ��⥬�,
:: � ������ ����� �������, ����� �ࠢ�� ������� ��� �� ��몥 ��� ��������
:: �� ࠡ�祬 �⮫� � ��ࠢ �㭪� �����⢠.�ਬ�砭��: �ࠩ�� �� ४���������
:: �⪫���� ����⠭������� ��⥬�, ⠪ ��� � ��砥 ᡮ� � ࠡ�� ��������
:: �� �� ᬮ��� �������� � ࠡ��ᯮᮡ���� ���ﭨ�.

:: Srv
:: �ࠩ��� �� srv.sys ���ᯥ稢��� �����প� ��⮪��� SMB 1.0. �� �⪫�祭�
:: ���� ���� �������, ⠪�� ��� Windows XP � Windows Server 2003, ��
:: ������ ����� � ��騬 ������.

:: STacSV
:: Audio Service
:: Manages audio jack configurations
:: %ProgramFiles%\IDT\WDM\STacSV.exe
:: This program contains the driver that enables the IDT High-Definition (HD)
:: Audio in supported notebook models that are running a supported operating
:: system.

:: stisvc
:: Windows Image Acquisition (WIA) (��㦡� ����㧪� ����ࠦ���� Windows (WIA))
:: Still Image Service (� Windows 2000)
:: ���ᯥ稢��� �㦡� ����祭�� ����ࠦ���� � ᪠��஢ � ��஢�� �����.
:: �뫨 �஡���� ����� �㦡� �� ����᪠���� � ��筮� ०���.

:: Stereo Service
:: NVIDIA Stereoscopic 3D Driver Service
:: Provides system support for NVIDIA Stereoscopic 3D driver.

:: SynTPEnhService
:: SynTPEnh Caller Service
:: 32-bit Synaptics Pointing Enhance Service
:: 64-bit Synaptics Pointing Enhance Service
:: %ProgramFiles%\Synaptics\SynTP\SynTPEnhService.exe
:: %ProgramFiles%\Synaptics\SynTP\SynTPEnh.exe
:: %ProgramFiles%\Synaptics\SynTP\SynTPHelper.exe
:: �⨫�� �� ��⠢� �ࠩ��� �篠�� �� Synaptics, ���ᯥ稢��� �����প�
:: ���७��� �㭪権 �篠�� (���ਬ��, �����祭�� ᯥ樠���� ����⢨� ��
:: �⤥��� ���� �篠��). ��� �⮩ �㫧� �篠� �㤥� ���� ࠡ���� ���
:: ���筠� ��誠. ������� �������⥫��� �㭪権 �� �㤥�.

:: TapiSrv
:: Telephony (����䮭��)
:: ���ᯥ稢��� �����প� Telephony API (TAPI) ��� �ணࠬ�, �ࠢ�����
:: ⥫�䮭�� ����㤮������ � ����ᮢ묨 IP-������祭�ﬨ �� �⮬ ��������, �
:: ⠪�� �१ ��� - �� �ࢥ��, ��� ����饭� ᮮ⢥������� �㦡�.

:: TermService
:: Terminal Services (��㦡� �ନ�����)
:: ������ �㦡� �।��⠢��� ����������� ��᪮�쪨� ���짮��⥫�
:: ���ࠪ⨢�� ����������� � ��������� � �⮡ࠦ��� ࠡ�稩 �⮫ �
:: �ਫ������ �� 㤠���� ���������. ������� �᭮��� ��� 㤠�񭭮��
:: ࠡ�祣� �⮫� (������ 㤠�񭭮� ���������஢����), ����ண� ��४��祭��
:: ���짮��⥫��, 㤠�񭭮�� ����魨�� � �㦡 �ନ�����.

:: Themes
:: Themes (����)
:: ���ᯥ稢��� �ࠢ����� ���짮��⥫�᪨�� ⥬��� ࠡ�祣� �⮫�. �᫨ ��
:: �ᯮ���� ��������� ⥬� Windows, � ��� �� �� 祬 ��ঠ�� ��� �ࢨ�
:: ����祭��.

:: TrkWks
:: Distributed Link Tracking Client (������ ��᫥������� ����������� �痢�)
:: �����ন���� �裡 NTFS-䠩���, ��६�頥��� � �।���� �������� ��� �����
:: �������ࠬ� � ������.

:: TrustedInstaller
:: Windows Modules Installer (��⠭��騪 ���㫥� Windows)

:: UALSVC
:: User Access Logging Service (��㦡� ������� ��ୠ�� ����㯠 ���짮��⥫��)
:: �� �㦡� ॣ������� (� ���� IP-���ᮢ � ���� ���짮��⥫��) 㭨�����
:: ������᪨� ������ �� �����, ��ࠢ�塞� �த�⠬� ��� ஫ﬨ ��
:: �����쭮� �ࢥ�. ��� ���ଠ�� ����� �१ Powershell ����訢���
:: ������������, ����� �ॡ���� �業��� ������⢮ ������᪨� ����ᮢ �
:: �ࢥ୮�� �ணࠬ����� ���ᯥ祭�� ��� ��⮭������ �ࠢ����� ������᪨��
:: ��業��ﬨ. ��⠭���� �㦡� �� ����� �� ������ �����᪨� ������ (�.
:: 蠣� �� 㤠����� �����᪨� ������ � ���㬥��樨 �� �����প�).
:: �����쭮�� ��⥬���� ������������ �ॡ���� ������ �᫮��� ��業��������
:: ᮣ��襭�� �� �ᯮ�짮����� Windows Server, �⮡� ��।����� ������⢮
:: ������᪨� ��業���, ����室���� ��� �������饣� ��業��஢���� �ࢥ୮��
:: �ணࠬ����� ���ᯥ祭��; �ᯮ�짮����� �㦡� � ������ UAL �� ������� ���
:: ��易������.

:: UFDSVC
:: UFD Command Service
:: ��㦡� UFD Command Service (䠩� ufdsvc.exe) ���� � 䫥誠�� Transcend
:: Jetflash... ������ ��� ࠡ��� ⠪�� �ணࠬ� ��� PC-Lock, Password, mFormat,
:: ���⠢�塞�� � ��誮�.

:: UI0Detect
:: Interactive Services Detection (�����㦥��� ���ࠪ⨢��� �㦡)
:: %SystemRoot%\System32\UI0Detect.exe
:: Interactive Services Detection (the blinking button on the taskbar) is a
:: mitigation for legacy applications that detects if a service is trying to
:: interact with the desktop. This is handled by the Interactive Services
:: Detection (UI0Detect) service.
:: When you choose "View the message", you are taken to session 0's desktop and
:: you can only interact with the dialog or message that services have tried to
:: display on the desktop.

:: UPHClean
:: User Profile Hive Cleanup
:: ��⠭���������� ��� �ࢨ� �� Windows 2000/XP/Vista. ������ � ����� ���
:: x64 ��⥬. �祭� ���㠫쭠 ��� �ନ������ �ࢥ஢. �������� ���४��
:: �������� ���짮��⥫�᪨� ��ᨨ. ��। �����襭��� ᥠ�� �᢮�������
:: ������ ����ᠬ� ��� �ਫ�����ﬨ ��⪨ ॥���. � ⮬� �� ��������
:: ���������� �� ��譨� ᮮ�饭�� � ����� (Userenv 1517, 1524). �� ���쭥���
:: ࠧࠡ�⪠ �⨫��� ��⠭������. � Windows 7/2008 R2 㦥 ������� ��⭠�
:: �㦡� <User Profile Service>, ����� � �믮���� ����室��� �㭪樨.

:: upnphost
:: UPnP Device Host (���� 㭨���ᠫ��� PNP-���ன��)
:: �������� ࠧ����� ���ன�⢠ UPnP �� �⮬ ��������. �᫨ �� �㦡�
:: ��⠭������, �� UPnP-���ன�⢠ �४���� ࠡ���, � �������� �������⥫��
:: ���ன�⢠ �㤥� ����������. �᫨ ������ �㦡� �⪫�祭�, �� �
:: ������騥 �� ��� �㦡� �������� �� 㤠����. ��� ����᪠: ������.

:: UserAccess
:: Securom User Access for Windows 2000 and Windows XP a technology by Sony DADC
:: %CommonProgramFiles%\YDP\UserAccessManager\useraccess.exe

:: w32time
:: Windows Time (��㦡� �६��� Windows)
:: ��ࠢ��� ᨭ�஭���樥� ���� � �६��� �� ��� ������� � �ࢥ�� � ��.
:: �᫨ �� �㦡� ��⠭������, ᨭ�஭����� ���� � �६��� �� �㤥� ����㯭�.

:: WcesComm
:: ActiveSync Connection Manager
:: %ProgramFiles%\Microsoft ActiveSync\wcescomm.exe
:: �ਭ������� �ணࠬ�� Microsoft ActiveSync (��� � ���ன�⢠�� �� ��
:: Windows Mobile). �ᯮ���� ����, �⮡� ��ᮥ������� � �� ��� ���୥��.

:: WdiSystemHost
:: Diagnostic System Host (���� ��⥬� �������⨪�)

:: WebClient
:: Web Client (���-������)
:: �������� Windows-�ணࠬ��� ᮧ������, ������� ����� � �������� 䠩��,
:: �࠭�騥�� � ���୥�. �᫨ �� �㦡� ��⠭������, �� �㭪樨 �� ����㯭�.
:: �᫨ �� �㦡� �⪫�祭�, ��� �㦡�, ����� � ������� �� ���, ��
:: ����� ���� ����饭�.

:: VIAKaraokeService
:: VIA Karaoke digital mixer Service

:: WinHttpAutoProxySvc
:: WinHTTP Web Proxy Auto-Discovery Service (��㦡� ��⮬���᪮�� �����㦥���
:: ���-�ப� WinHTTP)

:: Winmgmt
:: Windows Management Instrumentation (�����㬥��਩ �ࠢ����� Windows)
:: �।��⠢��� ��騩 ����䥩� � ��ꥪ��� ������ ��� ����㯠 � ���ଠ樨 ��
:: �ࠢ����� ����樮���� ��⥬��, ���ன�⢠��, �ਫ�����ﬨ � �㦡���.
:: ��᫥ ��⠭���� ������ �㦡� ������ Windows-�ਫ������ ����� ࠡ����
:: �����४⭮.

:: WinRM
:: Windows Remote Management (��㦡� 㤠�񭭮�� �ࠢ�����)
:: Windows

:: WLTRYSVC
:: Dell Wireless WLAN Tray Service
:: %SystemRoot%\System32\wltrysvc.exe

:: WmdmPMSN
:: Portable Media Serial Number (�, ���� �� ���� ��� ��ॢ��� ��� ��㯮���).

:: wmiApSrv
:: WMI Performance Adapter

:: WMPNetworkSvc
:: Windows Media Player Network Sharing Service (��㦡� ���� �⥢�� ����ᮢ
:: �ந��뢠⥫� Windows Media)
:: �।��⠢��� ��騩 ����� � ������⥪�� �ந��뢠⥫� Windows Media ��㣨�
:: �⥢� �ந��뢠⥫� � ���ன�⢠�, �ᯮ����騬 �⠭���� Universal  Plug
:: and Play. ��������㥬�� ���祭��: ������.

:: WPCSvc
:: Parental Controls (����⥫�᪨� ����஫�)
:: ����砥� � ��⥬� த�⥫�᪨� ����஫� Windows. ��㦡� ����� �⪫����.

:: WPDBusEnum
:: Portable Device Enumerator Service (��㦡� ����᫨⥫� ��७����
:: ���ன��)

:: WPFFontCache_v0400
:: Windows Presentation Foundation Font Cache 4.0.0.0 (��� ���⮢ Windows
:: Presentation Foundation 4.0.0.0)
:: ��⨬������ �ந�����⥫쭮��� �ਫ������ Windows Presentation Foundation
:: (WPF) ��⥬ ���஢���� ���筮 �ᯮ��㥬�� ������ ���⮢. �ਫ������ WPF
:: ����᪠�� ��� �㦡�, �᫨ ��� �� �� ����饭�. �� ����� �⪫����, ������
:: �� ����� �ந�����⥫쭮��� �ਫ������ WPF. WPF - ����᪠�
:: (�१���樮����) �����⥬� � ��⠢� .NET Framework.

:: wscsvc
:: Security Center (����� ���ᯥ祭�� ������᭮��)
:: ����� ���ᯥ祭�� ������᭮�� �������� �ࠢ���� ��ࠬ��ࠬ� ������᭮��
:: Windows. ����� �⪫���� ��� �㦡�.

:: WSearch
:: Windows Search (���� Windows)
:: ������஢���� ᮤ�ন���� � ���஢���� ᢮��� ��� 䠩���, ���⮢��
:: ᮮ�饭�� � ��㣨� ����⮢ (���।�⢮� API-����䥩ᮢ ���७��). ��
:: �㦡� ॠ����� �� 㢥�������� �� ��������� 䠩��� � ᮮ�饭�� � 楫��
:: ������஢���� �� ᮤ�ন����. �᫨ �㦡� ��⠭���������� ��� �⪫�砥���,
:: �஢����� Windows �� ᬮ��� �⮡ࠦ��� ����㠫�� ����� ����⮢, �
:: �㭪樮����� ���������� ���᪠ ���� ��࠭�祭� �������� ��������
:: ���᪮�. �᫨ �⪫����, �� ࠡ�⠥� ������ ���� � Outlook - �뤠�� �訡��.

:: wuauserv
:: Automatic Updates (��⮬���᪮� ����������)
:: �㦥� ��� ������祭�� �������� � 業��� Windows Update ��� ��⮬���᪮��
:: ᪠稢���� ���������� ��� ��襩 ��⥬�. �᫨ �⪫���� �㦡�, � �� �㤥�
:: ����������� Microsoft Security Essentials, ���⮬� ०�� ����᪠: ������.

:: WZCSVC
:: Wireless Zero Configuration (���஢����� ����ன��)
:: �।��⠢��� ��⮬������ ����ன�� 802.11 �����஢. �᫨ � ���������
:: �� ������祭� �����஢ ���஢����� �裡, � ४��������� �⪫����
:: ������ �㦡� ��� ������ ��⥬��� ����ᮢ.
