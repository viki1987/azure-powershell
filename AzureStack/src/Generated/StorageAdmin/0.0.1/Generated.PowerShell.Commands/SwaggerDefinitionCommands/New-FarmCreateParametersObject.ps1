<#
.DESCRIPTION
    TODO

.PARAMETER Id
    

.PARAMETER Type
    

.PARAMETER Tags
    

.PARAMETER Name
    

.PARAMETER Location
    

.PARAMETER Properties
    

#>
function New-FarmCreateParametersObject
{
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $Id,
    
        [Parameter(Mandatory = $false)]
        [string]
        $Type,
    
        [Parameter(Mandatory = $false)]
        [object]
        $Tags,
    
        [Parameter(Mandatory = $false)]
        [string]
        $Name,
    
        [Parameter(Mandatory = $false)]
        [string]
        $Location,
    
        [Parameter(Mandatory = $false)]
        [object]
        $Properties
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.Models.FarmCreateParameters

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
