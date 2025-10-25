@ECHO OFF&(PUSHD "%~DP0")&(REG QUERY "HKU\S-1-5-19">NUL 2>&1)||(
powershell -Command "Start-Process '%~sdpnx0' -Verb RunAs"&&EXIT)

taskkill /f /im ShadowsocksR-dotnet4.0* /T >NUL 2>NUL
taskkill /f /im ShadowsocksR-dotnet2.0* /T >NUL 2>NUL



CLS
ECHO.&ECHO wendy-ip.com
ECHO 确认卸载？
ECHO 1、确认
ECHO 2、取消

CHOICE /C 12 /N >NUL 2>NUL

IF "%ERRORLEVEL%"=="2" (exit)
  
IF "%ERRORLEVEL%"=="1" (
::清除桌面和开始菜单快捷方式
del /q "%Public%\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
del /q "%UserProfile%\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
del /q "D:\Users\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
del /q "D:\Users\Administrator\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
del /q "C:\Users\Administrator\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
rd/s/q "%AppData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR" >NUL 2>NUL
rd/s/q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR" >NUL 2>NUL
del /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR.lnk" >NUL 2>NUL
del /q "C:\Program Files\ShadowsocksR-win-4.9.2\*" >NUL 2>NUL
rd/s/q "C:\Program Files\ShadowsocksR-win-4.9.2" >NUL 2>NUL
ELSE (
    PUSHD .. & RD /S/Q "%~DP0" 2>NUL))