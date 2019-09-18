Write-Host "Please don't enter nulls"
DO 
{
$Date = Read-Host "Type a date"
$Name = Read-Host "Type a name"
$Address = Read-Host "Type an address"
$Phone = Read-Host "Type a phone number"
$City = Read-Host "Type a City"
$State = Read-Host "Type a state"
$Zip = Read-Host "Type a zip"

$input = Read-Host "Type Q and press enter to Quit"

} While ($input -notlike "Q") 


($Date + $Name + $Address + $Phone + $City + $State + $Zip) | Out-File -FilePath .\DatBoi.txt 


