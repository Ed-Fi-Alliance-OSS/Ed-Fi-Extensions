# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# ValidateSQL.ps1

param (
    [string]$Workspace,
    [string]$MetaEdExtensionName,
    [string]$Password
)

function Test-SQL {

    sqlcmd -S localhost -U sa -P $Password -Q "CREATE DATABASE MetaEd_SQL_Validation_Test" 
    $scripts = @()

    $basePath = Join-Path $Workspace 'MetaEdOutput'
    $latestSqlServerScriptPath = Join-Path $basePath 'EdFi/Database/SQLServer/ODS'
    $deprecatedScriptPath = Join-Path $basePath 'ODS-SQLServer'

    if (Test-Path $latestSqlServerScriptPath) {
        $structurePath = Join-Path $latestSqlServerScriptPath 'Structure'
        $dataPath = Join-Path $latestSqlServerScriptPath 'Data'

        if (Test-Path $structurePath) {
            $scripts += Get-ChildItem $structurePath -Filter '*.sql'
        }
        if (Test-Path $dataPath) {
            $scripts += Get-ChildItem $dataPath -Filter '*.sql'
        }

        if (Test-Path $structurePath) {
            $structureSubTypePaths = Get-ChildItem $structurePath -Directory
            foreach ($subTypePath in $structureSubTypePaths) {
                $scripts += Get-ChildItem $subTypePath.FullName -Filter '*.sql' -Recurse
            }
        }
        if (Test-Path $dataPath) {
            $dataSubTypePaths = Get-ChildItem $dataPath -Directory
            foreach ($subTypePath in $dataSubTypePaths) {
                $scripts += Get-ChildItem $subTypePath.FullName -Filter '*.sql' -Recurse
            }
        }
    }
    elseif (Test-Path $deprecatedScriptPath) {
        $scripts = Get-ChildItem $deprecatedScriptPath -Filter '*.sql'
    }

    if (-not [string]::IsNullOrWhiteSpace($MetaEdExtensionName)) {

        Write-Host "`r`n $MetaEdExtensionName Extension SQL validation  `r`n"   
        $extensionSqlServerScriptPath = Join-Path $basePath "$MetaEdExtensionName\Database\SQLServer\ODS"
        if (Test-Path $extensionSqlServerScriptPath) {
            $structurePath = Join-Path $extensionSqlServerScriptPath 'Structure'
            $dataPath = Join-Path $extensionSqlServerScriptPath 'Data'

            if (Test-Path $structurePath) {
                $scripts += Get-ChildItem $structurePath -Filter '*.sql'
            }
            if (Test-Path $dataPath) {
                $scripts += Get-ChildItem $dataPath -Filter '*.sql'
            }

            if (Test-Path $structurePath) {
                $structureSubTypePaths = Get-ChildItem $structurePath -Directory
                foreach ($subTypePath in $structureSubTypePaths) {
                    $scripts += Get-ChildItem $subTypePath.FullName -Filter '*.sql' -Recurse
                }
            }
            if (Test-Path $dataPath) {
                $dataSubTypePaths = Get-ChildItem $dataPath -Directory
                foreach ($subTypePath in $dataSubTypePaths) {
                    $scripts += Get-ChildItem $subTypePath.FullName -Filter '*.sql' -Recurse
                }
            }
        }
    }

    foreach ($script in $scripts) {
        try {
            $elapsed = Use-StopWatch {
                Write-Host "`r`n Script Full Name is $script `r`n"
                $sqlcmdOutput= sqlcmd -S localhost -U sa -P $Password -i $script.FullName
                Write-Host $sqlcmdOutput
            }
            Write-Result $true $script.Name $elapsed
        } catch {
            Write-Result $false $script.Name $elapsed $_.Exception
        }
    }
}

function Write-Result {
    [CmdletBinding()]
    param(
        [parameter(mandatory = $true)]
        [boolean] $Passed,

        [parameter(mandatory = $true)]
        [string] $Name,

        [parameter(mandatory = $false)]
        [string] $Elapsed,

        [parameter(mandatory = $false)]
        $Exception
    )
    if ($null -ne $Elapsed) {
        $Elapsed = "($Elapsed`ms)"
    }
    if ($Passed) {
        Write-Host " PASS " -BackgroundColor Green -ForegroundColor Black -NoNewline
        Write-Host " $Name $Elapsed"
    } else {
        Write-Host " FAIL " -BackgroundColor Red -ForegroundColor Black -NoNewline
        Write-Host " $Name $Elapsed`r`n"
        if ($null -ne $Exception) {
            Write-Error $Exception
        }
    }
}

function Use-StopWatch {
    param(
        [parameter(mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [scriptblock] $ScriptBlock
    )
    $elapsed = [System.Diagnostics.Stopwatch]::StartNew()
    . $ScriptBlock
    return $elapsed.ElapsedMilliseconds
}

$Error.Clear()
Write-Host " "
$elapsed = Use-StopWatch {
    Test-SQL
}
Write-Host "`r`n Validation finished in $elapsed`ms. `r`n"
if ($Error.Count -gt 0) {
    exit 1
}