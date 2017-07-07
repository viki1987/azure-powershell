<#
.DESCRIPTION
    

.PARAMETER NumberOfStorageAccounts
    

.PARAMETER CapacityInGB
    

#>
function New-StorageQuotaObject
{
    param(    
        [Parameter(Mandatory = $true)]
        [int64]
        $NumberOfStorageAccounts,
    
        [Parameter(Mandatory = $true)]
        [int64]
        $CapacityInGB
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.Models.StorageQuota

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
