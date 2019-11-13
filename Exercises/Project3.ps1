Clear
CD "C:\Users\PeeWee2000\Documents\School\ITS 3410 - Scripting For Network Administrators"
$Data = Get-Content .\STUDENTS.txt

$Students = $Data -match "\d+-\d"
$Html = "<table><thead><th></th></thead>"

ForEach ($Student in $Students)
{
    $Student -match "\d+-\d+" | Out-Null
    $StudentNumber = $Matches.0
    $Student -match "(?<=\d+-\d+\s)(\w+\s\w+\.|\w+\s\w+|\w+)" | Out-Null
    $LastName = $Matches.0
    $Student -match "(?<=\d+-\d+\s(\w+\s\w+\.|\w+\s\w+|\w+)\s+)(\w+\s\w+\.|\w+\s\w+|\w+)" | Out-Null
    $FirstName = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+)\w"| Out-Null
    $DN = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+)\d+"| Out-Null
    $ERN = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+)\d+"| Out-Null
    $HR = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+\d+\s+)\d+"| Out-Null
    $STS = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+\d+\s+\d+\s+)\w+"| Out-Null
    $DEG = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+\d+\s+\d+\s+\w+\s+)\w+"| Out-Null
    $CON = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+\d+\s+\d+\s+\w+\s+\w+\s+)\w+"| Out-Null
    $VER = $Matches.0
    $Student -match "(?<=\d+-\d+\s\b(\w+\s\w+\.|\w+\s\w+|\w+)\s+(\w+\s\w+\.|\w+\s\w+|\w+)\s+\w\s+\d+\s+\d+\s+\d+\s+\w+\s+\w+\s+\w+\s+)\d\.\d+"| Out-Null
    $GPA = $Matches.0
    $Html = $Html + "<tr>" + "<td>" + $StudentNumber + "</td>" + "<td>" + $LastName + "</td>" + "<td>" + $FirstName + "</td>" + "<td>" + $DN + "</td>" + "<td>" + $ERN + "</td>" + "<td>" + $HR + "</td>" + "<td>" + $STS + "</td>" + "<td>" + $DEG + "</td>" + "<td>" + $CON + "</td>" + "<td>" + $VER + "</td>" + "<td>" + $GPA + "</td>" + "</tr>"
    Write-Output $GPA
}

$Html = $Html + "</table>"
$Html | Out-File -FilePath .\Students.htm

