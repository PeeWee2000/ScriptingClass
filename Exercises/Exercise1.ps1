echo Rharri43
Get-Date
Get-ChildItem -Path C:\Windows\System32\drivers -Filter *.dll -Recurse -File -Name| ForEach-Object {
    [System.IO.Path]::GetFileNameWithoutExtension($_)
}
Get-Date
