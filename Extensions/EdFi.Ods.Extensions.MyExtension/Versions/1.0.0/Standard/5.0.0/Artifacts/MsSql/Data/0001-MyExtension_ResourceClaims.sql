
  
DECLARE @ParentResourceClaimId INT
SELECT @ParentResourceClaimId = ResourceClaimId
FROM [dbo].[ResourceClaims]
WHERE ResourceName = 'relationshipBasedData'
 
INSERT INTO [dbo].[ResourceClaims] ( [ResourceName]
                                     ,[ClaimName]     
                                     ,[ParentResourceClaimId]
                                     )
VALUES ('MyExtension'
        ,'http://ed-fi.org/ods/identity/claims/my-extension/MyExtension'
        ,@ParentResourceClaimId
        )