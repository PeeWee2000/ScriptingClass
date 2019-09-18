Start-Process 'C:\windows\system32\notepad.exe'
Get-Process -Name Notepad

$procid=get-process Notepad |select -expand id
Stop-Process -Id $procid

Get-Service