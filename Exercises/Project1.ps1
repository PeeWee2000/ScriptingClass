#
# Project1.ps1
#
function PrintHostName
{}

function PrintIP
{}

function PrintDNSServers
{}

function PrintDefaultGateway
{}

function PrintAvailableMemory
{}

function PrintPath
{}

function PrintDrivers
{}

function PrintRunningProcesses
{}

function KillProcess
{}

function PrintActiveConnections
{}

function ReadTextFile
{}

function ReadFileSecurity
{}

[int]$SelectedOption

While (1 -eq 1)
{
	Clear
	Write-Host "1: Show System Hostname"
	Write-Host "2: Show System IP Address"
	Write-Host "3: Show System DNS Servers"
	Write-Host "4: Show System Default Gateway"
	Write-Host "5: Show Amount of Memory Available to Run Applications"
	Write-Host "6: Show PATH enviroment variable"
	Write-Host "7: List Drivers Installed On System"
	Write-Host "8: List current running tasks"
	Write-Host "9: Kill Task"
	Write-Host "10: Display a text file on the screen"
	Write-Host "11: Get File Security Information"
	Write-Host "12: Show All TCP/IP Network Connections and listening Ports"
	Write-Host "Press Ctrl + C to exit"

	$SelectedOption = Read-Host

	if ($SelectedOption -eq 1)
	{ PrintHostName }
	elseif ($SelectedOption -eq 2)
	{ PrintIP }
	elseif ($SelectedOption -eq 3)
	{ PrintDNSServers }
	elseif ($SelectedOption -eq 4)
	{ PrintDefaultGateway }
	elseif ($SelectedOption -eq 5)
	{ PrintAvailableMemory }
	elseif ($SelectedOption -eq 6)
	{ PrintPath }
	elseif ($SelectedOption -eq 7)
	{ PrintDrivers }
	elseif ($SelectedOption -eq 8)
	{ PrintRunningProcesses }
	elseif ($SelectedOption -eq 9)
	{ KillProcess }
	elseif ($SelectedOption -eq 10)
	{ PrintActiveConnections }
	elseif ($SelectedOption -eq 11)
	{ ReadTextFile }
	elseif ($SelectedOption -eq 12)
	{ ReadFileSecurity }
	else
	{Write-Host "Invalid option selected"}
}