powershell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
