-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DO $$
DECLARE claim_set_name VARCHAR(255) := 'Education Preparation Program';
DECLARE claim_set_id int;

BEGIN
    SELECT ClaimSetId INTO claim_set_id FROM dbo.ClaimSets WHERE ClaimSetName = claim_set_name;
    
    IF (claim_set_id IS NULL) THEN
        --Create Claimset
        INSERT INTO dbo.ClaimSets (ClaimSetName, IsEdfiPreset) VALUES(claim_set_name,'TRUE');
        SELECT ClaimSetId INTO claim_set_id FROM dbo.ClaimSets WHERE ClaimSetName = claim_set_name;
    END IF;
    
    --Create CRUD action claims for all ClaimNames in @resourceClaimNames
    INSERT INTO dbo.ClaimSetResourceClaimActions (ActionId, ClaimSetId, ResourceClaimId)
    SELECT act.ActionId, claim_set_id, ResourceClaimId
    FROM dbo.ResourceClaims RC
    INNER JOIN LATERAL (
        SELECT ActionId
        FROM dbo.Actions
        WHERE ActionName in ('Create','Read','Update','Delete')
    ) AS act ON true
    WHERE ClaimName IN (
        'http://ed-fi.org/ods/identity/claims/tpdm/candidate',
        'http://ed-fi.org/ods/identity/claims/person',
        'http://ed-fi.org/ods/identity/claims/student',
        'http://ed-fi.org/ods/identity/claims/studentSchoolAssociation',
        'http://ed-fi.org/ods/identity/claims/credential',
        'http://ed-fi.org/ods/identity/claims/domains/tpdm/candidatePreparation',
        'http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation',
        'http://ed-fi.org/ods/identity/claims/domains/tpdm/survey',
        'http://ed-fi.org/ods/identity/claims/domains/surveyDomain',
        'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations',
        'http://ed-fi.org/ods/identity/claims/tpdm/educatorPreparationProgram'
    )
    AND NOT EXISTS(SELECT 1 FROM dbo.ClaimSetResourceClaimActions WHERE ActionId = act.ActionId AND ClaimSetId = claim_set_id AND ResourceClaimId = RC.ResourceClaimID);

    --Create R action claim for systemDescriptors
    INSERT INTO dbo.ClaimSetResourceClaimActions (ActionId, ClaimSetId, ResourceClaimId)
    SELECT (SELECT ActionId FROM dbo.Actions WHERE ActionName = 'Read'), claim_set_id, ResourceClaimId
    FROM dbo.ResourceClaims RC
    WHERE RC.ResourceName = 'systemDescriptors'
	AND NOT EXISTS(SELECT 1 FROM dbo.ClaimSetResourceClaimActions WHERE ActionId = (SELECT ActionId FROM dbo.Actions WHERE ActionName = 'Read') AND ClaimSetId = claim_set_id AND ResourceClaimId = RC.ResourceClaimID);	
	END $$;