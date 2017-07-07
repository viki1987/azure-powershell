<#
.DESCRIPTION
    TODO

.PARAMETER Settings
    

#>
function New-FarmBaseObject
{
    param(    
        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Storage.Admin.Models.FarmSettings]
        $Settings
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.Models.FarmBase

    $PSBoundParameters.GetEnumerator() | ForEach-Object { 
        if(Get-Member -InputObject $Object -Name $_.Key -MemberType Property)
        {
            $Object.$($_.Key) = $_.Value
        }
    }

    if(Get-Member -InputObject $Object -Name Validate -MemberType Method)
    {
        $Object.Validate()
    }

    return $Object
}
