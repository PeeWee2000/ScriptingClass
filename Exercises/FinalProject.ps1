#
# FinalProject.ps1
#
#Rider Harrison ITS 3410 Final Project
#This script reads an excel workbook and spits out some csv files
$PrintScriptRunTime =  [system.diagnostics.stopwatch]::StartNew() #Function to time how long the script runs
Clear
#CD "C:\Users\PeeWee2000\Documents\School\ITS 3410 - Scripting For Network Administrators"
Set-ExecutionPolicy Unrestricted -Force
Install-Module ImportExcel -scope CurrentUser

[string]$ExcelFilePath = ".\GD2018Price.xlsx"
[string]$WorkSheetName = "CM Pricing"

$WorkSheet = Import-Excel -Path $ExcelFilePath -WorkSheetname $WorkSheetName -HeaderName 'Material', 'Description', 'Price'

$CSV1 = "SEP=,`r`nMaterial,Cost,Price`r`n"
$CSV2 = $CSV1
$CSV3 = $CSV1

foreach ($Row in $WorkSheet) 
{ 
    [decimal]$RawCost = $Row.Price * 0.6
    [decimal]$RoundedCost = [math]::Round($RawCost,2)
    
    $CSV1 += $Row.Material + "," + $RoundedCost + "," + $Row.Price + "`r`n"
    $CSV2 += $Row.Material + "-00," + $RoundedCost + "," + $Row.Price + "`r`n"
    $CSV3 += $Row.Material + "-01," + $RoundedCost + "," + $Row.Price + "`r`n"
} 

$CSV1 | Out-File -FilePath .\GDPARTS.CSV
$CSV2 | Out-File -FilePath .\GDPARTS00.CSV
$CSV3 | Out-File -FilePath .\GDPARTS01.CSV

$PrintScriptRunTime #ROC