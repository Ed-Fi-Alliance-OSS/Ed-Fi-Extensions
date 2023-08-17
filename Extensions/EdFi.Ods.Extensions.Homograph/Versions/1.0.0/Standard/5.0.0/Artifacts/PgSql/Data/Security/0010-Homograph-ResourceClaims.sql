do $$
declare systemDescriptorsResourceClaimId int;
declare relationshipBasedDataResourceClaimId int;
declare educationOrganizationsResourceClaimId int;
begin


SELECT ResourceClaimId into systemDescriptorsResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors';

SELECT ResourceClaimId into relationshipBasedDataResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/relationshipBasedData';

SELECT ResourceClaimId into educationOrganizationsResourceClaimId
FROM dbo.ResourceClaims
WHERE ClaimName = 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations';

INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/name', educationOrganizationsResourceClaimId, appId);
	
INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/school', educationOrganizationsResourceClaimId, appId);
	
INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/contact', educationOrganizationsResourceClaimId, appId);
	
INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/student', educationOrganizationsResourceClaimId, appId);	

INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/staff', educationOrganizationsResourceClaimId, appId);	
		
INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/schoolYearType', educationOrganizationsResourceClaimId, appId);
	
INSERT INTO dbo.ResourceClaims
    (ClaimName, ParentResourceClaimId)
VALUES
    ('http://ed-fi.org/ods/identity/claims/homograph/studentSchoolAssociation', educationOrganizationsResourceClaimId, appId);	

end $$