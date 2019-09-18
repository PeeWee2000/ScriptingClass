Clear

$Username = Read-Host "Type your name, senpai."
[int]$TwoDigit = Read-Host "Type a 2 digit number"
[int]$ThreeDigit = Read-Host "Type a 3 digitnumber"

$Multiplication = ($TwoDigit * $ThreeDigit)
$Addition = $TwoDigit + $ThreeDigit
$Subtract = $TwoDigit - $ThreeDigit


Write-Host "Multiplication "  $Multiplication
Write-Host "Addition "  $Addition
Write-Host "Subtraction "  $Subtract