CREATE TRIGGER [sk].[sk_AssessmentAdministration_TR_UpdateChangeVersion] ON [sk].[AssessmentAdministration] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [sk].[AssessmentAdministration]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [sk].[AssessmentAdministration] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [sk].[sk_CrisisDetails_TR_UpdateChangeVersion] ON [sk].[CrisisDetails] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [sk].[CrisisDetails]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [sk].[CrisisDetails] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [sk].[sk_PostGraduateActivity_TR_UpdateChangeVersion] ON [sk].[PostGraduateActivity] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [sk].[PostGraduateActivity]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [sk].[PostGraduateActivity] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

