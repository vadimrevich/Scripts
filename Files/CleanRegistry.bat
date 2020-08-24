@echo off
set PATH=%SYSTEMROOT%\SYSTEM32;%SYSTEMROOT%;%SYSTEMROOT%\SYSTEM32\WBEM;

set  HELP=Cleaning unwanted registry keys
set USAGE=

call :Cleaning_Registry
goto :EoF


:Cleaning_Registry
set DELETE_REG_ENTRY_ERROR=NO
if /I "%DEBUG%"=="YES" (
  call           :Cleaning_Registry_Sub
) else (
  call>nul 2>nul :Cleaning_Registry_Sub
)
if /I "%DEBUG%"=="YES" (
  echo.
  if /I "%DELETE_REG_ENTRY_ERROR%"=="YES" (
    exit /B 1
  )
  exit /B 0
)
if /I "%DELETE_REG_ENTRY_ERROR%"=="YES" (
  call EchoFail Cleaning registry
  exit /B 1
)
call EchoSucc Cleaning registry
exit /B 0
:Cleaning_Registry_Sub
call EchoTitl Cleaning registry
call DeleteRegBHO "{00E71626-0BEF-11DC-8314-0800200C9A66}"
call DeleteRegBHO "{0633EE93-D776-472f-A0FF-E1416B8B2E3D}"
call DeleteRegBHO "{09900DE8-1DCA-443F-9243-26FF581438AF}"
call DeleteRegBHO "{0E8A89AD-95D7-40EB-8D9D-083EF7066A01}"
call DeleteRegBHO "{10921475-03CE-4E04-90CE-E2E7EF20C814}"
call DeleteRegBHO "{15DEE173-1BE9-4424-81E0-58A87076E9B1}"
call DeleteRegBHO "{1D87B1E5-115E-4B12-87EE-DBED383D8079}"
call DeleteRegBHO "{1FBA04EE-3024-11D2-8F1F-0000F87ABD16}"
call DeleteRegBHO "{1FE48F08-A2AC-44AC-A21C-0556D91C50DA}"
call DeleteRegBHO "{3C6CF3C0-D800-4B4D-A3D8-8ADE406523B6}"
call DeleteRegBHO "{71E129FF-6C2A-4984-818C-7E2C998B8D99}"
call DeleteRegBHO "{72853161-30C5-4D22-B7F9-0BBC1D38A37E}"
call DeleteRegBHO "{77FEF28E-EB96-44FF-B511-3185DEA48697}"
call DeleteRegBHO "{7CE987D5-11B3-44FC-9C3D-03069360D462}"
call DeleteRegBHO "{8984B388-A5BB-4DF7-B274-77B879E179DB}"
call DeleteRegBHO "{8E5E2654-AD2D-48BF-AC2D-D17F00898D06}"
call DeleteRegBHO "{91397D20-1446-11D4-8AF4-0040CA1127B6}"
call DeleteRegBHO "{95B7759C-8C7F-4BF1-B163-73684A933233}"
call DeleteRegBHO "{9961627E-4059-41B4-8E0E-A7D6B3854ADF}"
call DeleteRegBHO "{9E8BF6A5-1979-4D6C-A20D-40557856E78C}"
call DeleteRegBHO "{A4DF5659-0801-4A60-9607-1C48695EFDA9}"
call DeleteRegBHO "{AA58ED58-01DD-4d91-8333-CF10577473F7}"
call DeleteRegBHO "{AE7CD045-E861-484f-8273-0445EE161910}"
call DeleteRegBHO "{AF69DE43-7D58-4638-B6FA-CE66B5AD205D}"
call DeleteRegBHO "{B922D405-6D13-4A2B-AE89-08A030DA4402}"
call DeleteRegBHO "{C93F72A2-2162-4BBA-A07A-F13663C297A6}"
call DeleteRegBHO "{D2CE3E00-F94A-4740-988E-03DC2F38C34F}"
call DeleteRegBHO "{D5FEC983-01DB-414A-9456-AF95AC9ED7B5}"
call DeleteRegBHO "{DBC80044-A445-435b-BC74-9C25C1C588A9}"
call DeleteRegBHO "{E71ECFAA-158B-4027-9A01-1959834A82DB}"
call DeleteRegBHO "{E7E6F031-17CE-4C07-BC86-EABFE594F69C}"
:: HKCR
call DeleteRegEntry "HKCR\*\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegEntry "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegEntry "HKCR\Directory\Background\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegEntry "HKCR\Directory\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegEntry "HKCR\Drive\shellex\ContextMenuHandlers\cdclose"
call DeleteRegEntry "HKCR\Folder\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
reg.exe delete      "HKCR\CLSID\{85BBD920-42A0-1069-A2E4-08002B30309D}" /F >nul 2>nul
:: HKCU
call DeleteRegHKCU  "Software\Hewlett-Packard\HP Share-to-Web"
::call DeleteRegHKCU  "Software\Mail.Ru"
call DeleteRegHKCU  "Software\Media Get LLC"
call DeleteRegHKCU  "Software\zona"
reg.exe delete      "HKCU\Software\Microsoft\Internet Explorer\Approved Extensions" /V "{B922D405-6D13-4A2B-AE89-08A030DA4402}" /F >nul 2>nul
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\Desktop\Components"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\SearchScopes\{2023ECEC-E06A-4372-A1C7-0B49F9E0FFF0}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\SearchScopes\{33BB0A4E-99AF-4226-BDF6-49120163DE86}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\SearchScopes\{E733165D-CBCF-4FDA-883E-ADEF965B476C}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\URLSearchHooks" "{0633EE93-D776-472f-A0FF-E1416B8B2E3D}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\URLSearchHooks" "{09900DE8-1DCA-443F-9243-26FF581438AF}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\URLSearchHooks" "{B580CF65-E151-49C3-B73F-70B13FCA8E86}"
call DeleteRegHKCU  "Software\Microsoft\Internet Explorer\URLSearchHooks" "{B922D405-6D13-4A2B-AE89-08A030DA4402}"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "ADSKAppManager"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Adobe Acrobat Synchronizer"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "AlterGeo"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "amigo"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "CCleaner Monitoring"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Client Server Runtime Subsystem"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "CSRSS"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "DrvUpdater"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "EDLauncher"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "fixhosts"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "fixhosts.exe"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "GameCenterMailRu"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Google Update"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "googletalk"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "HW_OPENEYE_OUC_Connect Manager"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "HW_OPENEYE_OUC_MegaFon | Modem"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "HW_OPENEYE_OUC_MegaFon Internet"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Java developer Script Browse"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "KometaAutoLaunch_40792021E283A369314492FA0F17A1E3"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "KometaLaunchPanel"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "kometaup"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "MAgent"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "MailRuUpdater"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "MSMSGS"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "mylbx"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "NokiaSuite.exe"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "OneDrive"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "OfficeSyncProcess"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "PC Suite Tray"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "pcket_x86"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "pcket_x64"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Pokki"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Praetorian"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Punto Switcher"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "QIP Internet Guardian"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "RtHDVCpl"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "SDP"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Sidebar"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "SkyMonk"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Skype"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "SlimDrivers"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Sony PC Companion"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "SoundMax"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "swg"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "USB Safely Remove"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Yandex.Disk"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run"       "Zona"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\Run\AutorunsDisabled"
call DeleteRegHKCU  "Software\Microsoft\Windows\CurrentVersion\RunOnce"   "FlashPlayerUpdate"
:: HKLM
call DeleteRegHKLMSoftware "Classes\*\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegHKLMSoftware "Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegHKLMSoftware "Classes\Directory\Background\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegHKLMSoftware "Classes\Directory\shellex\ContextMenuHandlers\cdclose"
call DeleteRegHKLMSoftware "Classes\Directory\shellex\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegHKLMSoftware "Classes\Folder\ShellEx\ContextMenuHandlers\XXX Groove GFS Context Menu Handler XXX"
call DeleteRegHKLMSoftware "Clients\StartMenuInternet\IEXPLORE.EXE\shell\open"
call DeleteRegHKLMSoftware "Hewlett-Packard\HP Share-to-Web"
call DeleteRegHKLMSoftware "Hewlett-Packard\HP Software Update"
call DeleteRegHKLMSoftware "Mail.Ru"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{2C7339CF-2B09-4501-B3F3-F3508C9228ED}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{44BBA842-CC51-11CF-AAFA-00AA00B6015B}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{5945C046-1E7D-11D1-BC44-00C04FD912BE}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{6BF52A52-394A-11D3-B153-00C04F79FAA6}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{7790769C-0471-11D2-AF11-00C04FA35D02}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{89820200-ECBD-11CF-8B85-00AA005B4383}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{89820200-ECBD-11CF-8B85-00AA005B4340}"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{60B49E34-C7CC-11D0-8953-00A0C90347FF}MICROS"
call DeleteRegHKLMSoftware "Microsoft\Active Setup\Installed Components\{A6EADE66-0000-0000-484E-7E8A45000000}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{2670000A-7350-4F3C-8081-5663EE0C6C49}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{7558B7E5-7B26-4201-BEDB-00D5FF534523}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{789FE86F-6FC4-46A1-9849-EDE0DB0C95CA}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{7CE987D5-11B3-44FC-9C3D-03069360D462}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{A95FE080-8F5D-11D2-A20B-00AA003C157A}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{D9288080-1BAA-4BC4-9CF8-A92D743DB949}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{E2E2DD38-D088-4134-82B7-F2BA38496583}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Extensions\{FB5F1910-F110-11D2-BB9E-00C04F795683}"
call DeleteRegHKLMSoftware "Microsoft\Internet Explorer\Toolbar"
call DeleteRegHKLMSoftware "Microsoft\uDRM"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellExecuteHooks" "{B5A7F190-DDA6-4420-B3BA-52453494E6CD}"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Groove Explorer Icon Overlay 1 (GFS Unread Stub)"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Groove Explorer Icon Overlay 2 (GFS Stub)"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Groove Explorer Icon Overlay 2.5 (GFS Unread Folder)"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Groove Explorer Icon Overlay 3 (GFS Folder)"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\Groove Explorer Icon Overlay 4 (GFS Unread Mark)"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "2Gis Update Notifier"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AccelerometerSysTrayApplet"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Acrobat Assistant 8.0"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "actx.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Adobe Acrobat Speed Launcher"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Adobe ARM"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Adobe Reader Speed Launcher"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AdobeAAMUpdater-1.0"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AdobeCS5ServiceManager"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AdobeCS5.5ServiceManager"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ADSKAppManager"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Alcmtr"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AlcWzrd"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AlterGeoUpdater"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "AmlMaple"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ApnUpdater"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Apoint"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "apphelper"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "APSDaemon"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "autodetect"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "BaiduAnTray"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "BaiduSdTray"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "BCSSync"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Bonus.SSR.FR10"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Bonus.SSR.FR11"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "BTMTrayAgent"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Client Server Runtime Subsystem"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "DameWare MRC Agent"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "DriveSpace"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "EgisTecPMMUpdate"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "EgisUpdate"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ETDCtrl"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "eTranslator Update"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Everything"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "fixhosts"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "fixhosts.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "FlashPlayerUpdate"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "GismeteoTray"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Guard.Mail.ru.gui"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "GUCI_AVS"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HDAudDeck"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HFALoader"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HotKeysCmds"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HP AutoIndexer"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HP SchedIndexer"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HP Software Update"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HPUsageTracking"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "HPUsageTrackingLEDM"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "IAAnotif"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "IAStorIcon"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "IgfxTray"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ISBMgr.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ISUSPM"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "iTunesHelper"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Java developer Script Browse"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "JMB36X IDE Setup"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Kernel and Hardware Abstraction Layer"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "KernelFaultCheck"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "kxesc"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "LManager"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "MAgent"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "MailRuUpdater"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "MarketingTools"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Microsoft Driver Setup"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NI Background Service"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NokiaMServer"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Norton Online Backup"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NortonOnlineBackupReminder"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Nuance PDF Reader-reminder"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NUSB3MON"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NvCplDaemon"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NvMediaCenter"
::call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "NvSvc"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Nvtmru"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "nwiz"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "OpwareSE4"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "OrderReminder"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "PAC7302_Monitor"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Persistence"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "PLFFAP"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Plugin container"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "PMBVolumeWatcher"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Praetorian"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "praetorian.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "QLBController"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "QlbCtrl.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "QuickTime Task"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "RemoteControl"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ROC_roc_dec12"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "RTHDCPL"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "RtHDVCpl"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "RtsCM"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ScanSoft OmniPage SE 4.0-reminder"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SearchSettings"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ShadowPlay"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Share-to-Web Namespace Daemon"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SHTtray.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SkyTel"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SoundMan"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SoundMAX"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SoundMAXPnP"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SSBkgdUpdate"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "StartCCC"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "StereoLinksInstall"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SuiteTray"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SunJavaUpdateSched"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SwitchBoard"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SynTPEnh"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SysTrayApp"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "SystemScript"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "TkBellExe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "ToolBoxFX"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "UnlockerAssistant"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "UpdateP2GShortCut"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "UpdatePRCShortCut"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "UStorag"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "UVS11 Preload"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "VIAJDS"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "VKSaver"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "vProt"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "WheelMouse"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "WinampAgent"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Windows Mobile Device Center"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "winelir"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "WrtMon.exe"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "XeroxRegistation"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run" "Zune Launcher"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Run\AutorunsDisabled"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Uninstall\BaiduBarX"
call DeleteRegHKLMSoftware "Microsoft\Windows\CurrentVersion\Uninstall\MenuEx"
call DeleteRegHKLMSoftware "Microsoft\Windows NT\CurrentVersion\AeDebug"
call DeleteRegHKLMSoftware "Microsoft\Windows NT\CurrentVersion\Terminal Server\Install\Software\Microsoft\Windows\CurrentVersion\Run" "Java developer Script Browse"
call DeleteRegHKLMSoftware "Microsoft\Windows NT\CurrentVersion\Windows" "AppInit_DLLs"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\2GISUpdateService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\4game-service"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\AdobeARMservice"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\AdobeFlashPlayerUpdateSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\AnviCsbSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\Application Updater"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\aspnet_state"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BaiduHips"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BBSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BBUpdate"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bckd"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bckwfs"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BCUService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bd0001"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bd0002"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bd0003"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\bd0004"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDArKit"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDDefence"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDSafeBrowser"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDSGRTP"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDKVRTP"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDMNetMon"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDMRTP"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDMWrench"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\BDMWrench_x64"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\Changer"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_32"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_64"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_32"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_64"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\CltMngSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\Com4QLBEx"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\comyninu"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\ContentDefender"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\DWMRCS"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\ES lite Service"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\gopibeko"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\Guard.Mail.ru"
for /F %%i in ('reg.exe 2^>nul query "HKLM\SYSTEM\CurrentControlSet\Services"^|%SystemRoot%\System32\find.exe 2^>nul /I "gupdate"') do call DeleteRegEntry "%%~i"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\gusvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\HWDeviceService.exe"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\hyverumu"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\i2omgmt"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\IAANTMON"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\ICQ Service"
::call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\igfxCUIService1.0.0.0"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\IHProtect Service"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\JavaQuickStarterService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\jizirexy"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\KAVBootC"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\KDHacker"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\kisknl"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\kisnetm"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\ksapi"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\kxescore"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\lbrtfdc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\LiveUpdateSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\McComponentHostService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\MDM"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\MegaFon Modem. RunOuc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\MozillaMaintenance"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\MPCKpt"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\MPCProtectService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\NAUpdate"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\NvStreamSvc"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\nvUpdatusService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PCIDump"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PDCOMP"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PDFRAME"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PDRELI"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PDRFRAME"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\PicexaService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\QipGuard"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\qrnfd_1_10_0_12"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\ROMService_Support"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\servervo"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\SkypeUpdate"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\SSUService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\UFDSVC"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\UserAccess"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\VIAKaraokeService"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\vToolbarUpdater10.2.0"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\WDICA"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\WLTRYSVC"
for /F %%i in ('reg.exe 2^>nul query "HKLM\SYSTEM\CurrentControlSet\Services"^|%SystemRoot%\System32\find.exe 2^>nul /I "wsasvc_"') do call DeleteRegEntry "%%~i"
call DeleteRegEntry "HKLM\SYSTEM\CurrentControlSet\Services\xohisiwe"
exit /B