Clear
function GetNonNullValue ($TextToWrite) 
{    
[string]$Data
	while (1 -eq 1)
	{
		$Data = Read-Host $TextToWrite
		if (($Data -eq $null) -or ($Data -eq "")) { Write-Host "Null value entered, try again" }
        else { break }
	}
	return $Data
}

DO 
{
    [string]$Date = GetNonNUllValue("Type a date")
    [string]$Name = GetNonNUllValue("Type a name")
    [string]$Address = GetNonNUllValue("Type an address")
    [string]$Phone = GetNonNUllValue("Type a phone number")
    [string]$City = GetNonNUllValue("Type a City")
    [string]$State = GetNonNUllValue("Type a state")
    [string]$Zip = GetNonNUllValue("Type a zip")

	($Date + "  " + $Name + "  " + $Address + "  " + $Phone + "  " + $City + "  " + $State + "  " + $Zip + "`r`n") | Out-File -Append -FilePath .\DatBoi.txt 

	$input = Read-Host "Type Q and press enter to Quit or press the any other key to continue"		

} While ($input -notlike "Q") 