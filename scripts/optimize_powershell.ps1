# https://docs.ansible.com/ansible/latest/user_guide/windows_performance.html

function Optimize-PowershellAssemblies {
  # NGEN powershell assembly, improves startup time of powershell by 10x
  $old_path = $env:path
  try {
    $env:path = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
    [AppDomain]::CurrentDomain.GetAssemblies() | % {
      if (! $_.location) {continue}
      $Name = Split-Path $_.location -leaf
      Write-Progress -Activity "Native Image Installation" -Status "$name"
      ngen install $_.location | % {"`t$_"}
    }
  } finally {
    $env:path = $old_path
  }
}
Optimize-PowershellAssemblies

# Disable Prefetch svc and telemetry
Set-Service SysMain -startuptype "disabled"
Stop-Service -Name "SysMain"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
