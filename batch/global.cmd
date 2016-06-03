@echo off

:: Generic Common Global Variables List

:: Maintained by esc0rtd3w




:: ---------------------------------------------------------------------------------------
:: Check Architecture Bits
:: ---------------------------------------------------------------------------------------
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64
if not exist "%windir%\SysWOW64" set bits=x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Check Operating System
:: ---------------------------------------------------------------------------------------

:: Set Default OS
set ostype=windows

:: Check common OS versions
ver | find "5.1"
if %errorlevel%==0 set ostype=xp
ver | find "6.0"
if %errorlevel%==0 set ostype=vista
ver | find "6.1"
if %errorlevel%==0 set ostype=win7
ver | find "6.2"
if %errorlevel%==0 set ostype=win8
ver | find "6.3"
if %errorlevel%==0 set ostype=win81
ver | find "6.4"
if %errorlevel%==0 set ostype=win10

:: This is the new versioning for Windows 10 (Started sometime in 2015/2016)
ver | find "10."
if %errorlevel%==0 set ostype=win10
ver | find "10.0"
if %errorlevel%==0 set ostype=win10
ver | find "10.1"
if %errorlevel%==0 set ostype=win10
ver | find "10.2"
if %errorlevel%==0 set ostype=win10
ver | find "10.3"
if %errorlevel%==0 set ostype=win10
ver | find "10.4"
if %errorlevel%==0 set ostype=win10
ver | find "10.5"
if %errorlevel%==0 set ostype=win10
ver | find "10.6"
if %errorlevel%==0 set ostype=win10
ver | find "10.7"
if %errorlevel%==0 set ostype=win10
ver | find "10.8"
if %errorlevel%==0 set ostype=win10
ver | find "10.9"
if %errorlevel%==0 set ostype=win10
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: PCL Core Begins Here
:: ---------------------------------------------------------------------------------------
set debugMode=0
set zeroByteFile=0

set titleText=Global Variable Initialization Script

set menuItem=999
set exitStatus=return

set fileAccess=0

:: Check Safe Mode
set safeModeState=0
set safeModeCheck=1

:: Check PE Mode
set peModeState=0
set peModeCheck=1

set virtualDriveLetter=0


:: Set default UAC status
set uacStatus=Disabled
:: ---------------------------------------------------------------------------------------



:: ---------------------------------------------------------------------------------------
:: Global Path Names
:: ---------------------------------------------------------------------------------------

:: Common OS Paths
set pf=%systemdrive%\Program Files
set cf=%systemdrive%\Program Files\Common Files
set pf64=%systemdrive%\Program Files (x86)
set cf64=%systemdrive%\Program Files (x86)\Common Files
set pd=%ProgramData%
set pdxp=%UserProfile%\Application Data\
set adl=%LocalAppData%
set adll=%SystemDrive%%HomePath%\AppData\LocalLow
set adr=%AppData%
set au=%SystemDrive%\All Users
set auxp=%systemdrive%\Documents and Settings\All Users
set cu=%UserProfile%
set cuxp=%userprofile%\Application Data
set win=%windir%
set sys32=%windir%\system32
set cookies=%AppData%\Microsoft\Windows\Cookies
set sysProfile=%windir%\system32\config\systemprofile

:: Temp Paths
::set temp=%temp%
set tempRoot=%systemdrive%\temp
set tempWindows=%windir%\temp
set tempSystemADL=%windir%\system32\config\systemprofile\AppData\Local\Temp

:: Desktop Paths
set desktop=%SystemDrive%%HomePath%\Desktop
::set desktop=%UserProfile%\Desktop
set desktopAU=%public%\Desktop

:: Start Menu Paths
set startMenu=%AppData%\Microsoft\Windows\Start Menu\Programs
set startMenuAU=%systemdrive%\Users\All Users\Microsoft\Windows\Start Menu\Programs

:: Documents Paths
set docs=%UserProfile%\Documents
set docsAU=%Public%\Documents

:: Default Common User Paths
set contacts=%UserProfile%\Contacts
set favorites=%UserProfile%\Favorites
set links=%UserProfile%\Links
set savedgames=%UserProfile%\Saved Games
set searches=%UserProfile%\Searches

:: XP Default Common User Paths
set documentsXP=%UserProfile%\My Documents
set downloadsXP=%mydocuments%\Downloads
set picturesXP=%UserProfile%\My Pictures
set musicXP=%UserProfile%\My Music
set videosXP=%UserProfile%\My Videos

:: Windows 7+ Default Common User Paths
set documents=%UserProfile%\Documents
set downloads=%UserProfile%\Downloads
set pictures=%UserProfile%\Pictures
set music=%UserProfile%\Music
set videos=%UserProfile%\Videos

