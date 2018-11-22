#Requires -Version 5.0

Function Set-Services {
    <# 
    .SYNOPSIS
        Example.
    .DESCRIPTION
        Example.
    .EXAMPLE
        Set-Services
    #>

    param {
        [Services]$Services
    }
} Export-ModuleMember -Function Set-Services

Function Get-Services {
    <# 
    .SYNOPSIS
        Example.
    .DESCRIPTION
        Example.
    .EXAMPLE
        Get-Services
    #>

    $Services = New-Object -TypeName Services

    $Services.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft (R) Diagnostics Hub Standard Collector Service";
        "DisplayName" = "Microsoft (R) Diagnostics Hub Standard Collector Service";
    })) | Out-Null
    $Services.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "WAP Push Message Routing Service (see known issues)";
        "DisplayName" = "WAP Push Message Routing Service (see known issues)";
    })) | Out-Null
    $Services.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "HomeGroup Listener";
        "DisplayName" = "HomeGroup Listener";
        "IsChecked" = "True";
    })) | Out-Null
    $Services.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "HomeGroup Provider";
        "DisplayName" = "HomeGroup Provider";
    })) | Out-Null
    $Services.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Geolocation Service";
        "DisplayName" = "Geolocation Service";
    })) | Out-Null

    return $Services
} Export-ModuleMember -Function Get-Services
