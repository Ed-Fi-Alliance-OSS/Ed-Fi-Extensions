DO $$
DECLARE
    claim_id INTEGER;
	parent_claim_id INTEGER;
    claim_name VARCHAR(2048);
BEGIN
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating'
    ----------------------------------------------------------------------------------------------------------------------------
    claim_name := 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating';
    claim_id := NULL;
	parent_claim_id := NULL;
	
    SELECT ResourceClaimId, ParentResourceClaimId INTO claim_id, parent_claim_id
    FROM dbo.ResourceClaims
    WHERE ClaimName = claim_name;

	IF EXISTS(SELECT rcaas.ResourceClaimActionAuthorizationStrategyId
		FROM dbo.ResourceClaims AS rc
		JOIN dbo.ResourceClaimActions AS rca on rca.ResourceClaimId = rc.ResourceClaimId
		JOIN dbo.ResourceClaimActionAuthorizationStrategies AS rcaas on rcaas.ResourceClaimActionId = rca.ResourceClaimActionId
		WHERE rc.ResourceClaimId = parent_claim_id)
		THEN
			IF EXISTS(SELECT rcaas.ResourceClaimActionAuthorizationStrategyId
			FROM dbo.ResourceClaims AS rc
			JOIN dbo.ResourceClaimActions AS rca on rca.ResourceClaimId = rc.ResourceClaimId
			JOIN dbo.ResourceClaimActionAuthorizationStrategies AS rcaas on rcaas.ResourceClaimActionId = rca.ResourceClaimActionId
			WHERE rc.ResourceClaimId = claim_id)
			THEN
				-- Setting default authorization metadata
    			RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || claim_name || ''' (claimId=' || claim_id || ').';
    			DELETE 
				FROM dbo.ResourceClaimActionAuthorizationStrategies
				WHERE ResourceClaimActionAuthorizationStrategyId IN
				(
					SELECT rcaas.ResourceClaimActionAuthorizationStrategyId
					FROM dbo.ResourceClaims AS rc
					JOIN dbo.ResourceClaimActions AS rca on rca.ResourceClaimId = rc.ResourceClaimId
					JOIN dbo.ResourceClaimActionAuthorizationStrategies AS rcaas on rcaas.ResourceClaimActionId = rca.ResourceClaimActionId
					WHERE rc.ResourceClaimId = claim_id
				);
			END IF;
		END IF;
END $$;