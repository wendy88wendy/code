@ECHO OFF
taskkill /f /im ShadowsocksR-dotnet4.0* /T >NUL 2>NUL
taskkill /f /im ShadowsocksR-dotnet2.0* /T >NUL 2>NUL
::删除相关残留文件
::清除桌面和开始菜单快捷方式
rd/s/q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR" >NUL 2>NUL
del /q "%Public%\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
del /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR.lnk" >NUL 2>NUL
del /q "%UserProfile%\Desktop\ShadowsocksR.lnk" >NUL 2>NUL
rd/s/q "%AppData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR" >NUL 2>NUL
rd/s/q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR" >NUL 2>NUL


::创建桌面和根目录快捷方式
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""%~sdp0\"") & ""ShadowsocksR.lnk""):b.TargetPath=""C:\Program Files\ShadowsocksR-win-4.9.2\ShadowsocksR-dotnet2.0.exe"":b.WorkingDirectory=""%~sdp0"":b.Save:close")
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ShadowsocksR.lnk""):b.TargetPath=""C:\Program Files\ShadowsocksR-win-4.9.2\ShadowsocksR-dotnet2.0.exe"":b.WorkingDirectory=""%~sdp0Program"":b.Save:close")

::创建开始菜单快捷方式
copy "C:\Program Files\ShadowsocksR-win-4.9.2\ShadowsocksR.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\">NUL
mkdir "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR">NUL
copy "C:\Program Files\ShadowsocksR-win-4.9.2\ShadowsocksR.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR\">NUL
copy "C:\Program Files\ShadowsocksR-win-4.9.2\卸载ShadowsocksR.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\ShadowsocksR\">NUL
ECHO.&ECHO 完成 &TIMEOUT /t 2 >NUL&EXIT