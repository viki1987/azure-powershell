
$ErrorActionPreference = "Stop";

Set-Alias AutoRest.exe autorest.exe

cd $PSScriptRoot

# Initialize the environment

$output="$PSScriptRoot/Generated"
$tmp="$PSScriptRoot/tmp"
$artifacts = "$PSScriptRoot/artifacts"
$symbols = "$PSScriptRoot/Generated/symbols"
$generatedCSharp = "Generated.Csharp"
$conf="autorest.md"

if(Test-Path $output) {
    Remove-Item $output -Recurse -Force
}
mkdir $output | Out-Null

if(Test-Path $tmp) {
    Remove-Item $tmp -Recurse -Force
}

autorest $conf --verbose --debug

# Create PowerShell

Import-Module $PSScriptRoot\..\..\Tools\PSSwagger\PSSwagger\PSSwagger.psd1 -Force

$spec = (Resolve-Path "$PSScriptRoot\Artifacts\fabric.json").ToString()
$path = (Resolve-Path $output).ToString()

$param = @{
    SwaggerSpecUri = $spec
    Path = $path
    Name = "StorageAdmin"
    UseAzureCsharpGenerator = $true
    DefaultCommandPrefix= "Azs"   
}

New-PSSwaggerModule @param

# Generate Code

# Delete all the generated code files
if( Test-Path $tmp ) {
    Remove-Item $tmp -Recurse -Force
}

if( Test-Path $artifacts ) {
    Remove-Item $artifacts -Recurse -Force
}

if( Test-Path $symbols ) {
    Remove-Item $symbols -Recurse -Force
}

Get-ChildItem $generatedCSharp -Recurse | Remove-Item -Recurse -Force

# Overwrite ps1 files to change encoding to default encoding so you can check in the files
Get-ChildItem "Generated" -Recurse -File | % { $name = $_.FullName; $value = Get-Content $_.FullName; Set-Content -Path $name -Value $value -Force  }