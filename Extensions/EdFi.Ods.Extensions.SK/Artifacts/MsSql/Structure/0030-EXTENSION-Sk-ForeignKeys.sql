ALTER TABLE [sk].[SpecialEducationProgramDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationProgramDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationProgramDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentLanguageInstructionProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationExtension_StudentLanguageInstructionProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentLanguageInstructionProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ResidentLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_LocalEducationAgency]
ON [sk].[StudentSchoolAssociationExtension] ([ResidentLocalEducationAgencyId] ASC)
GO

ALTER TABLE [sk].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_School] FOREIGN KEY ([ResidentSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_School]
ON [sk].[StudentSchoolAssociationExtension] ([ResidentSchoolId] ASC)
GO

ALTER TABLE [sk].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_School1] FOREIGN KEY ([ReportingSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_School1]
ON [sk].[StudentSchoolAssociationExtension] ([ReportingSchoolId] ASC)
GO

ALTER TABLE [sk].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [sk].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

