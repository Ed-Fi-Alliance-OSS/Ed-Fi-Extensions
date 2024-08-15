# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

# CreateMetaEdConfig.ps1

param (
    [string]$Workspace,
    [string]$ProjectVersion,
    [string]$ProjectDescription,
    [string]$TechnologyVersion
)

$FolderMetaEdOutputName = "$Workspace/MetaEdOutput"
if (-not (Test-Path $FolderMetaEdOutputName)) {
    New-Item $FolderMetaEdOutputName -ItemType Directory
}

$FolderMetaEdDeployName = "$Workspace/MetaEdDeploy"
if (-not (Test-Path $FolderMetaEdDeployName)) {
    New-Item $FolderMetaEdDeployName -ItemType Directory
}

$MetaEdConfigBase = @{}
$emptyList = New-Object System.Collections.ArrayList
$projectPaths = New-Object System.Collections.ArrayList
$projectPaths.Add("$Workspace/Ed-Fi-Model")

$projectList = New-Object System.Collections.ArrayList
$projectList.Add(@{
    "namespaceName"="EdFi";
    "projectName"="Ed-Fi";
    "projectVersion"=$ProjectVersion;
    "projectExtension"="";
    "description"=$ProjectDescription
})

$metaEdConfiguration = @{
    "artifactDirectory"="$Workspace/MetaEdOutput";
    "deployDirectory"="";
    "pluginTechVersion"=@{};
    "projects"=$projectList;
    "projectPaths"=$projectPaths;
    "pluginConfigDirectories"=$emptyList;
    "defaultPluginTechVersion"=$TechnologyVersion;
    "allianceMode"=$true;
}

$MetaEdConfigBase.Add("metaEdConfiguration", $metaEdConfiguration)

$FilePath = "$Workspace/MetaEd-js/build/MetaEdConfig-API-$TechnologyVersion-DS-5.0.json"
$MetaEdConfigBase | ConvertTo-Json -Depth 100 | Out-File -FilePath $FilePath -NoNewline -Encoding Ascii