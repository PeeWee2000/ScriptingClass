Get-Process | Out-File -FilePath .\Process.txt
Start-Process 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Get-Process | Out-File -FilePath .\Process.txt
#I'd do this like the exercise says but its against my belief of doing things the easiest way possible
$procid=get-process Chrome |select -expand id
Stop-Process -Id $procid
