#Requires -Version 5.0

Function ExampleSuccess {
    <# 
    .SYNOPSIS
        Success example.
    .DESCRIPTION
        Example of a successful module method call.
    .EXAMPLE
        ExampleSuccess
    #>

    Write-Host "Example of a successful module method call."
} Export-ModuleMember -Function ExampleSuccess
