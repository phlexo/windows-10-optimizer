#Requires -Version 5.0

# Function Set-Apps {
#     <# 
#     .SYNOPSIS
#         Example.
#     .DESCRIPTION
#         Example.
#     .EXAMPLE
#         Set-Apps
#     #>

#     param {
#         [Apps]$Apps
#     }
# } Export-ModuleMember -Function Set-Apps

Function Get-Apps {
    <# 
    .SYNOPSIS
        Example.
    .DESCRIPTION
        Example.
    .EXAMPLE
        Get-Apps
    #>

    $Apps = New-Object -TypeName Apps

    $Apps.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft.3DBuilder";
        "DisplayName" = "Microsoft.3DBuilder";
    })) | Out-Null
    $Apps.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft.Appconnector";
        "DisplayName" = "Microsoft.Appconnector";
    })) | Out-Null
    $Apps.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft.BingFinance";
        "DisplayName" = "Microsoft.BingFinance";
        "IsChecked" = "True";
    })) | Out-Null
    $Apps.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft.BingNews";
        "DisplayName" = "Microsoft.BingNews";
    })) | Out-Null
    $Apps.Items.Add((New-Object -TypeName Item -Property @{
        "Name" = "Microsoft.BingSports";
        "DisplayName" = "Microsoft.BingSports";
    })) | Out-Null

    return $Apps
} Export-ModuleMember -Function Get-Apps
