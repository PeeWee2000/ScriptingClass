Clear

$Username = Read-Host "Type your name, senpai."

[int]$TwoDigit = Read-Host "Type a 2 digit number"
[string]$2DString = $TwoDigit.ToString()
while ($2DString.Length -ne 2)
{
	$TwoDigit = Read-Host "Number entered was not 3 digits type a 2 digit number"
	$2Dstring = $TwoDigit.ToString()
}


[int]$ThreeDigit = Read-Host "Type a 3 digitnumber"
[string]$3DString = $ThreeDigit.ToString()
while ($3DString.Length -ne 3)
{
	$ThreeDigit = Read-Host "Number entered was not 3 digits type a 2 digit number"
	$3DString = $ThreeDigit.ToString()
}


$Multiplication = ($TwoDigit * $ThreeDigit)
$Addition = $TwoDigit + $ThreeDigit
$Subtract = $TwoDigit - $ThreeDigit


Write-Host "Multiplication "  $Multiplication
Write-Host "Addition "  $Addition
Write-Host "Subtraction "  $Subtract