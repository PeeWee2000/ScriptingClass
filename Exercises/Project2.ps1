#
# Project2.ps1
#
Clear
[char]$SelectedOption
[int]$Value1
[int]$Value2
[string]$Answer


While ($SelectedOption -ne "Q") 
{
 Clear
 Write-Host            "1: Multiply"
 Write-Host            "2: Divide"
 Write-Host            "3: Add"
 Write-Host            "4: Subtract"
 Write-Host            "Q: Quit"
 Write-Host            "Please select an operation: "
 $SelectedOption = Read-Host

if ($SelectedOption -ne "Q")
	{
		Write-Host            "Please enter the first value for the operation: "
		$Value1 = Read-Host
		Write-Host            "Please enter the second value for the operation: "
		$Value2 = Read-Host

		if ($SelectedOption -eq "1")
		{$Answer = $Value1 * $Value2}
		elseif ($SelectedOption -eq "2" -and $Value2 -ne 0)
		{$Answer = $Value1 / $Value2}
		elseif ($SelectedOption -eq "2" -and $Value2 -eq 0)
		{$Answer = "Cannnot divide by zero"}
		elseif ($SelectedOption -eq "3")
		{$Answer = $Value1 + $Value2}
		elseif ($SelectedOption -eq "4")
		{$Answer = $Value1 - $Value2}

		Write-Host "The result of that operation is " $Answer
		Write-Host "Press any key to continue or Q to quit"
	}
} 