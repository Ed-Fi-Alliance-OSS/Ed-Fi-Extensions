ALTER TABLE sk.AssessmentAdministration ADD CONSTRAINT FK_c64558_Assessment FOREIGN KEY (AssessmentIdentifier, Namespace)
REFERENCES edfi.Assessment (AssessmentIdentifier, Namespace)
;

CREATE INDEX FK_c64558_Assessment
ON sk.AssessmentAdministration (AssessmentIdentifier ASC, Namespace ASC);

ALTER TABLE sk.AssessmentAdministration ADD CONSTRAINT FK_c64558_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_c64558_EducationOrganization
ON sk.AssessmentAdministration (EducationOrganizationId ASC);

ALTER TABLE sk.CalendarDateExtension ADD CONSTRAINT FK_1a442d_CalendarDate FOREIGN KEY (CalendarCode, Date, SchoolId, SchoolYear)
REFERENCES edfi.CalendarDate (CalendarCode, Date, SchoolId, SchoolYear)
ON DELETE CASCADE
;

ALTER TABLE sk.CrisisDetails ADD CONSTRAINT FK_9e9b7e_CrisisEventDescriptor FOREIGN KEY (CrisisEventDescriptorId)
REFERENCES sk.CrisisEventDescriptor (CrisisEventDescriptorId)
;

ALTER TABLE sk.CrisisDetails ADD CONSTRAINT FK_9e9b7e_CrisisTypeDescriptor FOREIGN KEY (CrisisTypeDescriptorId)
REFERENCES sk.CrisisTypeDescriptor (CrisisTypeDescriptorId)
;

CREATE INDEX FK_9e9b7e_CrisisTypeDescriptor
ON sk.CrisisDetails (CrisisTypeDescriptorId ASC);

