CREATE TRIGGER [ne].[ne_AssessmentAdministration_TR_DeleteTracking] ON [ne].[AssessmentAdministration] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[AssessmentAdministration](AssessmentIdentifier, EducationOrganizationId, Namespace, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, EducationOrganizationId, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [ne].[AssessmentAdministration] ENABLE TRIGGER [ne_AssessmentAdministration_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_CrisisDetails_TR_DeleteTracking] ON [ne].[CrisisDetails] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[CrisisDetails](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [ne].[CrisisDetails] ENABLE TRIGGER [ne_CrisisDetails_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_CrisisEventDescriptor_TR_DeleteTracking] ON [ne].[CrisisEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[CrisisEventDescriptor](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[CrisisEventDescriptor] ENABLE TRIGGER [ne_CrisisEventDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_CrisisTypeDescriptor_TR_DeleteTracking] ON [ne].[CrisisTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[CrisisTypeDescriptor](CrisisTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[CrisisTypeDescriptor] ENABLE TRIGGER [ne_CrisisTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_DualCreditDescriptor_TR_DeleteTracking] ON [ne].[DualCreditDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[DualCreditDescriptor](DualCreditDescriptorId, Id, ChangeVersion)
    SELECT  d.DualCreditDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DualCreditDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[DualCreditDescriptor] ENABLE TRIGGER [ne_DualCreditDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_EarlyLearningSettingDescriptor_TR_DeleteTracking] ON [ne].[EarlyLearningSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[EarlyLearningSettingDescriptor](EarlyLearningSettingDescriptorId, Id, ChangeVersion)
    SELECT  d.EarlyLearningSettingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyLearningSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[EarlyLearningSettingDescriptor] ENABLE TRIGGER [ne_EarlyLearningSettingDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_ImmigrantIndicatorDescriptor_TR_DeleteTracking] ON [ne].[ImmigrantIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[ImmigrantIndicatorDescriptor](ImmigrantIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.ImmigrantIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ImmigrantIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[ImmigrantIndicatorDescriptor] ENABLE TRIGGER [ne_ImmigrantIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_PlacementTypeDescriptor_TR_DeleteTracking] ON [ne].[PlacementTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[PlacementTypeDescriptor](PlacementTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.PlacementTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PlacementTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PlacementTypeDescriptor] ENABLE TRIGGER [ne_PlacementTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_PositionTitleDescriptor_TR_DeleteTracking] ON [ne].[PositionTitleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[PositionTitleDescriptor](PositionTitleDescriptorId, Id, ChangeVersion)
    SELECT  d.PositionTitleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PositionTitleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PositionTitleDescriptor] ENABLE TRIGGER [ne_PositionTitleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_PostGraduateActivityDescriptor_TR_DeleteTracking] ON [ne].[PostGraduateActivityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[PostGraduateActivityDescriptor](PostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT  d.PostGraduateActivityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PostGraduateActivityDescriptor] ENABLE TRIGGER [ne_PostGraduateActivityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking] ON [ne].[PostGraduateActivityDeterminationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[PostGraduateActivityDeterminationDescriptor](PostGraduateActivityDeterminationDescriptorId, Id, ChangeVersion)
    SELECT  d.PostGraduateActivityDeterminationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDeterminationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[PostGraduateActivityDeterminationDescriptor] ENABLE TRIGGER [ne_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_PostGraduateActivity_TR_DeleteTracking] ON [ne].[PostGraduateActivity] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[PostGraduateActivity](LocalEducationAgencyId, SchoolYear, StudentUSI, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, SchoolYear, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [ne].[PostGraduateActivity] ENABLE TRIGGER [ne_PostGraduateActivity_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_SectionDeliveryDescriptor_TR_DeleteTracking] ON [ne].[SectionDeliveryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[SectionDeliveryDescriptor](SectionDeliveryDescriptorId, Id, ChangeVersion)
    SELECT  d.SectionDeliveryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionDeliveryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[SectionDeliveryDescriptor] ENABLE TRIGGER [ne_SectionDeliveryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_SpecialEducationProgramDescriptor_TR_DeleteTracking] ON [ne].[SpecialEducationProgramDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[SpecialEducationProgramDescriptor](SpecialEducationProgramDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationProgramDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationProgramDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[SpecialEducationProgramDescriptor] ENABLE TRIGGER [ne_SpecialEducationProgramDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_StudentEarlyLearningProgramAssociation_TR_DeleteTracking] ON [ne].[StudentEarlyLearningProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[StudentEarlyLearningProgramAssociation](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [ne].[StudentEarlyLearningProgramAssociation] ENABLE TRIGGER [ne_StudentEarlyLearningProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [ne].[ne_UnilateralRemovalDescriptor_TR_DeleteTracking] ON [ne].[UnilateralRemovalDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_ne].[UnilateralRemovalDescriptor](UnilateralRemovalDescriptorId, Id, ChangeVersion)
    SELECT  d.UnilateralRemovalDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.UnilateralRemovalDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [ne].[UnilateralRemovalDescriptor] ENABLE TRIGGER [ne_UnilateralRemovalDescriptor_TR_DeleteTracking]
GO


