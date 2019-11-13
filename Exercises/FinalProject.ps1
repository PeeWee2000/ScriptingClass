$PrintScriptRunTime =  [system.diagnostics.stopwatch]::StartNew()
Set-ExecutionPolicy Unrestricted -Force 
Install-Module ImportExcel -scope CurrentUser 
$WorkSheet = Import-Excel -Path .\GD2018Price.xlsx -WorkSheetname "CM Pricing" -HeaderName 'Material', 'Description', 'Price'
foreach ($Row in $WorkSheet) { 
$CSV1 += $Row.Material + "," + [math]::Round($Row.Price * 0.6,2) + "," + $Row.Price + "`r`n"
$CSV2 += $Row.Material + "-00," + [math]::Round($Row.Price * 0.6,2) + "," + $Row.Price + "`r`n"
$CSV3 += $Row.Material + "-01," + [math]::Round($Row.Price * 0.6,2) + "," + $Row.Price + "`r`n" } 
$CSV1 = "SEP=,`r`nMain Warehouse`r`nMaterial,Cost,Price`r`n" + $CSV1 | Out-File -FilePath .\GDPARTS.CSV
$CSV2 = "SEP=,`r`nWarehouse-00`r`nMaterial,Cost,Price`r`n" + $CSV2 | Out-File -FilePath .\GDPARTS00.CSV
$CSV3 = "SEP=,`r`nWarehouse-01`r`nMaterial,Cost,Price`r`n" + $CSV3 | Out-File -FilePath .\GDPARTS01.CSV
$PrintScriptRunTime