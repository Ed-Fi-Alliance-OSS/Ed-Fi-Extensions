
-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.
  
DO $$
DECLARE
    claim_id INTEGER;
    claim_name VARCHAR(2048);
    parent_resource_claim_id INTEGER;
    existing_parent_resource_claim_id INTEGER;
    claim_set_id INTEGER;
    claim_set_name VARCHAR(255);
    authorization_strategy_id INTEGER;
    create_action_id INTEGER;
    read_action_id INTEGER;
    update_action_id INTEGER;
    delete_action_id INTEGER;
    readchanges_action_id INTEGER;
    resource_claim_action_id INTEGER;
    claim_set_resource_claim_action_id INTEGER;
    claim_id_stack INTEGER ARRAY;
BEGIN
    SELECT actionid INTO create_action_id
    FROM dbo.actions WHERE ActionName = 'Create';

    SELECT actionid INTO read_action_id
    FROM dbo.actions WHERE ActionName = 'Read';

    SELECT actionid INTO update_action_id
    FROM dbo.actions WHERE ActionName = 'Update';

    SELECT actionid INTO delete_action_id
    FROM dbo.actions WHERE ActionName = 'Delete';

    SELECT actionid INTO readchanges_action_id
    FROM dbo.actions WHERE ActionName = 'ReadChanges';
    

    -- Push claimId to the stack
    claim_id_stack := array_append(claim_id_stack, claim_id);

    -- Processing children of root
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/sample'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/domains/sample';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('sample', 'http://ed-fi.org/ods/identity/claims/domains/sample', parent_resource_claim_id)
        RETURNING ResourceClaimId
        INTO claim_id;
    ELSE
        IF parent_resource_claim_id != existing_parent_resource_claim_id OR (parent_resource_claim_id IS NULL AND existing_parent_resource_claim_id IS NOT NULL) OR (parent_resource_claim_id IS NOT NULL AND existing_parent_resource_claim_id IS NULL) THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || claim_name || ''' (ResourceClaimId=' || claim_id || ') to new parent (from ResourceClaimId=' || COALESCE(existing_parent_resource_claim_id, 0) || ' to ResourceClaimId=' || COALESCE(parent_resource_claim_id, 0) || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = parent_resource_claim_id
            WHERE ResourceClaimId = claim_id;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    claim_id_stack := array_append(claim_id_stack, claim_id);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/sample
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/sample/bus'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/sample/bus';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('bus', 'http://ed-fi.org/ods/identity/claims/sample/bus', parent_resource_claim_id)
        RETURNING ResourceClaimId
        INTO claim_id;
    ELSE
        IF parent_resource_claim_id != existing_parent_resource_claim_id OR (parent_resource_claim_id IS NULL AND existing_parent_resource_claim_id IS NOT NULL) OR (parent_resource_claim_id IS NOT NULL AND existing_parent_resource_claim_id IS NULL) THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || claim_name || ''' (ResourceClaimId=' || claim_id || ') to new parent (from ResourceClaimId=' || COALESCE(existing_parent_resource_claim_id, 0) || ' to ResourceClaimId=' || COALESCE(parent_resource_claim_id, 0) || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = parent_resource_claim_id
            WHERE ResourceClaimId = claim_id;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/sample/busRoute'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/sample/busRoute';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('busRoute', 'http://ed-fi.org/ods/identity/claims/sample/busRoute', parent_resource_claim_id)
        RETURNING ResourceClaimId
        INTO claim_id;
    ELSE
        IF parent_resource_claim_id != existing_parent_resource_claim_id OR (parent_resource_claim_id IS NULL AND existing_parent_resource_claim_id IS NOT NULL) OR (parent_resource_claim_id IS NOT NULL AND existing_parent_resource_claim_id IS NULL) THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || claim_name || ''' (ResourceClaimId=' || claim_id || ') to new parent (from ResourceClaimId=' || COALESCE(existing_parent_resource_claim_id, 0) || ' to ResourceClaimId=' || COALESCE(parent_resource_claim_id, 0) || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = parent_resource_claim_id
            WHERE ResourceClaimId = claim_id;
        END IF;
    END IF;
  

    -- Pop the stack
    claim_id_stack := (select claim_id_stack[1:array_upper(claim_id_stack, 1) - 1]);


    -- Pop the stack
    claim_id_stack := (select claim_id_stack[1:array_upper(claim_id_stack, 1) - 1]);

    COMMIT;

    -- TODO: Remove - For interactive development only
    -- SELECT dbo.GetAuthorizationMetadataDocument();
    -- ROLLBACK;
END $$;