:: System User Paths
set sysUserRoot=%windir%\system32\config\systemprofile
set sysUserAppData=%windir%\system32\config\systemprofile\AppData
set sysUserAppDataLocal=%windir%\system32\config\systemprofile\AppData\Local
set sysUserAppDataLocalLow=%windir%\system32\config\systemprofile\AppData\LocalLow
set sysUserAppDataRoaming=%windir%\system32\config\systemprofile\AppData\Roaming
set sysUserDesktop=%windir%\system32\config\systemprofile\Desktop
set sysUserDocuments=%windir%\system32\config\systemprofile\Documents
set sysUserDownloads=%windir%\system32\config\systemprofile\Downloads
set sysUserFavorites=%windir%\system32\config\systemprofile\Favorites
set sysUserMusic=%windir%\system32\config\systemprofile\Music
set sysUserPictures=%windir%\system32\config\systemprofile\Pictures
set sysUserVideos=%windir%\system32\config\systemprofile\Videos
:: ---------------------------------------------------------------------------------------



:: ---------------------------------------------------------------------------------------
:: File Variables and References To Files Begin Here
:: ---------------------------------------------------------------------------------------

set openFolder="%windir%\explorer.exe"

:: Virtual Drive Letter Related
set /p virtualPath=<"%temp%\virtualPath.tmp"
set /p virtualDriveLetter=<"%temp%\virtualDriveLetter.tmp"
set virtualDriveLetter=%virtualDriveLetter%:
set virtualTempDriveCreate=subst %virtualDriveLetter% "%virtualPath%"
set virtualTempDriveDestroy=subst %virtualDriveLetter% /d
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Time and Date Stuff
:: ---------------------------------------------------------------------------------------
setlocal enabledelayedexpansion
set currentDate=!date:~10,4!!date:~4,2!!date:~7,2!
set currentTime=!time:~0,2!!time:~3,2!!time:~6,2!
echo %currentDate%>"%pclTempTemp%\date.id"
echo %currentTime%>"%pclTempTemp%\time.id"
endlocal

set /p currentDate=<"%pclTempTemp%\date.id"
set /p currentTime=<"%pclTempTemp%\time.id"
set currentDateTime=%currentDate%_%currentTime%
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Web Browser Paths
:: ---------------------------------------------------------------------------------------
set browserAvant=Avant Browser\avant.exe
set browserChrome=Google\Chrome\Application\chrome.exe
set browserComodoDragon=Comodo\Dragon\dragon.exe
set browserComodoIceDragon=Comodo\IceDragon\icedragon.exe
set browserFirefox=Mozilla Firefox\firefox.exe
set browserFlock=Flock\flock.exe
set browserKMeleon=K-Meleon\k-meleon.exe
set browserMaxthon=Maxthon\Bin\Maxthon.exe
set browserNetscape=Netscape\Navigator 9\navigator.exe
set browserNetscape6=Netscape\Navigator 6\navigator.exe
set browserNetscape7=Netscape\Navigator 7\navigator.exe
set browserNetscape8=Netscape\Navigator 8\navigator.exe
set browserNetscape9=Netscape\Navigator 9\navigator.exe
set browserOpera=Opera\opera.exe
set browserSafari=Opera\safari.exe
set browserSeaMonkey=SeaMonkey\seamonkey.exe
set browserTorch=Torch\torch.exe
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: MSI Stuff
:: ---------------------------------------------------------------------------------------
set msiexec=msiexec
set msiExtract=msiexec /a
set msiUninstall=msiexec /x
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: WGET options
:: ---------------------------------------------------------------------------------------

:: User Agents
:: Default User Agent
set userAgent=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0"

:: Common User Agents
set userAgentBlank=--user-agent=""
set userAgentFirefox=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"
set userAgentIE=--user-agent="Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; en-US)"
set userAgentGoogleBot=--user-agent="Googlebot/2.1 (+http://www.googlebot.com/bot.html)"

:: Firefox User Agents
set userAgentFirefoxLinux=--user-agent="Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/31.0"
set userAgentFirefoxMac=--user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0"
set userAgentFirefoxWindows=--user-agent="Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0"

