ALTER TABLE [ne].[CalendarDateExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarDateExtension_CalendarDate] FOREIGN KEY ([CalendarCode], [Date], [SchoolId], [SchoolYear])
REFERENCES [edfi].[CalendarDate] ([CalendarCode], [Date], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [ne].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

ALTER TABLE [ne].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisTypeDescriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [ne].[CrisisTypeDescriptor] ([CrisisTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CrisisDetails_CrisisTypeDescriptor]
ON [ne].[CrisisDetails] ([CrisisTypeDescriptorId] ASC)
GO

ALTER TABLE [ne].[CrisisEventDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisEventDescriptor_Descriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[CrisisTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisTypeDescriptor_Descriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_DisciplineAction] FOREIGN KEY ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_UnilateralRemovalDescriptor] FOREIGN KEY ([UnilateralRemovalDescriptorId])
REFERENCES [ne].[UnilateralRemovalDescriptor] ([UnilateralRemovalDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionExtension_UnilateralRemovalDescriptor]
ON [ne].[DisciplineActionExtension] ([UnilateralRemovalDescriptorId] ASC)
GO

ALTER TABLE [ne].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[DualCreditDescriptor] WITH CHECK ADD CONSTRAINT [FK_DualCreditDescriptor_Descriptor] FOREIGN KEY ([DualCreditDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[EarlyLearningSettingDescriptor] WITH CHECK ADD CONSTRAINT [FK_EarlyLearningSettingDescriptor_Descriptor] FOREIGN KEY ([EarlyLearningSettingDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[ImmigrantIndicatorDescriptor] WITH CHECK ADD CONSTRAINT [FK_ImmigrantIndicatorDescriptor_Descriptor] FOREIGN KEY ([ImmigrantIndicatorDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[PlacementTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PlacementTypeDescriptor_Descriptor] FOREIGN KEY ([PlacementTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[PositionTitleDescriptor] WITH CHECK ADD CONSTRAINT [FK_PositionTitleDescriptor_Descriptor] FOREIGN KEY ([PositionTitleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_LocalEducationAgency]
ON [ne].[PostGraduateActivity] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [ne].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_PostGraduateActivityDescriptor] FOREIGN KEY ([PostGraduateActivityDescriptorId])
REFERENCES [ne].[PostGraduateActivityDescriptor] ([PostGraduateActivityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_PostGraduateActivityDescriptor]
ON [ne].[PostGraduateActivity] ([PostGraduateActivityDescriptorId] ASC)
GO

ALTER TABLE [ne].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_PostGraduateActivityDeterminationDescriptor] FOREIGN KEY ([PostGraduateActivityDeterminationDescriptorId])
REFERENCES [ne].[PostGraduateActivityDeterminationDescriptor] ([PostGraduateActivityDeterminationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_PostGraduateActivityDeterminationDescriptor]
ON [ne].[PostGraduateActivity] ([PostGraduateActivityDeterminationDescriptorId] ASC)
GO

ALTER TABLE [ne].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_SchoolYearType]
ON [ne].[PostGraduateActivity] ([SchoolYear] ASC)
GO

ALTER TABLE [ne].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_Student]
ON [ne].[PostGraduateActivity] ([StudentUSI] ASC)
GO

ALTER TABLE [ne].[PostGraduateActivityDescriptor] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivityDescriptor_Descriptor] FOREIGN KEY ([PostGraduateActivityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[PostGraduateActivityDeterminationDescriptor] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivityDeterminationDescriptor_Descriptor] FOREIGN KEY ([PostGraduateActivityDeterminationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[SectionDelivery] WITH CHECK ADD CONSTRAINT [FK_SectionDelivery_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionDelivery_Section]
ON [ne].[SectionDelivery] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [ne].[SectionDelivery] WITH CHECK ADD CONSTRAINT [FK_SectionDelivery_SectionDeliveryDescriptor] FOREIGN KEY ([SectionDeliveryDescriptorId])
REFERENCES [ne].[SectionDeliveryDescriptor] ([SectionDeliveryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionDelivery_SectionDeliveryDescriptor]
ON [ne].[SectionDelivery] ([SectionDeliveryDescriptorId] ASC)
GO

ALTER TABLE [ne].[SectionDeliveryDescriptor] WITH CHECK ADD CONSTRAINT [FK_SectionDeliveryDescriptor_Descriptor] FOREIGN KEY ([SectionDeliveryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [ne].[SpecialEducationProgramDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationProgramDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationProgramDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[StudentDisciplineIncidentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([IncidentIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[StudentDisciplineIncidentAssociationWeapon] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationWeapon_StudentDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([IncidentIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationWeapon_StudentDisciplineIncidentAssociation]
ON [ne].[StudentDisciplineIncidentAssociationWeapon] ([IncidentIdentifier] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [ne].[StudentDisciplineIncidentAssociationWeapon] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationWeapon_WeaponDescriptor] FOREIGN KEY ([WeaponDescriptorId])
REFERENCES [edfi].[WeaponDescriptor] ([WeaponDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationWeapon_WeaponDescriptor]
ON [ne].[StudentDisciplineIncidentAssociationWeapon] ([WeaponDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentEarlyLearningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyLearningProgramAssociation_EarlyLearningSettingDescriptor] FOREIGN KEY ([EarlyLearningSettingDescriptorId])
REFERENCES [ne].[EarlyLearningSettingDescriptor] ([EarlyLearningSettingDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyLearningProgramAssociation_EarlyLearningSettingDescriptor]
ON [ne].[StudentEarlyLearningProgramAssociation] ([EarlyLearningSettingDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentEarlyLearningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyLearningProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_ImmigrantIndicatorDescriptor] FOREIGN KEY ([ImmigrantIndicatorDescriptorId])
REFERENCES [ne].[ImmigrantIndicatorDescriptor] ([ImmigrantIndicatorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_ImmigrantIndicatorDescriptor]
ON [ne].[StudentEducationOrganizationAssociationExtension] ([ImmigrantIndicatorDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [ne].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor]
ON [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([CrisisEventDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation]
ON [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [ne].[StudentLanguageInstructionProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationExtension_StudentLanguageInstructionProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentLanguageInstructionProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ResidentLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_LocalEducationAgency]
ON [ne].[StudentSchoolAssociationExtension] ([ResidentLocalEducationAgencyId] ASC)
GO

ALTER TABLE [ne].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_School] FOREIGN KEY ([ReportingSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_School]
ON [ne].[StudentSchoolAssociationExtension] ([ReportingSchoolId] ASC)
GO

ALTER TABLE [ne].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [ne].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_DualCreditDescriptor] FOREIGN KEY ([DualCreditDescriptorId])
REFERENCES [ne].[DualCreditDescriptor] ([DualCreditDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_DualCreditDescriptor]
ON [ne].[StudentSectionAssociationExtension] ([DualCreditDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [ne].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_PlacementTypeDescriptor] FOREIGN KEY ([PlacementTypeDescriptorId])
REFERENCES [ne].[PlacementTypeDescriptor] ([PlacementTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_PlacementTypeDescriptor]
ON [ne].[StudentSpecialEducationProgramAssociationExtension] ([PlacementTypeDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationProgramDescriptor] FOREIGN KEY ([SpecialEducationProgramDescriptorId])
REFERENCES [ne].[SpecialEducationProgramDescriptor] ([SpecialEducationProgramDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationProgramDescriptor]
ON [ne].[StudentSpecialEducationProgramAssociationExtension] ([SpecialEducationProgramDescriptorId] ASC)
GO

ALTER TABLE [ne].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [ne].[UnilateralRemovalDescriptor] WITH CHECK ADD CONSTRAINT [FK_UnilateralRemovalDescriptor_Descriptor] FOREIGN KEY ([UnilateralRemovalDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

