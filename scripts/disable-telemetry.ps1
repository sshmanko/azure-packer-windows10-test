Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Get-Service DiagTrack | Set-Service -StartupType Disabled
Get-Service dmwappushservice | Set-Service -StartupType Disabled
