BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.AssessmentAdministration') AND name = N'UX_AssessmentAdministration_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentAdministration_Id ON [sk].[AssessmentAdministration]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.CrisisDetails') AND name = N'UX_CrisisDetails_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CrisisDetails_Id ON [sk].[CrisisDetails]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'sk.PostGraduateActivity') AND name = N'UX_PostGraduateActivity_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostGraduateActivity_Id ON [sk].[PostGraduateActivity]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

