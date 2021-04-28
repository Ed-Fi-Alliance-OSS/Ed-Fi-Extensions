CREATE TRIGGER [sk].[sk_AssessmentAdministration_TR_DeleteTracking] ON [sk].[AssessmentAdministration] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[AssessmentAdministration](AssessmentIdentifier, EducationOrganizationId, Namespace, Id, ChangeVersion)
    SELECT  AssessmentIdentifier, EducationOrganizationId, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [sk].[AssessmentAdministration] ENABLE TRIGGER [sk_AssessmentAdministration_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_CrisisDetails_TR_DeleteTracking] ON [sk].[CrisisDetails] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[CrisisDetails](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [sk].[CrisisDetails] ENABLE TRIGGER [sk_CrisisDetails_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_CrisisEventDescriptor_TR_DeleteTracking] ON [sk].[CrisisEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[CrisisEventDescriptor](CrisisEventDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[CrisisEventDescriptor] ENABLE TRIGGER [sk_CrisisEventDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_CrisisTypeDescriptor_TR_DeleteTracking] ON [sk].[CrisisTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[CrisisTypeDescriptor](CrisisTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CrisisTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CrisisTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[CrisisTypeDescriptor] ENABLE TRIGGER [sk_CrisisTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_DualCreditDescriptor_TR_DeleteTracking] ON [sk].[DualCreditDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[DualCreditDescriptor](DualCreditDescriptorId, Id, ChangeVersion)
    SELECT  d.DualCreditDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DualCreditDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[DualCreditDescriptor] ENABLE TRIGGER [sk_DualCreditDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_EarlyLearningSettingDescriptor_TR_DeleteTracking] ON [sk].[EarlyLearningSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[EarlyLearningSettingDescriptor](EarlyLearningSettingDescriptorId, Id, ChangeVersion)
    SELECT  d.EarlyLearningSettingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyLearningSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[EarlyLearningSettingDescriptor] ENABLE TRIGGER [sk_EarlyLearningSettingDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_ImmigrantIndicatorDescriptor_TR_DeleteTracking] ON [sk].[ImmigrantIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[ImmigrantIndicatorDescriptor](ImmigrantIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.ImmigrantIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ImmigrantIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[ImmigrantIndicatorDescriptor] ENABLE TRIGGER [sk_ImmigrantIndicatorDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_PlacementTypeDescriptor_TR_DeleteTracking] ON [sk].[PlacementTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[PlacementTypeDescriptor](PlacementTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.PlacementTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PlacementTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[PlacementTypeDescriptor] ENABLE TRIGGER [sk_PlacementTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_PositionTitleDescriptor_TR_DeleteTracking] ON [sk].[PositionTitleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[PositionTitleDescriptor](PositionTitleDescriptorId, Id, ChangeVersion)
    SELECT  d.PositionTitleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PositionTitleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[PositionTitleDescriptor] ENABLE TRIGGER [sk_PositionTitleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_PostGraduateActivityDescriptor_TR_DeleteTracking] ON [sk].[PostGraduateActivityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[PostGraduateActivityDescriptor](PostGraduateActivityDescriptorId, Id, ChangeVersion)
    SELECT  d.PostGraduateActivityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[PostGraduateActivityDescriptor] ENABLE TRIGGER [sk_PostGraduateActivityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking] ON [sk].[PostGraduateActivityDeterminationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[PostGraduateActivityDeterminationDescriptor](PostGraduateActivityDeterminationDescriptorId, Id, ChangeVersion)
    SELECT  d.PostGraduateActivityDeterminationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostGraduateActivityDeterminationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[PostGraduateActivityDeterminationDescriptor] ENABLE TRIGGER [sk_PostGraduateActivityDeterminationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_PostGraduateActivity_TR_DeleteTracking] ON [sk].[PostGraduateActivity] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[PostGraduateActivity](LocalEducationAgencyId, SchoolYear, StudentUSI, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, SchoolYear, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [sk].[PostGraduateActivity] ENABLE TRIGGER [sk_PostGraduateActivity_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_SectionDeliveryDescriptor_TR_DeleteTracking] ON [sk].[SectionDeliveryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[SectionDeliveryDescriptor](SectionDeliveryDescriptorId, Id, ChangeVersion)
    SELECT  d.SectionDeliveryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionDeliveryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[SectionDeliveryDescriptor] ENABLE TRIGGER [sk_SectionDeliveryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_SpecialEducationProgramDescriptor_TR_DeleteTracking] ON [sk].[SpecialEducationProgramDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[SpecialEducationProgramDescriptor](SpecialEducationProgramDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationProgramDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationProgramDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[SpecialEducationProgramDescriptor] ENABLE TRIGGER [sk_SpecialEducationProgramDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_StudentEarlyLearningProgramAssociation_TR_DeleteTracking] ON [sk].[StudentEarlyLearningProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[StudentEarlyLearningProgramAssociation](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [sk].[StudentEarlyLearningProgramAssociation] ENABLE TRIGGER [sk_StudentEarlyLearningProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [sk].[sk_UnilateralRemovalDescriptor_TR_DeleteTracking] ON [sk].[UnilateralRemovalDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_sk].[UnilateralRemovalDescriptor](UnilateralRemovalDescriptorId, Id, ChangeVersion)
    SELECT  d.UnilateralRemovalDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.UnilateralRemovalDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [sk].[UnilateralRemovalDescriptor] ENABLE TRIGGER [sk_UnilateralRemovalDescriptor_TR_DeleteTracking]
GO


