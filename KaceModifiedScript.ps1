#Retreive the last modified date for the KACE amp.conf file
ForEach ($system in (Get-Content "C:\Burwood Powershell Outputs\comps.txt")) {
    # It's easier to have file path in a variable
    $conf = "\\$system\c`$\ProgramData\Quest\KACE\amp.conf"

    # Is the conf there?    
    if  ( Test-Path  $conf){
        # Yup, get the version info
        $ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($conf).FileVersion
        # Get last modified time to file 
        #$dll2 = get-item "\\$system\c`$\ProgramData\Quest\KACE\amp.conf"  | Select LastWriteTime
        $dll2 = (get-item "\\$system\c`$\ProgramData\Quest\KACE\amp.conf").LastWriteTime 

        Add-Content -path "C:\Burwood Powershell Outputs\results2.csv" "$system,$dll2"
    }
    Else {
        Add-Content -path "C:\Burwood Powershell Outputs\results2.csv" "$system,'Null'"
}
}