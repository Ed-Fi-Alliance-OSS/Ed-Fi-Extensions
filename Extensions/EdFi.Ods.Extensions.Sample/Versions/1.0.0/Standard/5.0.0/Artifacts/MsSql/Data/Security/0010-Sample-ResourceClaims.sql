-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @AuthorizationStrategyId INT;

DECLARE @systemDescriptorsResourceClaimId INT
SELECT @systemDescriptorsResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors'

DECLARE @relationshipBasedDataResourceClaimId INT
SELECT @relationshipBasedDataResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/relationshipBasedData'

DECLARE @educationOrganizationsResourceClaimId INT
SELECT @educationOrganizationsResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations'

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId]
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/artMediumDescriptor'
    , @systemDescriptorsResourceClaimId
    )

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId]
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/favoriteBookCategoryDescriptor'
    , @systemDescriptorsResourceClaimId
    )

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId] )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/membershipTypeDescriptor'
    , @systemDescriptorsResourceClaimId

    )

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId]
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/bus'
    , @educationOrganizationsResourceClaimId )

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId] )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/busRoute'
    , @educationOrganizationsResourceClaimId )

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId] )
VALUES (
   'http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation'
    , @relationshipBasedDataResourceClaimId)

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName]
    ,[ParentResourceClaimId]  )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation'
    , @relationshipBasedDataResourceClaimId   )
	
SELECT @AuthorizationStrategyId  = (SELECT AuthorizationStrategyId FROM [dbo].[AuthorizationStrategies] WHERE AuthorizationStrategyName = 'NoFurtherAuthorizationRequired');	

--- These Resources need explicit metadata ---

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    SELECT  ResourceClaimId, ac.ActionId
    FROM dbo.ResourceClaims
    CROSS APPLY 
    (SELECT ActionId
    FROM [dbo].[Actions]
    WHERE ActionName IN ('Create', 'Read', 'Update', 'Delete')) AS ac
    WHERE ClaimName IN ('http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation', 'http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation');


    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    SELECT resourceClaimActionId,@authorizationStrategyId from dbo.ResourceClaimActions RCA
    INNER JOIN dbo.ResourceClaims  RC   ON RC.ResourceClaimId = RCA.ResourceClaimId
    INNER JOIN dbo.Actions  A  ON A.ActionId = RCA.ActionId
    WHERE A.ActionName IN ('Create', 'Read', 'Update', 'Delete')
    AND  RC.ClaimName IN ('http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation', 'http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation')