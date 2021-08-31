Get-Service -Name wuauserv | Stop-Service -Force -Verbose -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\SoftwareDistribution\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\Temp\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Verbose -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -Verbose -ErrorAction SilentlyContinue | Remove-Item -Force -recurse -ErrorAction SilentlyContinue