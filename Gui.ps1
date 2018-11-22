#Requires -Version 5.0

Set-StrictMode -Version Latest

Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase, System.Windows.Forms
Add-Type -Path "$PSScriptRoot\Models\*.cs"

try {
    # Load XAML

    [xml]$Xml = Get-Content -Path (Join-Path $PSScriptRoot ("{0}.xaml" -f [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)))
    $Window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $Xml))
    $Xml.SelectNodes("//*[@Name]") | %{ Set-Variable -Name ($_.Name) -Value $Window.FindName($_.Name) -Scope Global }
    
    # Load data context
    
    $MainWindowModel = New-Object -TypeName MainWindowModel -Property @{
        "Title" = "Windows 10 Power Settings";
    }

    $MainWindowModel.Applications.Add((New-Object -TypeName ItemModel -Property @{
        "Name" = "Microsoft.3DBuilder";
        "DisplayName" = "Microsoft.3DBuilder";
    })) | Out-Null
    $MainWindowModel.Applications.Add((New-Object -TypeName ItemModel -Property @{
        "Name" = "Microsoft.Appconnector";
        "DisplayName" = "Microsoft.Appconnector";
    })) | Out-Null
    $MainWindowModel.Applications.Add((New-Object -TypeName ItemModel -Property @{
        "Name" = "Microsoft.BingFinance";
        "DisplayName" = "Microsoft.BingFinance";
        "IsChecked" = "True";
    })) | Out-Null
    $MainWindowModel.Applications.Add((New-Object -TypeName ItemModel -Property @{
        "Name" = "Microsoft.BingNews";
        "DisplayName" = "Microsoft.BingNews";
    })) | Out-Null
    $MainWindowModel.Applications.Add((New-Object -TypeName ItemModel -Property @{
        "Name" = "Microsoft.BingSports";
        "DisplayName" = "Microsoft.BingSports";
    })) | Out-Null

    $Window.DataContext = $MainWindowModel;

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
    Show-Console
    Write-Host
    Write-Host $_.Exception.Message
    Write-Host
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
