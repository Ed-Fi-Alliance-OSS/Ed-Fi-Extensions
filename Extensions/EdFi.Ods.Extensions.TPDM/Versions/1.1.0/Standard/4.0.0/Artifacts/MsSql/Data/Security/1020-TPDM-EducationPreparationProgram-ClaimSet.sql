-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE @claimSetName nvarchar(255)
DECLARE @resourceClaimNames table (resourceClaimName nvarchar(255))
DECLARE @claimSetId int

SET @claimSetName = 'Education Preparation Program'

insert @resourceClaimNames(resourceClaimName) values
    ('http://ed-fi.org/ods/identity/claims/tpdm/candidate'),
    ('http://ed-fi.org/ods/identity/claims/person'),
    ('http://ed-fi.org/ods/identity/claims/student'),
    ('http://ed-fi.org/ods/identity/claims/studentSchoolAssociation'),
    ('http://ed-fi.org/ods/identity/claims/credential'),
    ('http://ed-fi.org/ods/identity/claims/domains/tpdm/candidatePreparation'),
    ('http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation'),
    ('http://ed-fi.org/ods/identity/claims/domains/tpdm/survey'),
    ('http://ed-fi.org/ods/identity/claims/domains/surveyDomain'),
    ('http://ed-fi.org/ods/identity/claims/domains/educationOrganizations'),
    ('http://ed-fi.org/ods/identity/claims/tpdm/educatorPreparationProgram')


SELECT @claimSetId = ClaimSetId FROM ClaimSets WHERE ClaimSetName = @claimSetName
    
IF (@claimSetId IS NULL)
BEGIN
    --Create Claimset
    INSERT INTO ClaimSets (ClaimSetName, IsEdfiPreset) VALUES(@claimSetName,1)
    SELECT @claimSetId = ClaimSetId FROM ClaimSets WHERE ClaimSetName = @claimSetName
END;


--Create CRUD action claims for all ClaimNames in @resourceClaimNames
INSERT INTO dbo.ClaimSetResourceClaimActions (ActionId, ClaimSetId, ResourceClaimId)
SELECT act.ActionId, @claimSetId, ResourceClaimId
FROM dbo.ResourceClaims RC
JOIN @resourceClaimNames RN ON RC.ClaimName = RN.resourceClaimName
CROSS JOIN dbo.Actions act
WHERE NOT EXISTS(SELECT 1 FROM dbo.ClaimSetResourceClaimActions WHERE ActionId = act.ActionId AND ClaimSetId = @claimSetId AND ResourceClaimId = RC.ResourceClaimID);
--Create R action claim for systemDescriptors
INSERT INTO dbo.ClaimSetResourceClaimActions (ActionId,ClaimSetId,ResourceClaimId)
SELECT (SELECT ActionId FROM Actions WHERE ActionName = 'read'), @claimSetId, ResourceClaimId
FROM ResourceClaims RC
WHERE RC.ResourceName = 'systemDescriptors'
AND NOT EXISTS(SELECT 1 FROM dbo.ClaimSetResourceClaimActions WHERE ActionId = (SELECT ActionId FROM dbo.Actions WHERE ActionName = 'Read') AND ClaimSetId = @claimSetId AND ResourceClaimId = RC.ResourceClaimID);	