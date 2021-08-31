Get-Service -Name wuauserv | Stop-Service -Force -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\SoftwareDistribution\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force  -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\Windows\Temp\*" -Recurse -Force  -ErrorAction SilentlyContinue | Remove-Item -Force -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -recurse -ErrorAction SilentlyContinue
Get-ChildItem "C:\users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -recurse -ErrorAction SilentlyContinue
