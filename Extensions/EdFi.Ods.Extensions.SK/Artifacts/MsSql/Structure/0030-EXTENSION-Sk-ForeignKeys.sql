ALTER TABLE [sk].[AssessmentAdministration] WITH CHECK ADD CONSTRAINT [FK_AssessmentAdministration_Assessment] FOREIGN KEY ([AssessmentIdentifier], [Namespace])
REFERENCES [edfi].[Assessment] ([AssessmentIdentifier], [Namespace])
GO

CREATE NONCLUSTERED INDEX [FK_AssessmentAdministration_Assessment]
ON [sk].[AssessmentAdministration] ([AssessmentIdentifier] ASC, [Namespace] ASC)
GO

ALTER TABLE [sk].[AssessmentAdministration] WITH CHECK ADD CONSTRAINT [FK_AssessmentAdministration_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_AssessmentAdministration_EducationOrganization]
ON [sk].[AssessmentAdministration] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [sk].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [sk].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

ALTER TABLE [sk].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisTypeDescriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [sk].[CrisisTypeDescriptor] ([CrisisTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CrisisDetails_CrisisTypeDescriptor]
ON [sk].[CrisisDetails] ([CrisisTypeDescriptorId] ASC)
GO

ALTER TABLE [sk].[CrisisEventDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisEventDescriptor_Descriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[CrisisTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisTypeDescriptor_Descriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_DisciplineAction] FOREIGN KEY ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
REFERENCES [edfi].[DisciplineAction] ([DisciplineActionIdentifier], [DisciplineDate], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[DisciplineActionExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineActionExtension_UnilateralRemovalDescriptor] FOREIGN KEY ([UnilateralRemovalDescriptorId])
REFERENCES [sk].[UnilateralRemovalDescriptor] ([UnilateralRemovalDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineActionExtension_UnilateralRemovalDescriptor]
ON [sk].[DisciplineActionExtension] ([UnilateralRemovalDescriptorId] ASC)
GO

ALTER TABLE [sk].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[DualCreditDescriptor] WITH CHECK ADD CONSTRAINT [FK_DualCreditDescriptor_Descriptor] FOREIGN KEY ([DualCreditDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[EarlyLearningSettingDescriptor] WITH CHECK ADD CONSTRAINT [FK_EarlyLearningSettingDescriptor_Descriptor] FOREIGN KEY ([EarlyLearningSettingDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[ImmigrantIndicatorDescriptor] WITH CHECK ADD CONSTRAINT [FK_ImmigrantIndicatorDescriptor_Descriptor] FOREIGN KEY ([ImmigrantIndicatorDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[PlacementTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PlacementTypeDescriptor_Descriptor] FOREIGN KEY ([PlacementTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[PositionTitleDescriptor] WITH CHECK ADD CONSTRAINT [FK_PositionTitleDescriptor_Descriptor] FOREIGN KEY ([PositionTitleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_LocalEducationAgency]
ON [sk].[PostGraduateActivity] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [sk].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_PostGraduateActivityDescriptor] FOREIGN KEY ([PostGraduateActivityDescriptorId])
REFERENCES [sk].[PostGraduateActivityDescriptor] ([PostGraduateActivityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_PostGraduateActivityDescriptor]
ON [sk].[PostGraduateActivity] ([PostGraduateActivityDescriptorId] ASC)
GO

ALTER TABLE [sk].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_PostGraduateActivityDeterminationDescriptor] FOREIGN KEY ([PostGraduateActivityDeterminationDescriptorId])
REFERENCES [sk].[PostGraduateActivityDeterminationDescriptor] ([PostGraduateActivityDeterminationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_PostGraduateActivityDeterminationDescriptor]
ON [sk].[PostGraduateActivity] ([PostGraduateActivityDeterminationDescriptorId] ASC)
GO

ALTER TABLE [sk].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_SchoolYearType]
ON [sk].[PostGraduateActivity] ([SchoolYear] ASC)
GO

ALTER TABLE [sk].[PostGraduateActivity] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivity_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PostGraduateActivity_Student]
ON [sk].[PostGraduateActivity] ([StudentUSI] ASC)
GO

ALTER TABLE [sk].[PostGraduateActivityDescriptor] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivityDescriptor_Descriptor] FOREIGN KEY ([PostGraduateActivityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[PostGraduateActivityDeterminationDescriptor] WITH CHECK ADD CONSTRAINT [FK_PostGraduateActivityDeterminationDescriptor_Descriptor] FOREIGN KEY ([PostGraduateActivityDeterminationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[SectionDelivery] WITH CHECK ADD CONSTRAINT [FK_SectionDelivery_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionDelivery_Section]
ON [sk].[SectionDelivery] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [sk].[SectionDelivery] WITH CHECK ADD CONSTRAINT [FK_SectionDelivery_SectionDeliveryDescriptor] FOREIGN KEY ([SectionDeliveryDescriptorId])
REFERENCES [sk].[SectionDeliveryDescriptor] ([SectionDeliveryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionDelivery_SectionDeliveryDescriptor]
ON [sk].[SectionDelivery] ([SectionDeliveryDescriptorId] ASC)
GO

ALTER TABLE [sk].[SectionDeliveryDescriptor] WITH CHECK ADD CONSTRAINT [FK_SectionDeliveryDescriptor_Descriptor] FOREIGN KEY ([SectionDeliveryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [sk].[SpecialEducationProgramDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationProgramDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationProgramDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentDisciplineIncidentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationExtension_StudentDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([IncidentIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentDisciplineIncidentAssociationWeapon] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationWeapon_StudentDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentDisciplineIncidentAssociation] ([IncidentIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationWeapon_StudentDisciplineIncidentAssociation]
ON [sk].[StudentDisciplineIncidentAssociationWeapon] ([IncidentIdentifier] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [sk].[StudentDisciplineIncidentAssociationWeapon] WITH CHECK ADD CONSTRAINT [FK_StudentDisciplineIncidentAssociationWeapon_WeaponDescriptor] FOREIGN KEY ([WeaponDescriptorId])
REFERENCES [edfi].[WeaponDescriptor] ([WeaponDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDisciplineIncidentAssociationWeapon_WeaponDescriptor]
ON [sk].[StudentDisciplineIncidentAssociationWeapon] ([WeaponDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentEarlyLearningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyLearningProgramAssociation_EarlyLearningSettingDescriptor] FOREIGN KEY ([EarlyLearningSettingDescriptorId])
REFERENCES [sk].[EarlyLearningSettingDescriptor] ([EarlyLearningSettingDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyLearningProgramAssociation_EarlyLearningSettingDescriptor]
ON [sk].[StudentEarlyLearningProgramAssociation] ([EarlyLearningSettingDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentEarlyLearningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyLearningProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_ImmigrantIndicatorDescriptor] FOREIGN KEY ([ImmigrantIndicatorDescriptorId])
REFERENCES [sk].[ImmigrantIndicatorDescriptor] ([ImmigrantIndicatorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_ImmigrantIndicatorDescriptor]
ON [sk].[StudentEducationOrganizationAssociationExtension] ([ImmigrantIndicatorDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [sk].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor]
ON [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([CrisisEventDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation]
ON [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
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

ALTER TABLE [sk].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_DualCreditDescriptor] FOREIGN KEY ([DualCreditDescriptorId])
REFERENCES [sk].[DualCreditDescriptor] ([DualCreditDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_DualCreditDescriptor]
ON [sk].[StudentSectionAssociationExtension] ([DualCreditDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [sk].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_PlacementTypeDescriptor] FOREIGN KEY ([PlacementTypeDescriptorId])
REFERENCES [sk].[PlacementTypeDescriptor] ([PlacementTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_PlacementTypeDescriptor]
ON [sk].[StudentSpecialEducationProgramAssociationExtension] ([PlacementTypeDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationProgramDescriptor] FOREIGN KEY ([SpecialEducationProgramDescriptorId])
REFERENCES [sk].[SpecialEducationProgramDescriptor] ([SpecialEducationProgramDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_SpecialEducationProgramDescriptor]
ON [sk].[StudentSpecialEducationProgramAssociationExtension] ([SpecialEducationProgramDescriptorId] ASC)
GO

ALTER TABLE [sk].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sk].[UnilateralRemovalDescriptor] WITH CHECK ADD CONSTRAINT [FK_UnilateralRemovalDescriptor_Descriptor] FOREIGN KEY ([UnilateralRemovalDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

