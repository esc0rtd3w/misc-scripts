@echo off

color 0e

set bits=x86

if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64


:: Set Default sfk.exe Path
set sfk="%windir%\system32\sfk.exe"
set np="%windir%\system32\notepad.exe"

if %bits%==x86 (

	set npp="%ProgramFiles%\Notepad++\notepad++.exe"

)

if %bits%==x64 (

	set npp="%ProgramFiles(x86)%\Notepad++\notepad++.exe"

)


:: Set default text reader
set openText=%np%


:: Set Notepad++ as default if detected
if exist %npp% (

	set openText=%npp%

)



:reset

set currentDir=.
set textFile="%temp%\findstuff_tmp.txt"
set findWhat=
set findWhere=



if not exist %sfk% (

	goto noSFK

)


cls
echo Find What?
echo.
echo.

set /p findWhat=


:: Setting default path to find as current directory
set findWhere=%currentDir%

cls
echo Search For "%findWhat%" In What Directory?
echo.
echo.

set /p findWhere=



cls
echo Looking For "%findWhat%" In "%findWhere%"....
echo.
echo.
%sfk% find "%findWhere%" %findWhat%>%textFile%


::%np% %textFile%
%openText% %textFile%


goto reset


:noSFK

set sfk=none

cls
echo No sfk.exe binary found!
echo.
echo Where is sfk.exe?
echo.
echo.

set /p sfk=

if %sfk%==none (

	goto end

)

goto reset



:end



