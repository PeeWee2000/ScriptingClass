#Rider Harrison ITS 3410 Final Project
#This script reads an excel workbook and spits out some csv files
$PrintScriptRunTime =  [system.diagnostics.stopwatch]::StartNew() #Function to time how long the script runs
Clear #Clear the screen
Set-ExecutionPolicy Unrestricted -Force #Need admin capabilities
Install-Module ImportExcel -scope CurrentUser #Install ImportExcel for the current user if it is not already

$WorkSheet = Import-Excel -Path .\GD2018Price.xlsx -WorkSheetname "CM Pricing" -HeaderName 'Material', 'Description', 'Price'

$CSV1 = "SEP=,`r`nMain Warehouse`r`nMaterial,Cost,Price`r`n" #Create a CSV file and set the separator character and header columns
$CSV2 = "SEP=,`r`nWarehouse-00`r`nMaterial,Cost,Price`r`n" #Create a CSV for Warehouse 00
$CSV3 = "SEP=,`r`nWarehouse-01`r`nMaterial,Cost,Price`r`n" #Create a CSV for Warehouse 01

foreach ($Row in $WorkSheet) #Loop through all the rows in the worksheet object
{ 
    [decimal]$RawCost = $Row.Price * 0.6 #Calculate the cost
    [decimal]$RoundedCost = [math]::Round($RawCost,2) #Set the Cost to always have 2 decimals
    
    #Row.Material is the Material Column for the current Row note that `r`n is recognized a new line
    $CSV1 += $Row.Material + "," + $RoundedCost + "," + $Row.Price + "`r`n" #Add a data row to CSV1
    $CSV2 += $Row.Material + "-00," + $RoundedCost + "," + $Row.Price + "`r`n" #Add a data Row to CSV2
    $CSV3 += $Row.Material + "-01," + $RoundedCost + "," + $Row.Price + "`r`n" #Add a data Row to CSV3
} 

$CSV1 | Out-File -FilePath .\GDPARTS.CSV #Output CSV1
$CSV2 | Out-File -FilePath .\GDPARTS00.CSV #Output CSV2
$CSV3 | Out-File -FilePath .\GDPARTS01.CSV #Output CSV3

$PrintScriptRunTime