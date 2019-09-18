Write-Host "Press X to Exit or enter to keep concatentating"

$Key

DO 
{
$input = Read-Host "Type something"
$Key =  $Key + $input

} While ($input -notlike "X") 


Write-Host $Key