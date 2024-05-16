# Remediation Script

# Define the printer and driver names to remove
$printerName = "OneNote (Desktop)"
$driverName = "Send to Microsoft OneNote 16 Driver"

try {
    # Check if the printer exists and remove it
    $printer = Get-Printer -Name $printerName -ErrorAction SilentlyContinue
    if ($printer) {
        Remove-Printer -Name $printerName -ErrorAction Stop
        Write-Host "Printer removed: $printerName"
    } else {
        Write-Host "Printer not found: $printerName"
    }

    # Check if the printer driver exists and remove it
    $driver = Get-PrinterDriver -Name $driverName -ErrorAction SilentlyContinue
    if ($driver) {
        Remove-PrinterDriver -Name $driverName -ErrorAction Stop
        Write-Host "Printer driver removed: $driverName"
    } else {
        Write-Host "Printer driver not found: $driverName"
    }

    # Exit with code 0 (indicating success)
    exit 0
} catch {
    # If an error occurs, output the error message and exit with code 1 (indicating failure)
    $errMsg = $_.Exception.Message
    Write-Host "Error occurred: $errMsg"
    exit 1
}
