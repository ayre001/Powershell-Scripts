# Set the program name for logging purposes
$ProgramName = "Winget"

# Define the path for storing the log files
$Path_local = "$Env:ProgramData\Microsoft\IntuneManagementExtension\Logs"

# Start the transcript to log the script execution details
Start-Transcript -Path "$Path_local\$ProgramName-install.log" -Force -Append

# Attempt to install Winget and its dependencies
try {
    # Add the provisioned Appx package for Winget along with its dependencies
    Add-ProvisionedAppxPackage -online -PackagePath ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -DependencyPackagePath ".\Microsoft.VCLibs.x64.14.00.Desktop.appx", ".\Microsoft.UI.Xaml.2.7.x64.appx" -SkipLicense
    
    # Log success message if Winget is installed successfully
    Write-Host "Winget installed successfully"
} catch {
    # Log error message if the installation fails
    Write-Host "Failed to install Winget"
    
    # Stop the transcript
    Stop-Transcript
    
    # Exit the script with an error code
    exit 1
}

Stop-Transcript
exit 0
