Clear
Write-Host "Test Score Script"
Write-Host "Press Ctrl+C to quit"

$ExitCondition = "Waef"
[int]$Students = 0
[int]$Average = 0
$Teacher = Read-Host "Type your name: "
$Date = Get-Date
[int]$As = 0
[int]$Bs = 0
[int]$Cs = 0
[int]$Ds = 0
[int]$Fails = 0

For ($i=0; $i -le 10; $i++) { }

$i = 0
Do { $i++ }
while ($i -lt 1)

While ($ExitCondition -notlike "X")
{

    $Student = Read-Host "Type the Student's name: "
    $Students++

    [int]$Score = (1 - 2)
    While (($Score -gt 100 ) -or ($Score -lt 0))
    { $Score = Read-Host "Type their score: "
        if (($Score -gt 100 ) -or ($Score -lt 0))
        { Write-Host "Please enter a valid score 0-100" }
     }

    $Average = $Average + $Score

    if ( $Score -lt 60)
    { $Student + " Score: " + $Score | Out-File -FilePath .\NeedsHelp.txt -Append
        $Fails++
     }

    if( $Score -ge 90 )
    { $Student + " Score: " + $Score | Out-File -FilePath .\BestOf.txt -Append
        $As++
     }

     if (($Score -ge 60) -and ($Score -lt 70))
     { $Ds++ }
     if (($Score -ge 70) -and ($Score -lt 80))
     { $Cs++ }
      if (($Score -ge 80) -and ($Score -lt 90))
     { $Bs++ }

    $ExitCondition = Read-Host "Type X and hit enter to tally the results or only hit enter to enter another score"
}

Write-Host $Teacher
Write-Host $Date

$Average = $Average / $Students
Write-Host "Overall average score: " $Average
Write-Host "A's :" $As
Write-Host "B's :" $Bs
Write-Host "C's :" $Cs
Write-Host "D's :" $Ds
Write-Host "F's :" $Fails

Write-Host "Top Students"
try { Get-Content -Path .\BestOf.txt} catch { }

Write-Host "The following students need help:"
try { Get-Content -Path .\NeedsHelp.txt } catch { }