Invoke-WebRequest -Uri "https://github.com/Azure/WindowsVMAgent/releases/download/2.7.41491.1024/WindowsAzureVmAgent.2.7.41491.1024_2107271024.fre.msi" -Outfile C:\Windows\Temp\WindowsAzureVmAgent.msi
msiexec /i C:\Windows\Temp\WindowsAzureVmAgent.msi /quiet
