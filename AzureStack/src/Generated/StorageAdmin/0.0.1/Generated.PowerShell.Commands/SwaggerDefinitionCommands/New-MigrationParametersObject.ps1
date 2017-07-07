<#
.DESCRIPTION
    

.PARAMETER ContainerName
    Name of container to migrate.

.PARAMETER StorageAccountName
    Share location where container is located.

.PARAMETER DestinationShareUNCPath
    UNC path of share where container should be places.

#>
function New-MigrationParametersObject
{
    param(    
        [Parameter(Mandatory = $true)]
        [string]
        $ContainerName,
    
        [Parameter(Mandatory = $true)]
        [string]
        $StorageAccountName,
    
        [Parameter(Mandatory = $true)]
        [string]
        $DestinationShareUNCPath
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.Models.MigrationParameters

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
