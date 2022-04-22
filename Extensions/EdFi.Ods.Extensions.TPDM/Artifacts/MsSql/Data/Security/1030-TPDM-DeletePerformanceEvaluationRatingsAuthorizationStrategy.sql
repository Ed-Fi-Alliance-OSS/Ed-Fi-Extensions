-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DECLARE 
	@claimId AS INT,
    @claimName AS nvarchar(max)

SET @claimName = 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating'

SELECT @claimId = ResourceClaimId
FROM dbo.ResourceClaims 
WHERE ClaimName = @claimName

-- Setting default authorization metadata
PRINT 'Deleting default action authorizations for resource claim ''' + @claimName + ''' (claimId=' + CONVERT(nvarchar, @claimId) + ').'

DELETE rcaas
FROM dbo.ResourceClaims rc
JOIN dbo.ResourceClaimActions rca on rca.ResourceClaimId = rc.ResourceClaimId
JOIN dbo.ResourceClaimActionAuthorizationStrategies rcaas on rcaas.ResourceClaimActionId = rca.ResourceClaimActionId
WHERE rc.ResourceClaimId = @claimId