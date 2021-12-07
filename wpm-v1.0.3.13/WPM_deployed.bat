::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBFHRAuQAFuzBaEJ+u3o09mGtEgZFNI2e5vOyLGdHPcW6AX0fI4R33lV39gwCxRWZB36US0msFFLtWuLec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdFy5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdFy5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaH0rbXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbSXa
::ZQ05rAF9IAHYFVzEqQIHGDYUfyewFVuOZg==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQInIQlRQAGRLyuqFLoa4eT+r+eGrEwaUfBf
::dhA7uBVwLU+EWFOF7VY1KxM0
::YQ03rBFzNR3SWATE/kMpPB5XRETi
::dhAmsQZ3MwfNWATE/kMpPB5XRGQ=
::ZQ0/vhVqMQ3MEVWAtB9wMR5HLA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBFHRAuQAE+/Fb4I5/jH+PqKnloNWaw6YIq7
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::WIRELESS PROFILE MANAGER::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::**NOTES**:::::::::::::::::::::::::::::::::::::::::::::::::
:: MAKE REQUIRE SU::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo off
:NETWORKSHELL MENU
doskey /listsize=0
cls
echo.
echo  :WIRELESS PROFILE MANAGER  [Version 1.3.10]:
echo  ::::::::::::::::::::::::::::::::::::::::::::
echo  ::::::WPM SCRIPT::::::::::::::::::::::::::::
echo  ::::::by: JShores:::::::::::::::::::::::::::
echo  ::::::::::::::::::::::::::::::::::::::::::::
echo  ::::3..2..1.LETS GO:::::::::::::::::::::::::
echo.
netsh wlan show profiles
echo.
echo.
:: echo [0] - PRO CONNECT
echo [1] - GET INFO
echo [2] - GET KEY
echo [3] - PRO PURGE
echo [4] - EXIT
echo.
echo.
echo.
set /p input="pick your path: "

if %input%==0 goto :SSIDCONNECT
if %input%==1 goto :SSIDINFO
if %input%==2 goto :SSIDKEY
if %input%==3 goto :SSIDELETE
if %input%==4 goto EXIT
cls 
goto :EXIT
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:EXIT
exit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SSIDINFO
cls
doskey /listsize=0
echo.
echo NETWORK INFO SSID INFO MENU
echo.
echo 
echo.
netsh wlan show profiles
set /p input="Type SSID For Info?  "
if %input%==input goto :ssidinfo0
if %input%==back goto :NETWORKSHELL

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ssidinfo0
cls
netsh wlan show profile name="%input%" 
pause
goto :SSIDINFO
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SSIDKEY
cls
doskey /listsize=0
echo.
echo.
echo NETWORKSHELL SSID KEY MENU
echo.
netsh wlan show profiles
set /p input="Type Your SSID? "
if %input%==input goto :ssidkey0
if %input%==back goto :NETWORKSHELL
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ssidkey0
echo.
echo.
echo NETWORKSHELL SSID KEY 
echo.
echo.
netsh wlan show profiles name="%input%" key=clear | findstr Key
echo.
echo.
pause
cls
goto :SSIDKEY
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SSIDELETE
cls
doskey /listsize=0
echo.
echo.
echo SSID DELETE MENU
echo.
netsh wlan show profiles
set /p input="Type SSID To Del? "
if %input%==input goto :delete0
if %input%=="*" goto :DFE
if %input%==back goto :NETWORKSHELL
cls
goto :NETWORKSHELL MENU
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:delete0
echo %input%
echo.
echo.
pause
netsh wlan delete profile name="%input%" interface=*
echo.
pause
goto :SSIDELETE
cls 
goto :exit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:DFE
::exclude a ssid here/GHOST
::save password export func to text, import for connect?
pause
netsh wlan delete profile name=* interface=*
pause
goto :NETWORKSHELL MENU
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SSIDCONNECT
cls

echo PRO CONNECT
::requires su 
echo.
echo.
echo [1] - WIFI ENABLE
echo [2] - WIFI DISABLE
echo.
echo.
set /p input="Choose Wi-Fi state: "
if %input%==1 goto :wifion
if %input%==2 goto :wifioff
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:wifioff
netsh interface set interface wi-fi disable
pause
cls
goto :connex
:wifion
netsh interface set interface wi-fi enable
pause
cls
goto :connex
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:connex
doskey /listsize=0
echo.
echo.
echo PRO CONNECT
echo.
echo.
netsh wlan show networks
echo.
echo.
set /p input="Type SSID To Connect: "
if %input%==input goto :execonnex
if %input%==back goto :NETWORKSHELL MENU
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:execonnex
netsh wlan connect name=%input%
pause
cls
goto :NETWORKSHELL MENU
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::