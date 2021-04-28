BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.AssessmentAdministration') AND name = N'UX_AssessmentAdministration_ChangeVersion')
    CREATE INDEX [UX_AssessmentAdministration_ChangeVersion] ON [sk].[AssessmentAdministration] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.CrisisDetails') AND name = N'UX_CrisisDetails_ChangeVersion')
    CREATE INDEX [UX_CrisisDetails_ChangeVersion] ON [sk].[CrisisDetails] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.PostGraduateActivity') AND name = N'UX_PostGraduateActivity_ChangeVersion')
    CREATE INDEX [UX_PostGraduateActivity_ChangeVersion] ON [sk].[PostGraduateActivity] ([ChangeVersion] ASC)
    GO
COMMIT

