#Requires -Version 5.0

Function ExampleFailure {
    <# 
    .SYNOPSIS
        Failure example.
    .DESCRIPTION
        Example of a failed module method call.
    .EXAMPLE
        ExampleFailure
    #>

    Write-Host "Example of a failed module method call."
    throw "Example of a failed module method call."
} Export-ModuleMember -Function ExampleFailure
