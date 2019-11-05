Start-Process 'C:\windows\system32\notepad.exe'
Get-Process -Name Notepad

$procid=get-process Notepad |select -expand id
Stop-Process -Id $procid


[int]$RunningProcesses = Get-Service | Where-Object {$_.Status -eq "Running"} | Measure-Object -Line | Select-Object -ExpandProperty Lines
Get-Service | Where-Object {$_.Status -eq "Running"}

[int]$StoppedProcesses = Get-Service | Where-Object {$_.Status -eq "Stopped"} | Measure-Object -Line | Select-Object -ExpandProperty Lines
Get-Service | Where-Object {$_.Status -eq "Stopped"}

Write-Host "There are " $RunningProcesses " proccesses currently running"
Write-Host "There are " $StoppedProcesses " proccesses currently stopped"
