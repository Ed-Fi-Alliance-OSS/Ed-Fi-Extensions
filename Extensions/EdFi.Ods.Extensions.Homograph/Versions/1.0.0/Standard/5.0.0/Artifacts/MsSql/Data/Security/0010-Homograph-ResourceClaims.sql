-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


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

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/name', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/school', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/contact', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/student', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/staff', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/schoolYearType', @educationOrganizationsResourceClaimId)

INSERT INTO [dbo].[ResourceClaims]
    ( [ClaimName], [ParentResourceClaimId])
VALUES
    ( 'http://ed-fi.org/ods/identity/claims/homograph/studentSchoolAssociation', @educationOrganizationsResourceClaimId)
