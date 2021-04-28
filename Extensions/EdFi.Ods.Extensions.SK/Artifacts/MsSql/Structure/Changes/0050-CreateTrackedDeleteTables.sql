CREATE TABLE [tracked_deletes_sk].[SpecialEducationProgramDescriptor]
(
       SpecialEducationProgramDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationProgramDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)
