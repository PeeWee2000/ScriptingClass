cls; Write-Host "Press X to Exit or enter to keep concatentating"

[string]$DatBoi = ""
[int]$LoopCount = 0

DO 
{
	$input = Read-Host "Type something"
	$DatBoi += $input + "`r`n"
	if ($input -notlike "X") {$LoopCount++}
} While ($input -notlike "X") 

Write-Host $DatBoi
Write-Host "Looped "  $LoopCount  " times"