$global:progressPreference = 'silentlyContinue'
# Build images
cd D:\packer

# Get Start Time
$startDTM = (Get-Date)

packer build windows_10.json

$endDTM = (Get-Date)
Write-Host "[INFO]  - Elapsed Time: $(($endDTM-$startDTM).totalseconds) seconds" -ForegroundColor Yellow

Convert-VHD -Path "D:\packer\output\Virtual Hard Disks\packer-vm.vhdx" -DestinationPath "D:\packer\output\Virtual Hard Disks\packer-vm.vhd" -VHDType Fixed
Optimize-VHD -Path "D:\packer\output\Virtual Hard Disks\packer-vm.vhd" -Mode Full
(Get-VHD 'D:\packer\output\Virtual Hard Disks\packer-vm.vhd').FileSize | Out-File -FilePath D:\disksize



