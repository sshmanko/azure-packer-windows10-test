(Get-Content d:\packer\windows10.json) -replace 'Password123', $args[0] | Set-Content d:\packer\windows10.json
(Get-Content d:\packer\answer_files\Autounattend.xml) -replace 'Password123', $args[0] | Set-Content d:\packer\answer_files\Autounattend.xml
