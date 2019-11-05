#
# Project1.ps1
#

function PrintHostName
{[System.Net.Dns]::GetHostName()}

function PrintIP
{Get-NetIPAddress}

function PrintDNSServers
{Get-DnsClientServerAddress}

function PrintDefaultGateway
{Get-WmiObject -Class Win32_IP4RouteTable |
  where { $_.destination -eq '0.0.0.0' -and $_.mask -eq '0.0.0.0'} |
  Sort-Object metric1 | select nexthop, metric1, interfaceindex}

function PrintAvailableMemory
{(systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()}

function PrintPath
{$Env:Path}

function PrintDrivers
{Get-WindowsDriver -Online -All | More}

function PrintRunningProcesses
{Get-Process | More}

function KillProcess
{Stop-Process -Id $ProcessID}

function PrintActiveConnections
{Get-NetTCPConnection | More}

function ReadTextFile
{ Get-Content $TextFile | More}

function ReadFileSecurity
{Get-Acl $Path}

$SelectedOption
[int]$ProcessID
[string]$Path

Do 
{
	Clear-Variable $SelectedOption
	Clear
	Get-Date
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
	Write-Host "Press Ctrl + C or Q to exit"

	$SelectedOption = Read-Host
	Clear

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
	{ 
		Write-Host "Enter the ID of the process you wish to terminate"
		$ProcessID = Read-Host
		KillProcess 
	}
	elseif ($SelectedOption -eq 10)
	{ 
		Write-Host "Please enter the full path of the text file you wish to read"
		$Path = Read-Host
		ReadTextFile 
	}
	elseif ($SelectedOption -eq 11)
	{ 
		Write-Host "Please Enter the full path of the file you want the ACL of"
		$Path = Read-Host
		ReadFileSecurity 
	}
	elseif ($SelectedOption -eq 12)
	{ PrintActiveConnections }
	else
	{Write-Host "Invalid option selected"}
	Write-Host "Press any key to continue"
	Read-Host
} While ($SelectedOption -notlike "Q") 