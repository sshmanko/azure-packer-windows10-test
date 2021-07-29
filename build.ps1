$global:progressPreference = 'silentlyContinue'
# Build images

$repoPath='C:\Users\ContosoAdmin\Desktop\packer-windows'
$vmName='windows_10'
# Packer conf file. Should come from the pipeline input in the future
$packerConfiguration="${vmName}.json"

$diskName = "${vmName}.vhd"
$outputDir = "${repoPath}\output-hyperv-iso\Virtual Hard Disks"
$hypervSwitchName = "hyperv_switchname=vSwitch"


# Run packer
cd $repoPath
packer build --only=hyperv-iso --var hyperv_switchname=vSwitch $packerConfiguration

# Convert disk
Convert-VHD -Path "${outputDir}\${diskName}x" -DestinationPath "D:\packer\output\Virtual Hard Disks\packer-vm.vhd" -VHDType Fixed
(Get-VHD 'D:\packer\output\Virtual Hard Disks\packer-vm.vhd').FileSize | Out-File -FilePath D:\disksize
