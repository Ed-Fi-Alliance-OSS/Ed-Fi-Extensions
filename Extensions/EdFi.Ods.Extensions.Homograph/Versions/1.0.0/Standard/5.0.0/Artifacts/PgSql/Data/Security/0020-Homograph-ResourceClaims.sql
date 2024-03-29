
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/homograph'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/domains/homograph';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('homograph', 'http://ed-fi.org/ods/identity/claims/domains/homograph', parent_resource_claim_id)
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
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    DELETE FROM dbo.ResourceClaimActionAuthorizationStrategies
    WHERE ResourceClaimActionId IN (SELECT ResourceClaimActionId FROM dbo.ResourceClaimActions WHERE ResourceClaimId = claim_id);

    DELETE FROM dbo.ResourceClaimActions
    WHERE ResourceClaimId = claim_id;

    
    -- Default Create authorization
    RAISE NOTICE USING MESSAGE = 'Creating action ''Create'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    VALUES (claim_id, Create_action_id)
    RETURNING ResourceClaimActionId
    INTO resource_claim_action_id;

    
    authorization_strategy_id := NULL;

    SELECT a.AuthorizationStrategyId INTO authorization_strategy_id
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

    IF authorization_strategy_id IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''NoFurtherAuthorizationRequired''';
    END IF;

    RAISE NOTICE USING MESSAGE = 'Adding authorization strategy ''NoFurtherAuthorizationRequired'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    VALUES (resource_claim_action_id, authorization_strategy_id);

    -- Default Read authorization
    RAISE NOTICE USING MESSAGE = 'Creating action ''Read'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    VALUES (claim_id, Read_action_id)
    RETURNING ResourceClaimActionId
    INTO resource_claim_action_id;

    
    authorization_strategy_id := NULL;

    SELECT a.AuthorizationStrategyId INTO authorization_strategy_id
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

    IF authorization_strategy_id IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''NoFurtherAuthorizationRequired''';
    END IF;

    RAISE NOTICE USING MESSAGE = 'Adding authorization strategy ''NoFurtherAuthorizationRequired'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    VALUES (resource_claim_action_id, authorization_strategy_id);

    -- Default Update authorization
    RAISE NOTICE USING MESSAGE = 'Creating action ''Update'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    VALUES (claim_id, Update_action_id)
    RETURNING ResourceClaimActionId
    INTO resource_claim_action_id;

    
    authorization_strategy_id := NULL;

    SELECT a.AuthorizationStrategyId INTO authorization_strategy_id
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

    IF authorization_strategy_id IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''NoFurtherAuthorizationRequired''';
    END IF;

    RAISE NOTICE USING MESSAGE = 'Adding authorization strategy ''NoFurtherAuthorizationRequired'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    VALUES (resource_claim_action_id, authorization_strategy_id);

    -- Default Delete authorization
    RAISE NOTICE USING MESSAGE = 'Creating action ''Delete'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    VALUES (claim_id, Delete_action_id)
    RETURNING ResourceClaimActionId
    INTO resource_claim_action_id;

    
    authorization_strategy_id := NULL;

    SELECT a.AuthorizationStrategyId INTO authorization_strategy_id
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

    IF authorization_strategy_id IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''NoFurtherAuthorizationRequired''';
    END IF;

    RAISE NOTICE USING MESSAGE = 'Adding authorization strategy ''NoFurtherAuthorizationRequired'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    VALUES (resource_claim_action_id, authorization_strategy_id);

    -- Default ReadChanges authorization
    RAISE NOTICE USING MESSAGE = 'Creating action ''ReadChanges'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';

    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    VALUES (claim_id, ReadChanges_action_id)
    RETURNING ResourceClaimActionId
    INTO resource_claim_action_id;

    
    authorization_strategy_id := NULL;

    SELECT a.AuthorizationStrategyId INTO authorization_strategy_id
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

    IF authorization_strategy_id IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''NoFurtherAuthorizationRequired''';
    END IF;

    RAISE NOTICE USING MESSAGE = 'Adding authorization strategy ''NoFurtherAuthorizationRequired'' for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    VALUES (resource_claim_action_id, authorization_strategy_id);

    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/domains/homograph
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Ed-Fi Sandbox'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_set_name := 'Ed-Fi Sandbox';
    claim_set_id := NULL;

    SELECT ClaimSetId INTO claim_set_id
    FROM dbo.ClaimSets
    WHERE ClaimSetName = claim_set_name;

    IF claim_set_id IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', claim_set_name;

        INSERT INTO dbo.ClaimSets(ClaimSetName)
        VALUES (claim_set_name)
        RETURNING ClaimSetId
        INTO claim_set_id;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ') on resource claim ''' || claim_name || '''.';

    DELETE FROM dbo.ClaimSetResourceClaimActionAuthorizationStrategyOverrides
    WHERE ClaimSetResourceClaimActionId IN (
        SELECT ClaimSetResourceClaimActionId FROM dbo.ClaimSetResourceClaimActions WHERE ClaimSetId = claim_set_id AND ResourceClaimId = claim_id);
    
    DELETE FROM dbo.ClaimSetResourceClaimActions
    WHERE ClaimSetId = claim_set_id AND ResourceClaimId = claim_id;

    

    -- Claim set-specific Create authorization
    RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ', actionId = ' || Create_action_id || ').';

    INSERT INTO dbo.ClaimSetResourceClaimActions(ResourceClaimId, ClaimSetId, ActionId)
    VALUES (claim_id, claim_set_id, Create_action_id) -- Create
    RETURNING ClaimSetResourceClaimActionId
    INTO claim_set_resource_claim_action_id;

    
    

    -- Claim set-specific Read authorization
    RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ', actionId = ' || Read_action_id || ').';

    INSERT INTO dbo.ClaimSetResourceClaimActions(ResourceClaimId, ClaimSetId, ActionId)
    VALUES (claim_id, claim_set_id, Read_action_id) -- Read
    RETURNING ClaimSetResourceClaimActionId
    INTO claim_set_resource_claim_action_id;

    
    

    -- Claim set-specific Update authorization
    RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ', actionId = ' || Update_action_id || ').';

    INSERT INTO dbo.ClaimSetResourceClaimActions(ResourceClaimId, ClaimSetId, ActionId)
    VALUES (claim_id, claim_set_id, Update_action_id) -- Update
    RETURNING ClaimSetResourceClaimActionId
    INTO claim_set_resource_claim_action_id;

    
    

    -- Claim set-specific Delete authorization
    RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ', actionId = ' || Delete_action_id || ').';

    INSERT INTO dbo.ClaimSetResourceClaimActions(ResourceClaimId, ClaimSetId, ActionId)
    VALUES (claim_id, claim_set_id, Delete_action_id) -- Delete
    RETURNING ClaimSetResourceClaimActionId
    INTO claim_set_resource_claim_action_id;

    
    

    -- Claim set-specific ReadChanges authorization
    RAISE NOTICE USING MESSAGE = 'Creating ''ReadChanges'' action for claim set ''' || claim_set_name || ''' (claimSetId=' || claim_set_id || ', actionId = ' || ReadChanges_action_id || ').';

    INSERT INTO dbo.ClaimSetResourceClaimActions(ResourceClaimId, ClaimSetId, ActionId)
    VALUES (claim_id, claim_set_id, ReadChanges_action_id) -- ReadChanges
    RETURNING ClaimSetResourceClaimActionId
    INTO claim_set_resource_claim_action_id;

    
    
    -- Push claimId to the stack
    claim_id_stack := array_append(claim_id_stack, claim_id);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/homograph
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/name'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/name';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('name', 'http://ed-fi.org/ods/identity/claims/homograph/name', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/school'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/school';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('school', 'http://ed-fi.org/ods/identity/claims/homograph/school', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/contact'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/contact';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('contact', 'http://ed-fi.org/ods/identity/claims/homograph/contact', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/student'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/student';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('student', 'http://ed-fi.org/ods/identity/claims/homograph/student', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/staff'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/staff';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('staff', 'http://ed-fi.org/ods/identity/claims/homograph/staff', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/schoolYearType'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/schoolYearType';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('schoolYearType', 'http://ed-fi.org/ods/identity/claims/homograph/schoolYearType', parent_resource_claim_id)
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
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/homograph/studentSchoolAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/homograph/studentSchoolAssociation';
    claim_id := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, existing_parent_resource_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

    parent_resource_claim_id := claim_id_stack[array_upper(claim_id_stack, 1)];

    IF claim_id IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', claim_name;

        INSERT INTO dbo.ResourceClaims(ResourceName, ClaimName, ParentResourceClaimId)
        VALUES ('studentSchoolAssociation', 'http://ed-fi.org/ods/identity/claims/homograph/studentSchoolAssociation', parent_resource_claim_id)
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
