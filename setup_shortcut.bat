@echo off
setlocal
set "TARGET_BAT=%~dp0start_antigravity.bat"
set "SHORTCUT_PATH=%USERPROFILE%\Desktop\Antigravity (Proxy).lnk"
set "ICON_PATH=%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"

powershell -NoProfile -Command ^
  "$ws = New-Object -ComObject WScript.Shell; " ^
  "$s = $ws.CreateShortcut('%SHORTCUT_PATH%'); " ^
  "$s.TargetPath = 'cmd.exe'; " ^
  "$s.Arguments = '/c `\"%TARGET_BAT%`\"'; " ^
  "$s.IconLocation = '%ICON_PATH%,0'; " ^
  "$s.WindowStyle = 7; " ^
  "$s.Save()"

echo 快捷方式已成功生成到桌面：Antigravity (Proxy)
pause
