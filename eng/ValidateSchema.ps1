# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# ValidateSchema.ps1

param (
    [string]$Workspace
)

function Test-Schema {
    [CmdletBinding()]
    param(
        [parameter(mandatory = $false)]
        [ValidateScript( { Test-Path $_ })]
        [string] $Path,

        [parameter(mandatory = $false)]
        [Xml.Schema.XmlSchemaInclude] $SchemaInclude
    )

    try {
        $elapsed = Use-StopWatch {
            $script:schemaPath = Get-Item $Path
            $script:schema = New-Object Xml.Schema.XmlSchemaInclude

            $script:stream = $schemaPath.OpenRead()
            $schema.Schema = [Xml.Schema.XmlSchema]::Read($stream, $null)

            if ($SchemaInclude) {
                $schema.Schema.Includes.Add($SchemaInclude) | Out-Null
            }

            $schemaSet = New-Object Xml.Schema.XmlSchemaSet
            $schemaSet.Add($schema.Schema) | Out-Null
            $schemaSet.Compile()
        }
        Write-Result $true $schemaPath.Name $elapsed
        return $schema
    } catch {
        Write-Result $false $schemaPath.Name $elapsed $_.Exception
    } finally {
        if ($stream -is [System.IDisposable]) {
            $stream.Dispose()
        }
    }
}

function Test-InterchangeSchema {
    [CmdletBinding()]
    param(
        [parameter(mandatory = $false)]
        [ValidateScript( { Test-Path $_ })]
        [string] $Path,

        [parameter(mandatory = $false)]
        [Xml.Schema.XmlSchemaInclude] $CoreSchema,

        [parameter(mandatory = $false)]
        [string] $Filter = "Interchange*.xsd"
    )

    $interchanges = Get-ChildItem $Path -Filter $Filter

    foreach ($interchange in $interchanges) {
        $interchangePath = Get-Item $interchange.FullName

        try {
            $elapsed = Use-StopWatch {
                $script:stream = $interchangePath.OpenRead()
                $schema = [Xml.Schema.XmlSchema]::Read($stream, $null)

                $schema.Includes.Add($CoreSchema) | Out-Null

                $schemaSet = New-Object Xml.Schema.XmlSchemaSet
                $schemaSet.Add($schema) | Out-Null
                $schemaSet.Compile()
            }
            Write-Result $true $interchange.Name $elapsed
        } catch {
            Write-Result $false $interchange.Name $elapsed $_.Exception
        } finally {
            if ($stream -is [System.IDisposable]) {
                $stream.Dispose()
            }
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
    if ($Elapsed -ne $null) {
        $Elapsed = "($Elapsed`ms)"
    }
    if ($Passed) {
        Write-Host " PASS " -BackgroundColor Green -ForegroundColor Black -NoNewline
        Write-Host " $Name $Elapsed"
    } else {
        Write-Host " FAIL " -BackgroundColor Red -ForegroundColor Black -NoNewline
        Write-Host " $Name"
        if ($Exception -ne $null) {
            Write-Error $Exception.Message
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

$coreSchemaPath = "$Workspace/MetaEdOutput/EdFi/XSD/Ed-Fi-Core.xsd"
$interchangePath = "$Workspace/MetaEdOutput/EdFi/Interchange"

$elapsed = Use-StopWatch {
    $coreSchema = Test-Schema $coreSchemaPath
    Test-InterchangeSchema $interchangePath $coreSchema
}
Write-Host "`r`n Validation finished in $elapsed`ms. `r`n"