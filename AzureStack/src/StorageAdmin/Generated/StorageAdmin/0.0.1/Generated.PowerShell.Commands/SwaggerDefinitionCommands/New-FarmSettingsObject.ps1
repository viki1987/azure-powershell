<#
.DESCRIPTION
    TODO

.PARAMETER OverallEgressThresholdInGbps
    

.PARAMETER MinimumEgressThresholdInGbps
    

.PARAMETER OverallTotalIngressThresholdInGbps
    

.PARAMETER DefaultTotalEgressThresholdInGbps
    

.PARAMETER DataCenterUriHostSuffixes
    

.PARAMETER DefaultRequestThresholdInTps
    

.PARAMETER FeedbackRefreshIntervalInSeconds
    

.PARAMETER GracePeriodMaxThrottleProbability
    

.PARAMETER UsageCollectionIntervalInSeconds
    

.PARAMETER OverallTotalEgressThresholdInGbps
    

.PARAMETER ToleranceFactorForIngress
    

.PARAMETER OverallIntranetIngressThresholdInGbps
    

.PARAMETER BandwidthThrottleIsEnabled
    

.PARAMETER ToleranceFactorForEgress
    

.PARAMETER ToleranceFactorForIntranetEgress
    

.PARAMETER MinimumRequestThresholdInTps
    

.PARAMETER GracePeriodForFullThrottlingInRefreshIntervals
    

.PARAMETER RetentionPeriodForDeletedStorageAccountsInDays
    

.PARAMETER ToleranceFactorForTotalEgress
    

.PARAMETER SettingsPollingIntervalInSecond
    

.PARAMETER MinimumIngressThresholdInGbps
    

.PARAMETER NumberOfAccountsToSync
    

.PARAMETER MinimumTotalIngressThresholdInGbps
    

.PARAMETER DefaultIntranetIngressThresholdInGbps
    

.PARAMETER ToleranceFactorForTps
    

.PARAMETER HostStyleHttpsPort
    

.PARAMETER OverallRequestThresholdInTps
    

.PARAMETER OverallIngressThresholdInGbps
    

.PARAMETER MinimumIntranetIngressThresholdInGbps
    

.PARAMETER MinimumTotalEgressThresholdInGbps
    

.PARAMETER DefaultThrottleProbabilityDecayIntervalInSeconds
    

.PARAMETER DefaultIngressThresholdInGbps
    

.PARAMETER DefaultEgressThresholdInGbps
    

.PARAMETER ToleranceFactorForTotalIngress
    

.PARAMETER ToleranceFactorForIntranetIngress
    

.PARAMETER CorsAllowedOriginsList
    

.PARAMETER OverallIntranetEgressThresholdInGbps
    

.PARAMETER HostStyleHttpPort
    

.PARAMETER DefaultIntranetEgressThresholdInGbps
    

.PARAMETER MinimumIntranetEgressThresholdInGbps
    

.PARAMETER DefaultTotalIngressThresholdInGbps
    

#>
function New-FarmSettingsObject
{
    param(    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallTotalIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultTotalEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [string]
        $DataCenterUriHostSuffixes,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultRequestThresholdInTps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $FeedbackRefreshIntervalInSeconds,
    
        [Parameter(Mandatory = $false)]
        [double]
        $GracePeriodMaxThrottleProbability,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $UsageCollectionIntervalInSeconds,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallTotalEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForIngress,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallIntranetIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [switch]
        $BandwidthThrottleIsEnabled,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForEgress,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForIntranetEgress,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumRequestThresholdInTps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $GracePeriodForFullThrottlingInRefreshIntervals,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $RetentionPeriodForDeletedStorageAccountsInDays,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForTotalEgress,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $SettingsPollingIntervalInSecond,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $NumberOfAccountsToSync,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumTotalIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultIntranetIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForTps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $HostStyleHttpsPort,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallRequestThresholdInTps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumIntranetIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumTotalEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $DefaultThrottleProbabilityDecayIntervalInSeconds,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultIngressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForTotalIngress,
    
        [Parameter(Mandatory = $false)]
        [double]
        $ToleranceFactorForIntranetIngress,
    
        [Parameter(Mandatory = $false)]
        [string]
        $CorsAllowedOriginsList,
    
        [Parameter(Mandatory = $false)]
        [double]
        $OverallIntranetEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [int64]
        $HostStyleHttpPort,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultIntranetEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $MinimumIntranetEgressThresholdInGbps,
    
        [Parameter(Mandatory = $false)]
        [double]
        $DefaultTotalIngressThresholdInGbps
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Storage.Admin.Models.FarmSettings

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
