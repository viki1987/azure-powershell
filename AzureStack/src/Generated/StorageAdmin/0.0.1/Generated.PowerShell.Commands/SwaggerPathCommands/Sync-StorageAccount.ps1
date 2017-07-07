<#
.DESCRIPTION
    TODO

.PARAMETER TenantSubscriptionId
    The tenant subscription id.

.PARAMETER ResourceGroupName
    The name of the resource group within the user's subscription.

#>
function Sync-StorageAccount
{
    [OutputType([Microsoft.AzureStack.Storage.Admin.Models.StorageAccountSyncResult])]
    [CmdletBinding(DefaultParameterSetName='StorageAccounts_Synchronize')]
    param(    
        [Parameter(Mandatory = $true, ParameterSetName = 'StorageAccounts_Synchronize')]
        [System.String]
        $TenantSubscriptionId,
    
        [Parameter(Mandatory = $true, ParameterSetName = 'StorageAccounts_Synchronize')]
        [System.String]
        $ResourceGroupName
    )

    Begin 
    {
	    PSSwagger.Azure.Helpers\Initialize-PSSwaggerDependencies
	}

    Process {
    
    $ErrorActionPreference = 'Stop'
    $serviceCredentials = PSSwagger.Azure.Helpers\Get-AzServiceCredential
    $subscriptionId = Get-AzSubscriptionId
    
    $delegatingHandler = New-Object -TypeName System.Net.Http.DelegatingHandler[] 0

    $StorageAdminClient = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.StorageAdminClient -ArgumentList $serviceCredentials,$delegatingHandler
    $ResourceManagerUrl = PSSwagger.Azure.Helpers\Get-AzResourceManagerUrl
    $StorageAdminClient.BaseUri = $ResourceManagerUrl
    
    if(Get-Member -InputObject $StorageAdminClient -Name 'SubscriptionId' -MemberType Property)
    {
        $StorageAdminClient.SubscriptionId = $subscriptionId
    }
    
    

    $skippedCount = 0
    $returnedCount = 0
    if ('StorageAccounts_Synchronize' -eq $PsCmdlet.ParameterSetName) {
        Write-Verbose -Message 'Performing operation SynchronizeWithHttpMessagesAsync on $StorageAdminClient.'
        $taskResult = $StorageAdminClient.StorageAccounts.SynchronizeWithHttpMessagesAsync($TenantSubscriptionId, $ResourceGroupName)
    } else {
        Write-Verbose -Message 'Failed to map parameter set to operation method.'
        throw 'Module failed to find operation to execute.'
    }

    if ($TaskResult) {
        $result = $null
        $ErrorActionPreference = 'Stop'
                    
        $null = $taskResult.AsyncWaitHandle.WaitOne()
                    
        Write-Debug -Message "$($taskResult | Out-String)"

        if($taskResult.IsFaulted)
        {
            Write-Verbose -Message 'Operation failed.'
            Throw "$($taskResult.Exception.InnerExceptions | Out-String)"
        } 
        elseif ($taskResult.IsCanceled)
        {
            Write-Verbose -Message 'Operation got cancelled.'
            Throw 'Operation got cancelled.'
        }
        else
        {
            Write-Verbose -Message 'Operation completed successfully.'

            if($taskResult.Result -and
                (Get-Member -InputObject $taskResult.Result -Name 'Body') -and
                $taskResult.Result.Body)
            {
                $result = $taskResult.Result.Body
                Write-Debug -Message "$($result | Out-String)"
                $result
            }
        }
        
    }
    }
}