:: IE User Agents
set userAgentIE11=--user-agent="Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0;  rv:11.0) like Gecko"
set userAgentIE10=--user-agent="Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)"
set userAgentIE9=--user-agent="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; en-US)"
set userAgentIE8=--user-agent="Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; en-US)"
set userAgentIE7=--user-agent="Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.1; en-US)"
set userAgentIE6=--user-agent="Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.1; en-US)"
set userAgentIE5=--user-agent="Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)"
set userAgentIE4=--user-agent="Mozilla/4.0 (compatible; MSIE 4.0; Windows 98)"
set userAgentIE3=--user-agent="Mozilla/4.0 (compatible; MSIE 3.0; Windows 95)"
set userAgentIE2=--user-agent="Mozilla/4.0 (compatible; MSIE 2.0; Windows 95)"

:: Headers
:: Default Header
set header=--header="Accept: text/html"

:: Common Headers
set headerAccept=--header="Accept: text/html"
set headerHTML=--header="Accept: text/html"
set headerEXE=--header="application/octet-stream"
set headerZIP=--header="application/x-zip-compressed"
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Display Text
:: ---------------------------------------------------------------------------------------
set textViewer=notepad
set textShow=start "" "%windir%\notepad.exe"
set textShowWait=start /wait "" "%windir%\notepad.exe"
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: File I/O Stuff
:: ---------------------------------------------------------------------------------------
set xcopy=xcopy /y
set xcopyNoClobber=xcopy
set xcopyFullPath=xcopy /e /y /h /d /c /r /i

:: Unix Style Commands
set cp=xcopy /e /y
set cp2=xcopy /y
set cp3=xcopy /e /y /h /d /c /r /i
set cp4=xcopy /e /y /h /d /c /r /i /s
set copy=copy /y
set copyNoClobber=copy
set del=del /f /q
set rm=del /f /q
set rmsubNoForce=del /s /q
set rmsub=del /f /s /q
set rmdir=rd /s /q
set mkdir=md
set kill=taskkill /f /im
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Scheduled Tasks Options
:: ---------------------------------------------------------------------------------------
set taskCreate=schtasks /create /tn
set taskDelete=schtasks /delete /tn
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Services Stuff
:: ---------------------------------------------------------------------------------------
set svcCreate=sc create
set svcDelete=sc delete
set svcStop=net stop
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Registry Stuff
:: ---------------------------------------------------------------------------------------
set reg=reg
set regForce=reg /f
set regForceAdd=reg add /f
set regAdd=reg add
set regForceDelete=reg delete /f
set regDelete=reg delete
set regQuery=reg query /f
::set regQuery="%windir%\System32\reg.exe" query

set regImportFromFile=regedit /s


:: Registry Paths

set regHKCR=HKEY_CLASSES_ROOT
set regHKCU=HKEY_CURRENT_USER
set regHKLM=HKEY_LOCAL_MACHINE
set regHKU=HKEY_USERS
set regHKCC=HKEY_CURRENT_USER
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: UAC Related
::set regQueryUacStatusVista="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA | find "0x0"
set regQueryUacStatusVista="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA
set regQueryUacStatusWin7=%regQueryUacStatusVista%
set regQueryUacStatusWin8="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin
set regQueryUacStatusWin81=%regQueryUacStatusWin8%
set regQueryUacStatusWin10=%regQueryUacStatusWin8%
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Default Run As Administrator
:: ---------------------------------------------------------------------------------------
set runAsAdministrator=runas /user:administrator
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Shutdown Commands
:: ---------------------------------------------------------------------------------------
set shutdown="%windir%\system32\shutdown.exe" -s -t 0
set reboot="%windir%\system32\shutdown.exe" -r -t 0
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: External CMD Options
:: ---------------------------------------------------------------------------------------
set runShellNoTerminateAndWait=cmd /k
set runShellNoTerminate=start cmd /k
set runShellWaitNoTerminate=start /wait cmd /k
set runShellTerminateAndWait=cmd /c
set runShellTerminate=start cmd /c
set runShellWaitTerminate=start /wait cmd /c
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Setting pwnERSHIP Commands
:: ---------------------------------------------------------------------------------------
set pwnLeft=takeown /f
set pwnRight=/a /r
set pwnLeft2=icacls
set pwnRight2=/grant:r User:F /T
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Other system commands
:: ---------------------------------------------------------------------------------------
set ws=wscript //nologo
:: ---------------------------------------------------------------------------------------


:: ---------------------------------------------------------------------------------------
:: Printing Related
:: ---------------------------------------------------------------------------------------
set printerSpoolerStop=net stop spooler
set printerSpoolerStart=net start spooler

set printerSpoolPathMain=%systemroot%\system32\spool
set printerSpoolPath=%systemroot%\system32\spool\PRINTERS
set printerSpoolPathWild=%systemroot%\system32\spool\PRINTERS\*
:: ---------------------------------------------------------------------------------------



cls
set
echo.
echo.
pause
echo.
echo.

