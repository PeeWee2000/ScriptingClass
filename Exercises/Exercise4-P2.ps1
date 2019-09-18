Write-Host "Press X to Exit or enter to keep concatentating"

$Key

$input = Read-Host "Type something"
While ($input -notlike "X") 
{
$input = Read-Host "Type something"
$Key =  $Key + $input
} 


Write-Host $Key