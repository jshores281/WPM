
echo off
:NETWORKSHELL MENU
doskey /listsize=0
cls
echo.
echo  :WIRELESS PROFILE MANAGER  [Version 1.4.10]:
echo  ::::::WPM SCRIPT:::::::::BY:JShores:::::::::
echo  ::::3..2..1..LETS::JAM::::::::::::::::::::::
echo.
netsh wlan show profiles
echo.
echo Options
echo ----------------------
:: echo [0] - PRO CONNECT
echo [1] - GET INFO
echo [2] - GET KEY
echo [3] - PRO PURGE
echo [4] - EXIT
echo.
set /p input="Type a number: "

if %input%==0 goto :SSIDCONNECT
if %input%==1 goto :SSIDINFO
if %input%==2 goto :SSIDKEY
if %input%==3 goto :SSIDELETE
if %input%==4 goto EXIT
cls 
goto :EXIT
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:EXIT
echo EXITTING
timeout 3
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
echo.
echo Options
echo ----------------------
echo Type [SSID] for its info:
echo Type [back] to go back.
echo.
set /p input="CHOOSE YOUR OPTION: "
set input="%input%"
::echo %input%
::pause

if %input%==input goto :ssidinfo0
if %input%=="back" goto :NETWORKSHELL

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ssidinfo0
cls
netsh wlan show profile name=""%input%"" 
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
echo.
echo Options
echo ----------------------
echo Type [SSID] to get password: 
echo Type [BACK] to go back.
echo.
set /p input="CHOOSE AN OPTION: "
set input="%input%"
::echo %input%
::pause
if %input%==input goto :ssidkey0
if %input%=="back" goto :NETWORKSHELL
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ssidkey0
echo.
echo.
echo NETWORKSHELL SSID KEY 
echo.
echo.
netsh wlan show profiles name=""%input%"" key=clear | findstr Key
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
echo.

echo Options
echo ----------------------
echo DELETE one profile = [SSID]
echo DELETE all profiles = [*] 
echo Type [back] to go back
echo.
set /p input="CHOOSE AN OPTION: "
set input="%input%"
::echo %input%
::pause
if %input%=="input" goto :delete0
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
netsh wlan delete profile name=""%input%"" interface=*
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
echo Type [back] to go back.
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