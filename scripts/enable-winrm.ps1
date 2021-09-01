Enable-PSRemoting -SkipNetworkProfileCheck -Force

$thumbprint = (New-SelfSignedCertificate -DnsName $env:COMPUTERNAME -CertStoreLocation Cert:\LocalMachine\My).Thumbprint
winrm set winrm/config/listener?Address=*+Transport=HTTPS @{Hostname="$env:computername"; CertificateThumbprint="$thumbprint"}'

netsh advfirewall firewall add rule name="Windows Remote Management (HTTPS-In)" dir=in action=allow protocol=TCP localport=5986

Enable-WSManCredSSP -Role Server -Force

Set-Service winrm -startuptype "auto"
Restart-Service winrm
