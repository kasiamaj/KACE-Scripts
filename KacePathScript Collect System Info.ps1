#Check if KACE is installed on computer
ForEach ($system in (Get-Content "C:\Burwood Powershell Outputs\comps.txt")) {
    # It's easier to have file path in a variable
    $exe = "\\$system\c`$\Program Files (x86)\Quest\KACE\amptools.exe"

    # Is the Exe there?    
    if  ( Test-Path  $exe){
        # Yup, get the version info
        $ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($exe).FileVersion
        # Write file path and version into a file.  
        Add-Content -path "C:\Burwood Powershell Outputs\results.csv" "$system,$exe,$ver"
    }
    Else {
    Add-Content -path "C:\Burwood Powershell Outputs\results.csv" "$system,'false'"
}
}