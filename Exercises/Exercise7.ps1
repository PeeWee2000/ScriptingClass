Clear
$date = Get-Date -Format "dddd-MM-yyyy-HH:mm"
$year = Get-Date -Format "yyyy"
$month = Get-Date -Format "MM"
$day = Get-Date -Format "dddd"
$filename = "RiderHarrison" + $month + "-" + $day + "-" + $year + ".txt"
Write-Host $date
Write-Host $year
New-Item -Path . -Name $year -ItemType "directory"
New-Item -Path .\$year -Name $month -ItemType "directory"
New-Item -Path .\$year\$month -Name $day -ItemType "directory"
New-Item -Path .\$year\$month\$day -Name $filename -ItemType "file"
