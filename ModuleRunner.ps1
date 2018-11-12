#Requires -Version 5.0

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "You do not have Administrator rights to run this script!"
    Write-Host "Please re-run this script as an Administrator!"
    exit 1
}

try {
    Get-ChildItem "$PSScriptRoot\Modules" -Filter "*.psm1" | %{
        $Module = Import-Module $_.FullName -PassThru
        foreach ($Key in $Module.ExportedCommands.Keys) {
            Write-Host "---------------------------"
            Write-Host "Module: $((Get-Help $Module.ExportedCommands[$Key]).Synopsis)"
            try {
                &$Module.ExportedCommands[$Key] | Out-Null
            } catch {
                Write-Host "Module exception: $($_.Exception.ToString())"
            }
        }
    }
} catch {
    Write-Error "Exception: $($_.Exception.ToString())"
}
