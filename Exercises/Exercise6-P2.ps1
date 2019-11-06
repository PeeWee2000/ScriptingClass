Write-Host "Please don't enter nulls"
[char]$input
DO 
{

Clear
[string]$Date = Read-Host "Type a date"
[string]$Name = Read-Host "Type a name"
[string]$Address = Read-Host "Type an address"
[string]$Phone = Read-Host "Type a phone number"
[string]$City = Read-Host "Type a City"
[string]$State = Read-Host "Type a state"
[string]$Zip = Read-Host "Type a zip"


if ([string]::IsNullOrEmpty($Date) -or [string]::IsNullOrEmpty($Name) -or [string]::IsNullOrEmpty($Address) -or [string]::IsNullOrEmpty($Phone) -or [string]::IsNullOrEmpty($City) -or [string]::IsNullOrEmpty($State) -or [string]::IsNullOrEmpty($Zip))
	{
		Write-Host "Null values were entered record not written"
		$input = Read-Host "Type Q and press enter to Quit or press the any other key to continue"
	}
else
	{ 
		($Date + $Name + $Address + $Phone + $City + $State + $Zip) | Out-File -Append -FilePath .\DatBoi.txt 
		$input = Read-Host "Type Q and press enter to Quit or press the any other key to continue"		
	}
} While ($input -notlike "Q") 




