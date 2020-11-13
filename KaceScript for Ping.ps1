##KACE
##Check if computer is powered on and write to file
Get-Content "C:\Burwood Powershell Outputs\comps.txt" | ForEach-Object{
$pingstatus = ""
IF (Test-Connection -BufferSize 32 -Count 1 -ComputerName $_ -Quiet) {
        $pingstatus = "Online"
} Else {
        $pingstatus = "Offline"
}

New-Object -TypeName PSObject -Property @{
      Computer = $_
      Status = $pingstatus }
} | Export-Csv "C:\Burwood Powershell Outputs\PingStatus.csv" -NoTypeInformation -Encoding UTF8

