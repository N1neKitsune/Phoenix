function Createnode {
    terraform.exe init 
    terraform.exe plan 
    terraform.exe apply 
}

$path = Get-Location

try {
    Set-Location -Path $path'\C2_Ubuntu-20' -ErrorAction Stop
    Createnode
}
catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
}


try {
    Set-Location -Path $path'\PhishingServ_Ubuntu-20' -ErrorAction Stop
    Createnode
}
catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
}

Set-Location $path
