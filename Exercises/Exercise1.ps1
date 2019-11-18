echo Rharri43 | Out-File .\Log.txt -Append
Get-Date | Out-File .\Log.txt -Append
Get-ChildItem -Path C:\Windows\System32\drivers -Filter *.dll -Recurse -File -Name| ForEach-Object {
    [System.IO.Path]::GetFileNameWithoutExtension($_) | Out-File .\Log.txt -Append
}
Get-Date | Out-File .\Log.txt -Append
