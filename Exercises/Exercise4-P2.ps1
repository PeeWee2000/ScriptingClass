cls; Write-Host "Press X to Exit or enter to keep concatentating"

[string]$DatBoi = ""
[int]$LoopCount = 0

$input = Read-Host "Type something"
While ($input -notlike "X") 
{
	$DatBoi += $input + "`r`n"
	if ($input -notlike "X") 
	{
		$LoopCount++
		$input = Read-Host "Type something"
	}
}

Write-Host $DatBoi
Write-Host "Looped "  $LoopCount  " times"