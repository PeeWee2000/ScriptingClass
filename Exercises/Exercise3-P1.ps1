Clear
Get-Process | Select-Object -ExpandProperty ProcessName | Out-File -FilePath .\Processes1.txt
Start-Process 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Get-Process | Select-Object -ExpandProperty ProcessName | Out-File -FilePath .\Processes2.txt


Compare-Object (get-content .\Processes1.txt) (get-content .\Processes2.txt) | Select-Object -ExpandProperty InputObject | format-list |   Out-File .\ToKill.txt


foreach($line in Get-Content .\ToKill.txt | sort | get-unique) {
    try
    {
        $procid=get-process $line |select -expand id	
	    Stop-Process -Id $procid
    }
    catch { "Process already killed" }

}

