Microsoft.PowerShell.Core\Set-StrictMode -Version Latest
Microsoft.PowerShell.Utility\Import-LocalizedData  LocalizedData -filename StorageAdmin.Resources.psd1

if ((Get-OperatingSystemInfo).IsCore) {
    $clr = 'coreclr'
    $framework = 'netstandard1'
} else {
    $clr = 'fullclr'
    $framework = 'net45'
}

$clrPath = Join-Path -Path $PSScriptRoot -ChildPath 'ref' | Join-Path -ChildPath $clr
$dllFullName = Join-Path -Path $clrPath -ChildPath 'Microsoft.AzureStack.Storage.Admin.dll'
$isAzureCSharp = $True
$consent = $false
if (-not (Test-Path -Path $dllFullName)) {
    $message = $LocalizedData.CompilingBinaryComponent -f ($dllFullName)
    Write-Verbose -Message $message
    $generatedCSharpFilePath = (Join-Path -Path "$PSScriptRoot" -ChildPath "Generated.Csharp")
    if (-not (Test-Path -Path $generatedCSharpFilePath)) {
        throw $LocalizedData.CSharpFilesNotFound -f ($generatedCSharpFilePath)
    }

    $allCSharpFiles = Get-ChildItem -Path (Join-Path -Path $generatedCSharpFilePath -ChildPath "*.Code.ps1") -Recurse -Exclude Program.cs,TemporaryGeneratedFile* -File | Where-Object DirectoryName -notlike '*Azure.Csharp.Generated*'
    if ((Get-OperatingSystemInfo).IsWindows) {
        $allCSharpFiles | ForEach-Object {
            $sig = Get-AuthenticodeSignature -FilePath $_.FullName 
            if (('NotSigned' -ne $sig.Status) -and ('Valid' -ne $sig.Status)) {
                throw $LocalizedData.HashValidationFailed
            }
        }

        $message = $LocalizedData.HashValidationSuccessful
        Write-Verbose -Message $message -Verbose
    }

    $dependencies = Get-PSSwaggerExternalDependencies -Azure:$isAzureCSharp -Framework $framework
    $consent = Initialize-PSSwaggerLocalTools -Azure:$isAzureCSharp -Framework $framework
    $microsoftRestClientRuntimeAzureRequiredVersion = ''
    if ($dependencies.ContainsKey('Microsoft.Rest.ClientRuntime.Azure')) {
        $microsoftRestClientRuntimeAzureRequiredVersion = $dependencies['Microsoft.Rest.ClientRuntime.Azure'].RequiredVersion
    }
    
    $microsoftRestClientRuntimeRequiredVersion = $dependencies['Microsoft.Rest.ClientRuntime'].RequiredVersion
    $newtonsoftJsonRequiredVersion = $dependencies['Newtonsoft.Json'].RequiredVersion

    $success = Invoke-PSSwaggerAssemblyCompilation -CSharpFiles $allCSharpFiles -NewtonsoftJsonRequiredVersion $newtonsoftJsonRequiredVersion -MicrosoftRestClientRuntimeRequiredVersion $microsoftRestClientRuntimeRequiredVersion -MicrosoftRestClientRuntimeAzureRequiredVersion "$microsoftRestClientRuntimeAzureRequiredVersion" -ClrPath $clrPath -BootstrapConsent:$consent -CodeCreatedByAzureGenerator:$isAzureCSharp
    if (-not $success) {
        $message = $LocalizedData.CompilationFailed -f ($dllFullName)
        throw $message
    }

    $message = $LocalizedData.CompilationFailed -f ($dllFullName)
    Write-Verbose -Message $message
}



Get-ChildItem -Path (Join-Path -Path "$PSScriptRoot" -ChildPath "ref" | Join-Path -ChildPath "$clr" | Join-Path -ChildPath "*.dll") -File | ForEach-Object { Add-Type -Path $_.FullName -ErrorAction SilentlyContinue }

Get-ChildItem -Path "$PSScriptRoot\Generated.PowerShell.Commands\*.ps1" -Recurse -File | ForEach-Object { . $_.FullName}