ALTER TABLE sk.CrisisEventDescriptor ADD CONSTRAINT FK_92ffef_Descriptor FOREIGN KEY (CrisisEventDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.CrisisTypeDescriptor ADD CONSTRAINT FK_391527_Descriptor FOREIGN KEY (CrisisTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.DisciplineActionExtension ADD CONSTRAINT FK_699fda_DisciplineAction FOREIGN KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
REFERENCES edfi.DisciplineAction (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.DisciplineActionExtension ADD CONSTRAINT FK_699fda_UnilateralRemovalDescriptor FOREIGN KEY (UnilateralRemovalDescriptorId)
REFERENCES sk.UnilateralRemovalDescriptor (UnilateralRemovalDescriptorId)
;

CREATE INDEX FK_699fda_UnilateralRemovalDescriptor
ON sk.DisciplineActionExtension (UnilateralRemovalDescriptorId ASC);

ALTER TABLE sk.DisciplineIncidentExtension ADD CONSTRAINT FK_cde8b8_DisciplineIncident FOREIGN KEY (IncidentIdentifier, SchoolId)
REFERENCES edfi.DisciplineIncident (IncidentIdentifier, SchoolId)
ON DELETE CASCADE
;

ALTER TABLE sk.DualCreditDescriptor ADD CONSTRAINT FK_520a4d_Descriptor FOREIGN KEY (DualCreditDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.EarlyLearningSettingDescriptor ADD CONSTRAINT FK_1abdc8_Descriptor FOREIGN KEY (EarlyLearningSettingDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.ImmigrantIndicatorDescriptor ADD CONSTRAINT FK_17b1e7_Descriptor FOREIGN KEY (ImmigrantIndicatorDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.PlacementTypeDescriptor ADD CONSTRAINT FK_f3bd78_Descriptor FOREIGN KEY (PlacementTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.PositionTitleDescriptor ADD CONSTRAINT FK_2e1e86_Descriptor FOREIGN KEY (PositionTitleDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.PostGraduateActivity ADD CONSTRAINT FK_bc1d0a_LocalEducationAgency FOREIGN KEY (LocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_bc1d0a_LocalEducationAgency
ON sk.PostGraduateActivity (LocalEducationAgencyId ASC);

ALTER TABLE sk.PostGraduateActivity ADD CONSTRAINT FK_bc1d0a_PostGraduateActivityDescriptor FOREIGN KEY (PostGraduateActivityDescriptorId)
REFERENCES sk.PostGraduateActivityDescriptor (PostGraduateActivityDescriptorId)
;

CREATE INDEX FK_bc1d0a_PostGraduateActivityDescriptor
ON sk.PostGraduateActivity (PostGraduateActivityDescriptorId ASC);

ALTER TABLE sk.PostGraduateActivity ADD CONSTRAINT FK_bc1d0a_PostGraduateActivityDeterminationDescriptor FOREIGN KEY (PostGraduateActivityDeterminationDescriptorId)
REFERENCES sk.PostGraduateActivityDeterminationDescriptor (PostGraduateActivityDeterminationDescriptorId)
;

CREATE INDEX FK_bc1d0a_PostGraduateActivityDeterminationDescriptor
ON sk.PostGraduateActivity (PostGraduateActivityDeterminationDescriptorId ASC);

ALTER TABLE sk.PostGraduateActivity ADD CONSTRAINT FK_bc1d0a_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_bc1d0a_SchoolYearType
ON sk.PostGraduateActivity (SchoolYear ASC);

ALTER TABLE sk.PostGraduateActivity ADD CONSTRAINT FK_bc1d0a_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_bc1d0a_Student
ON sk.PostGraduateActivity (StudentUSI ASC);

ALTER TABLE sk.PostGraduateActivityDescriptor ADD CONSTRAINT FK_fb6d1c_Descriptor FOREIGN KEY (PostGraduateActivityDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.PostGraduateActivityDeterminationDescriptor ADD CONSTRAINT FK_1a442b_Descriptor FOREIGN KEY (PostGraduateActivityDeterminationDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.SectionDelivery ADD CONSTRAINT FK_e487a1_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_e487a1_Section
ON sk.SectionDelivery (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE sk.SectionDelivery ADD CONSTRAINT FK_e487a1_SectionDeliveryDescriptor FOREIGN KEY (SectionDeliveryDescriptorId)
REFERENCES sk.SectionDeliveryDescriptor (SectionDeliveryDescriptorId)
;

CREATE INDEX FK_e487a1_SectionDeliveryDescriptor
ON sk.SectionDelivery (SectionDeliveryDescriptorId ASC);

ALTER TABLE sk.SectionDeliveryDescriptor ADD CONSTRAINT FK_b4a76c_Descriptor FOREIGN KEY (SectionDeliveryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.SectionExtension ADD CONSTRAINT FK_86dfb3_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE sk.SpecialEducationProgramDescriptor ADD CONSTRAINT FK_32084c_Descriptor FOREIGN KEY (SpecialEducationProgramDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentDisciplineIncidentAssociationExtension ADD CONSTRAINT FK_e9afec_StudentDisciplineIncidentAssociation FOREIGN KEY (IncidentIdentifier, SchoolId, StudentUSI)
REFERENCES edfi.StudentDisciplineIncidentAssociation (IncidentIdentifier, SchoolId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentDisciplineIncidentAssociationWeapon ADD CONSTRAINT FK_211504_StudentDisciplineIncidentAssociation FOREIGN KEY (IncidentIdentifier, SchoolId, StudentUSI)
REFERENCES edfi.StudentDisciplineIncidentAssociation (IncidentIdentifier, SchoolId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_211504_StudentDisciplineIncidentAssociation
ON sk.StudentDisciplineIncidentAssociationWeapon (IncidentIdentifier ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE sk.StudentDisciplineIncidentAssociationWeapon ADD CONSTRAINT FK_211504_WeaponDescriptor FOREIGN KEY (WeaponDescriptorId)
REFERENCES edfi.WeaponDescriptor (WeaponDescriptorId)
;

CREATE INDEX FK_211504_WeaponDescriptor
ON sk.StudentDisciplineIncidentAssociationWeapon (WeaponDescriptorId ASC);

ALTER TABLE sk.StudentEarlyLearningProgramAssociation ADD CONSTRAINT FK_b1ff70_EarlyLearningSettingDescriptor FOREIGN KEY (EarlyLearningSettingDescriptorId)
REFERENCES sk.EarlyLearningSettingDescriptor (EarlyLearningSettingDescriptorId)
;

CREATE INDEX FK_b1ff70_EarlyLearningSettingDescriptor
ON sk.StudentEarlyLearningProgramAssociation (EarlyLearningSettingDescriptorId ASC);

ALTER TABLE sk.StudentEarlyLearningProgramAssociation ADD CONSTRAINT FK_b1ff70_GeneralStudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.GeneralStudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_ImmigrantIndicatorDescriptor FOREIGN KEY (ImmigrantIndicatorDescriptorId)
REFERENCES sk.ImmigrantIndicatorDescriptor (ImmigrantIndicatorDescriptorId)
;

CREATE INDEX FK_2c2930_ImmigrantIndicatorDescriptor
ON sk.StudentEducationOrganizationAssociationExtension (ImmigrantIndicatorDescriptorId ASC);

ALTER TABLE sk.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentEducationOrganizationAssociationStudentCrisisEvent ADD CONSTRAINT FK_469292_CrisisEventDescriptor FOREIGN KEY (CrisisEventDescriptorId)
REFERENCES sk.CrisisEventDescriptor (CrisisEventDescriptorId)
;

CREATE INDEX FK_469292_CrisisEventDescriptor
ON sk.StudentEducationOrganizationAssociationStudentCrisisEvent (CrisisEventDescriptorId ASC);

ALTER TABLE sk.StudentEducationOrganizationAssociationStudentCrisisEvent ADD CONSTRAINT FK_469292_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_469292_StudentEducationOrganizationAssociation
ON sk.StudentEducationOrganizationAssociationStudentCrisisEvent (EducationOrganizationId ASC, StudentUSI ASC);

ALTER TABLE sk.StudentLanguageInstructionProgramAssociationExtension ADD CONSTRAINT FK_438c5c_StudentLanguageInstructionProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentLanguageInstructionProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_LocalEducationAgency FOREIGN KEY (ResidentLocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_880cb1_LocalEducationAgency
ON sk.StudentSchoolAssociationExtension (ResidentLocalEducationAgencyId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_School FOREIGN KEY (ResidentSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_880cb1_School
ON sk.StudentSchoolAssociationExtension (ResidentSchoolId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_School1 FOREIGN KEY (ReportingSchoolId)
REFERENCES edfi.School (SchoolId)
;

CREATE INDEX FK_880cb1_School1
ON sk.StudentSchoolAssociationExtension (ReportingSchoolId ASC);

ALTER TABLE sk.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE sk.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_DualCreditDescriptor FOREIGN KEY (DualCreditDescriptorId)
REFERENCES sk.DualCreditDescriptor (DualCreditDescriptorId)
;

CREATE INDEX FK_a77484_DualCreditDescriptor
ON sk.StudentSectionAssociationExtension (DualCreditDescriptorId ASC);

ALTER TABLE sk.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_StudentSectionAssociation FOREIGN KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentSectionAssociation (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_PlacementTypeDescriptor FOREIGN KEY (PlacementTypeDescriptorId)
REFERENCES sk.PlacementTypeDescriptor (PlacementTypeDescriptorId)
;

CREATE INDEX FK_3da84f_PlacementTypeDescriptor
ON sk.StudentSpecialEducationProgramAssociationExtension (PlacementTypeDescriptorId ASC);

ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_SpecialEducationProgramDescriptor FOREIGN KEY (SpecialEducationProgramDescriptorId)
REFERENCES sk.SpecialEducationProgramDescriptor (SpecialEducationProgramDescriptorId)
;

CREATE INDEX FK_3da84f_SpecialEducationProgramDescriptor
ON sk.StudentSpecialEducationProgramAssociationExtension (SpecialEducationProgramDescriptorId ASC);

ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sk.UnilateralRemovalDescriptor ADD CONSTRAINT FK_32ff64_Descriptor FOREIGN KEY (UnilateralRemovalDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

