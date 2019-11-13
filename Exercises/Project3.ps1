Clear #Clear the screen
CD "C:\Users\PeeWee2000\Documents\School\ITS 3410 - Scripting For Network Administrators" #Change directory
$Data = Get-Content .\STUDENTS.txt #Load data from Students.txt

$Students = $Data -match "\d+-\d" #Find valid data rows

#Start building a HTML table string by defining the table and header row
$Html = "<table><thead><tr><th>StudentNumber</th><th>LastName</th><th>FirstName</th><th>DN</th><th>ERN</th><th>HR</th><th>STS</th><th>DEG</th><th>CON</th><th>VER</th><th>GPA</th></tr></thead>"

#Loop through valid data rows and separate data into individual variables via REEgex
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
}

$Html = $Html + "</table>" #Finish the table
$Html | Out-File -FilePath .\Students.htm #Pump the HTML string into a text file

