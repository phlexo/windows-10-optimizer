#Requires -Version 5.0

Set-StrictMode -Version Latest

Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase, System.Windows.Forms
Add-Type -Path "$PSScriptRoot\Models\*.cs"
Import-Module "$PSScriptRoot\Modules\Apps.psm1"
Import-Module "$PSScriptRoot\Modules\Services.psm1"

try {
    # Load XAML

    [xml]$Xml = Get-Content -Path (Join-Path $PSScriptRoot ("{0}.xaml" -f [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)))
    $Window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $Xml))
    $Xml.SelectNodes("//*[@Name]") | %{ Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name) -Scope Global }
    
    # Load data context

    $Window.DataContext = New-Object -TypeName MainWindow -Property @{
        "Title" = "Windows 10 Power Settings";
        "Apps" = Get-Apps;
        "Services" = Get-Services;
    }

    # Event handlers

    $Window.Add_Closing({
    })

    # $ButtonShowAddRemoteComputerDialog.add_Click({
    # })

    # $ButtonRemoveRemoteComputer.add_Click({
    # })

    # $ButtonCancelAddRemoteComputer.add_Click({
    # })

    # $ButtonAddRemoteComputer.add_Click({
    # })

    # $TextBoxAddRemoteComputer.add_KeyDown({
    # })

    # $ButtonRefreshPackages.add_Click({
    # })

    # $ButtonQuit.add_Click({
    #     $Window.Close()
    # })

    # $ButtonDeploy.add_Click({
    # })

    # Launch the window

    $Window.ShowDialog() | Out-Null
} catch {
    Write-Host
    Write-Host $_.Exception.Message
    Write-Host
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
