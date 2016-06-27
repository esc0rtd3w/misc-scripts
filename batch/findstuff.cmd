@echo off

:: Set Default sfk.exe Path
set sfk="%windir%\system32\sfk.exe"

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

notepad %textFile%


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



