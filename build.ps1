$global:progressPreference = 'silentlyContinue'
# Build images
cd D:\packer

# Get Start Time
$startDTM = (Get-Date)

packer build .

$endDTM = (Get-Date)
Write-Host "[INFO]  - Elapsed Time: $(($endDTM-$startDTM).totalseconds) seconds" -ForegroundColor Yellow

Convert-VHD -Path "D:\packer\output\Virtual Hard Disks\packer-vm.vhdx" -DestinationPath "D:\packer\output\Virtual Hard Disks\packer-vm.vhd" -VHDType Fixed
(Get-VHD 'D:\packer\output\Virtual Hard Disks\packer-vm.vhd').FileSize | Out-File -FilePath D:\disksize



