$ProgramName = "App.Name"
$Path_local = "$Env:ProgramData\Microsoft\IntuneManagementExtension\Logs"
Start-Transcript -Path "$Path_local\$ProgramName-uninstall.log" -Force -Append

# resolve winget_exe
$winget_exe = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_*__8wekyb3d8bbwe\winget.exe"
if ($winget_exe.count -gt 1){
        $winget_exe = $winget_exe[-1].Path
}

if (!$winget_exe){Write-Error "Winget not installed"}

& $winget_exe uninstall --exact --id $ProgramName --silent --accept-source-agreements

Stop-Transcript
