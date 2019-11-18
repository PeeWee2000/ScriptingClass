#Rider Harrison ITS 3410 Final Project
#This script reads an excel workbook and spits out some csv files
rv * -ea SilentlyContinue; rmo *; $error.Clear(); cls             #Clean the session and clear any old variables
$PrintScriptRunTime =  [system.diagnostics.stopwatch]::StartNew() #Function to time how long the script runs
Set-ExecutionPolicy Unrestricted -Force                           #Need admin capabilities
Install-Module ImportExcel -scope CurrentUser                     #Install ImportExcel for the current user if it is not already

$WorkSheet = Import-Excel -Path .\GD2018Price.xlsx -WorkSheetname "CM Pricing" -HeaderName 'Material', 'Description', 'Price' #Import the excel sheet and specify its headers

foreach ($Row in $WorkSheet) {
   
    [decimal]$Price = $Row.Price                      #Cast the price as a decimal because powershell cant handle ToStringing a compiler type inferenced variable
    [decimal]$Cost = [math]::Round($Price * 0.6,2)    #Calculate the cost and cast it as a decimal
    
    $CSV1 += $Row.Material + "," + $Cost.ToString("0.00") + "," + $Price.ToString("0.00") + "`r`n"     #Each of these 3 lines adds a row to a string variable once all rows in the worksheet have been looped through
    $CSV2 += $Row.Material + "-00," + $Cost.ToString("0.00") + "," + $Price.ToString("0.00") + "`r`n"  #Note that .ToString(0.00) formats a decimal as a string with two two decimal places and includes trailing zeroes
    $CSV3 += $Row.Material + "-01," + $Cost.ToString("0.00") + "," + $Price.ToString("0.00") + "`r`n"} #Note that `r`n is recognized as a new line in a csv
                    
$CSV1 | Out-File -FilePath .\GDPARTS.CSV
$CSV2 | Out-File -FilePath .\GDPARTS00.CSV
$CSV3 | Out-File -FilePath .\GDPARTS01.CSV 

$PrintScriptRunTime