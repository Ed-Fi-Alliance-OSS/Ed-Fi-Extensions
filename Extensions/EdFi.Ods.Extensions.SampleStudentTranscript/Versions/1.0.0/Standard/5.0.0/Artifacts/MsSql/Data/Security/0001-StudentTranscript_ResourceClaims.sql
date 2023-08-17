-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @SystemDescriptorsId INT


SELECT @SystemDescriptorsId = resourceclaimid
FROM   [dbo].[resourceclaims]
WHERE  ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors'

INSERT INTO [dbo].[resourceclaims]
            ([claimname],
             [parentresourceclaimid])
VALUES      ( 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/institutionControlDescriptor',
@SystemDescriptorsId )

INSERT INTO [dbo].[resourceclaims]
            ([claimname],
             [parentresourceclaimid])
VALUES      ( 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/institutionLevelDescriptor',
              @SystemDescriptorsId )

INSERT INTO [dbo].[resourceclaims]
            ([claimname],
             [parentresourceclaimid])
VALUES      ( 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/specialEducationGraduationStatusDescriptor'
,@SystemDescriptorsId )

INSERT INTO [dbo].[resourceclaims]
            ([claimname],
             [parentresourceclaimid])
VALUES      ( 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/submissionCertificationDescriptor',
@SystemDescriptorsId)

INSERT INTO [dbo].[ResourceClaims] (
    [ClaimName] ,[ParentResourceClaimId]  )
VALUES ( 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/postSecondaryOrganization'
    ,NULL    )

--Setup Authorization Strategy

DECLARE @AuthorizationStrategyId INT
DECLARE @ResourceClaimId INT

SELECT @AuthorizationStrategyId = AuthorizationStrategyId
FROM AuthorizationStrategies
WHERE AuthorizationStrategyName = 'NoFurtherAuthorizationRequired'

SELECT @ResourceClaimId = resourceclaimid
FROM ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/postSecondaryOrganization'

INSERT INTO [dbo].[ResourceClaimActions] (
    [ResourceClaimId]
    ,[ActionId]
    ,[ValidationRuleSetName]
    )
SELECT ResourceClaimId, a.ActionId, null
FROM [dbo].[ResourceClaims]
CROSS APPLY (
    SELECT ActionId
    FROM [dbo].[Actions]
    WHERE ActionName IN ('Create', 'Read', 'Update', 'Delete','ReadChanges')) AS a
WHERE ResourceClaimId = @ResourceClaimId

INSERT INTO [dbo].[ResourceClaimActionAuthorizationStrategies] (
    [ResourceClaimActionId]
    ,[AuthorizationStrategyId]
    )
SELECT ResourceClaimActionId, @AuthorizationStrategyId
FROM [dbo].[ResourceClaimActions] rca
INNER JOIN [dbo].[ResourceClaims] rc
    ON rca.[ResourceClaimId] = rc.[ResourceClaimId]
INNER JOIN [dbo].[Actions] a
    ON rca.ActionId = a.Actionid
        AND a.ActionName IN ('Create','Read','Update','Delete', 'ReadChanges')
WHERE rc.ResourceClaimId = @ResourceClaimId

--Add to SIS Vendor and Ed-Fi Sandbox claim sets
INSERT INTO [dbo].[ClaimSetResourceClaimActions]
SELECT [ClaimSetId]
    ,[ResourceClaimId]
    ,[ActionId]
    ,NULL
FROM Actions a
    ,ClaimSets c
    ,ResourceClaims r
WHERE r.ClaimName = 'http://ed-fi.org/ods/identity/claims/sample-student-transcript/postSecondaryOrganization'
    AND (
        c.ClaimSetName = 'SIS Vendor'
        OR c.ClaimSetName = 'Ed-Fi Sandbox'
        )
    AND NOT EXISTS (
        SELECT 1
        FROM ClaimSetResourceClaimActions csrca
        WHERE csrca.ActionId = a.ActionId
            AND csrca.ClaimSetId = c.ClaimSetId
                 AND csrca.ResourceClaimId = r.ResourceClaimId
        )