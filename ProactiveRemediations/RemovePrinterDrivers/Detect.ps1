# Detection Script

# Define the printer and driver names to look for
$printerName = "OneNote (Desktop)"
$driverName = "Send to Microsoft OneNote 16 Driver"

# Check if the printer exists
$printer = Get-Printer -Name $printerName -ErrorAction SilentlyContinue

# Check if the printer driver exists
$driver = Get-PrinterDriver -Name $driverName -ErrorAction SilentlyContinue

# If either the printer or driver exists, output a message and exit with code 1 (indicating the issue exists)
if ($printer -or $driver) {
    Write-Host "Either printer or driver detected"
    exit 1
} else {
    # If neither the printer nor driver exists, exit with code 0 (indicating no issue)
    Write-Host "Neither printer nor driver detected"
    exit 0
}
