#Requires -Version 5.0

Set-StrictMode -Version Latest

Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase, System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
[DllImport("user32.dll")]
public static extern bool SetForegroundWindow(IntPtr hWnd);
'

try {
    # Load XAML

    [xml]$XamlWPF = Get-Content -Path (Join-Path $PSScriptRoot ("{0}.xaml" -f [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)))
    $XamlGUI = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $XamlWPF))
    $Settings = @{}
    $XamlGUI.DataContext = $Settings
    $XamlGUI.Add_Closing({
    })
    $XamlWPF.SelectNodes("//*[@Name]") | %{ Set-Variable -Name ($_.Name) -Value $XamlGUI.FindName($_.Name) -Scope Global }

    # Event handlers

    $ButtonShowAddRemoteComputerDialog.add_Click({
    })

    $ButtonRemoveRemoteComputer.add_Click({
    })

    $ButtonCancelAddRemoteComputer.add_Click({
    })

    $ButtonAddRemoteComputer.add_Click({
    })

    $TextBoxAddRemoteComputer.add_KeyDown({
    })

    $ButtonRefreshPackages.add_Click({
    })

    $MenuItemRestorDefaultSettings.add_Click({
    })

    $ButtonQuit.add_Click({
        $XamlGUI.Close()
    })

    $ButtonDeploy.add_Click({
    })

    # Launch the window

    $XamlGUI.ShowDialog() | Out-Null
} catch {
    Show-Console
    Write-Host
    Write-Host $_.Exception.Message
    Write-Host
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
