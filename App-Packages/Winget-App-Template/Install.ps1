# Define the name of the program being installed
$ProgramName = "App.Name"

# Set the path for logging as the default Intune logs folder for easy diagnostic collection
$Path_local = "$Env:ProgramData\Microsoft\IntuneManagementExtension\Logs"

# Start transcript logging to record script output and errors, appending to a log file named based on the program name
Start-Transcript -Path "$Path_local\$ProgramName-install.log" -Force -Append

# Resolve the path to the winget executable
$winget_exe = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_*__8wekyb3d8bbwe\winget.exe"

# If multiple versions of winget.exe are found, select the latest one
if ($winget_exe.count -gt 1){
    $winget_exe = $winget_exe[-1].Path
}

# Check if winget.exe was found, if not, write an error message
if (!$winget_exe){
    Write-Error "Winget not installed"
}

# Run the winget command to install the specified program silently and accept package and source agreements
& $winget_exe install --exact --id $ProgramName --silent --accept-package-agreements --accept-source-agreements --scope=machine $param

# Stop the transcript logging
Stop-Transcript
