do $$
declare appId int;
declare systemDescriptorsResourceClaimId int;
declare relationshipBasedDataResourceClaimId int;
declare educationOrganizationsResourceClaimId int;
declare authStrategyId int;

begin

SELECT ApplicationId into appId
FROM dbo.Applications
WHERE ApplicationName = 'Ed-Fi ODS API';

SELECT ResourceClaimId into systemDescriptorsResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors';

SELECT ResourceClaimId into relationshipBasedDataResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/relationshipBasedData';

SELECT ResourceClaimId into educationOrganizationsResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations';

INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/artMediumDescriptor'
    , systemDescriptorsResourceClaimId
    );
	
INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/favoriteBookCategoryDescriptor'
    , systemDescriptorsResourceClaimId
    );

INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/membershipTypeDescriptor'
    , systemDescriptorsResourceClaimId
    );
	
INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/bus'
    , educationOrganizationsResourceClaimId
    );
	
INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/busRoute'
    , educationOrganizationsResourceClaimId
    );
	
INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId
    )
VALUES (
     'http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation'
    , relationshipBasedDataResourceClaimId );
	
INSERT INTO dbo.ResourceClaims (
    ClaimName
    ,ParentResourceClaimId  )
VALUES (
    'http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation'
    , relationshipBasedDataResourceClaimId  );


select AuthorizationStrategyId into authStrategyId from dbo.AuthorizationStrategies where AuthorizationStrategyName = 'NoFurtherAuthorizationRequired';

--- These Resources need explicit metadata ---
    INSERT INTO dbo.ResourceClaimActions(ResourceClaimId, ActionId)
    SELECT   ResourceClaimId, ac.ActionId
    from dbo.ResourceClaims
    inner join lateral
        (select ActionId
        from dbo.Actions
        where ActionName in ('Create', 'Read', 'Update', 'Delete')) as ac on true
    where ClaimName in ('http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation', 'http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation');



    INSERT INTO dbo.ResourceClaimActionAuthorizationStrategies(ResourceClaimActionId, AuthorizationStrategyId)
    select resourceClaimActionId,authStrategyId from dbo.ResourceClaimActions RCA
    INNER JOIN dbo.ResourceClaims  RC   ON RC.ResourceClaimId = RCA.ResourceClaimId
    INNER JOIN dbo.Actions  A  ON A.ActionId = RCA.ActionId
    WHERE A.ActionName IN ('Create', 'Read', 'Update', 'Delete')
    AND  RC.ClaimName IN ('http://ed-fi.org/ods/identity/claims/sample/studentGraduationPlanAssociation', 'http://ed-fi.org/ods/identity/claims/sample/studentArtProgramAssociation');

end $$