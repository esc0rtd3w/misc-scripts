@echo off


:: esc0rtd3w 2016

:: https://github.com/esc0rtd3w



:reset

set disable=0
set enable=0
set state=%1
set stateText=0

if not defined state set state=invalid
if "%state%"=="" set state=invalid

if %state%==disabled set state=disable
if %state%==enabled set state=enable

if %state%==disable set stateText=Disabled
if %state%==enable set stateText=Enabled
if %state%==invalid set stateText=Invalid

if not %state%==invalid (

	cls
	echo Firewall Is %stateText%
	echo.
	echo.
	
	netsh advfirewall set global StatefulFTP %state%
	
) else (

	cls
	echo Toggle State Is Invalid
	echo.
	echo.
	echo ENABLE [toggleFirewall enabled]
	echo.
	echo DISABLE [toggleFirewall disabled]
	echo.
	echo.

	pause
	
)



:end

echo.
echo.

