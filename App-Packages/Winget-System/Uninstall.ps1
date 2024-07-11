$ProgramName = "Winget"
$Path_local = "$Env:ProgramData\Microsoft\IntuneManagementExtension\Logs"
Start-Transcript -Path "$Path_local\$ProgramName-uninstall.log" -Force -Append

try {
	Remove-AppxPackage -Package "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -AllUsers
	Write-Host "Winget unistalled successfully"
} catch {
	Write-Host "Failed to uninstall Winget"
	Stop-Transcript
	exit 1
}

Stop-Transcript
exit 0
