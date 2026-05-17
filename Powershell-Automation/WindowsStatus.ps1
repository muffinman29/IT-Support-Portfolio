# Define the output file path
$outputFile = "C:\Temp\report.txt"

# Clear the file if it exists
if (Test-Path $outputFile) {
    Clear-Content $outputFile
}

# Run multiple commands and append results
Get-Date | Out-File -FilePath $outputFile -Encoding UTF8
"--- System Information ---" | Out-File -FilePath $outputFile -Append
Get-PSDrive -PSProvider FileSystem | Out-File -FilePath $outputFile -Append
GET-Process | Sort-Object CPU -Descending | Select-Object -First 10 | Out-File -FilePath $outputFile -Append

"--- Network Connectivity ---" | Out-File -FilePath $outputFile -Append
Test-Connection -ComputerName google.com -Count 2 | Out-File -FilePath $outputFile -Append


"--- Windows Update Status ---" | Out-File -FilePath $outputFile -Append
Get-WindowsUpdateLog | Out-File -FilePath $outputFile -Append
