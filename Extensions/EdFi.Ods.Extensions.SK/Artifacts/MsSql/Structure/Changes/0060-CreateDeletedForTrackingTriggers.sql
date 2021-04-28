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


