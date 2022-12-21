$Dir = "G:\Downloads"

#Delete files older than 15 days
Get-ChildItem $Dir -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-15)} |
ForEach-Object {
   $_ | del -Force
   $_.FullName | Out-File C:\log\delfile.txt -Append
}