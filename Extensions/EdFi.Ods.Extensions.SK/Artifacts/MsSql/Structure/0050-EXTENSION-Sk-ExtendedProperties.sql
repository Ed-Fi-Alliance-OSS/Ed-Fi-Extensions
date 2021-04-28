-- Extended Properties [sk].[AssessmentAdministration] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assessment administration used for rostering from the EdFi ODS.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'AssessmentAdministration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'AssessmentAdministration', @level2type=N'COLUMN', @level2name=N'Namespace'
GO

-- Extended Properties [sk].[CrisisDetails] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the specific crisis that occurred.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that occurred', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of crisis event that occurred', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First date that the crisis occurred', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the event', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisDesription'
GO

-- Extended Properties [sk].[CrisisEventDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that occurred.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisEventDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisEventDescriptor', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO

-- Extended Properties [sk].[CrisisTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of crisis event that occurred.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'CrisisTypeDescriptor', @level2type=N'COLUMN', @level2name=N'CrisisTypeDescriptorId'
GO

-- Extended Properties [sk].[DisciplineActionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier assigned by the education organization to the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the DisciplineAction.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'DisciplineDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For SPED students only who were were subject to Uniliteral Removal', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'UnilateralRemovalDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True = Student expelled under GFSA had expulsion modified to less than one year.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineActionExtension', @level2type=N'COLUMN', @level2name=N'GFSAExpulsionModifiedToLessThanOneYear'
GO

-- Extended Properties [sk].[DisciplineIncidentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if this discipline incident involved homicide.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'HomicideIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the discipline incident involved a shooting.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'ShootingIndicator'
GO

-- Extended Properties [sk].[DualCreditDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To indicate if student earned both high school and postsecondary credit for this course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DualCreditDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'DualCreditDescriptor', @level2type=N'COLUMN', @level2name=N'DualCreditDescriptorId'
GO

-- Extended Properties [sk].[EarlyLearningSettingDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To indicate the classroom setting of the student''s program participation.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'EarlyLearningSettingDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'EarlyLearningSettingDescriptor', @level2type=N'COLUMN', @level2name=N'EarlyLearningSettingDescriptorId'
GO

-- Extended Properties [sk].[ImmigrantIndicatorDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description that best reflects the student''s immigrant status.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'ImmigrantIndicatorDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'ImmigrantIndicatorDescriptor', @level2type=N'COLUMN', @level2name=N'ImmigrantIndicatorDescriptorId'
GO

-- Extended Properties [sk].[PlacementTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates placement type of the student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PlacementTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PlacementTypeDescriptor', @level2type=N'COLUMN', @level2name=N'PlacementTypeDescriptorId'
GO

-- Extended Properties [sk].[PositionTitleDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the default position titles for the dashboard claimset mapping.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PositionTitleDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PositionTitleDescriptor', @level2type=N'COLUMN', @level2name=N'PositionTitleDescriptorId'
GO

-- Extended Properties [sk].[PostGraduateActivity] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NDE new Domain for capturing the CTE post graduation activity details. The Post School Survey template is provided for all 12th grade Career Education Concentrators identified as a [School-Year] completer with diploma and is submitted ONE-YEAR AFTER high school graduation.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Represents the school year during which the student graduated.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Appropriate code to describe the student''s activity after completion.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity', @level2type=N'COLUMN', @level2name=N'PostGraduateActivityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Appropriate code to describe the student''s activity after completion.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivity', @level2type=N'COLUMN', @level2name=N'PostGraduateActivityDeterminationDescriptorId'
GO

-- Extended Properties [sk].[PostGraduateActivityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the student�s activity after completion.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivityDescriptor', @level2type=N'COLUMN', @level2name=N'PostGraduateActivityDescriptorId'
GO

-- Extended Properties [sk].[PostGraduateActivityDeterminationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the method of determining the Post Graduate Activity Code value for the student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivityDeterminationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'PostGraduateActivityDeterminationDescriptor', @level2type=N'COLUMN', @level2name=N'PostGraduateActivityDeterminationDescriptorId'
GO

-- Extended Properties [sk].[SectionDelivery] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the delivery method for a section of a course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the delivery method for a section of a course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'SectionDeliveryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDelivery', @level2type=N'COLUMN', @level2name=N'SessionName'
GO

-- Extended Properties [sk].[SectionDeliveryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the delivery method for a section of a course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDeliveryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionDeliveryDescriptor', @level2type=N'COLUMN', @level2name=N'SectionDeliveryDescriptorId'
GO

-- Extended Properties [sk].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff Id of non district employee correspoinding to the teacher of the course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'CourseStaffIdOverride'
GO

-- Extended Properties [sk].[SpecialEducationProgramDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of program a Special Education student is in - Part B or Part C.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SpecialEducationProgramDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'SpecialEducationProgramDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationProgramDescriptorId'
GO

-- Extended Properties [sk].[StudentDisciplineIncidentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True = Student was charged with a Gun-Free Schools Violation.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'GunFreeSchoolViolation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student was involved in a disciplinary incident that resulted in an arrest.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolRelatedArrestIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if a student was referred to law enforcement.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'ReferralToLawEnforcement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if an incident resulted in serious bodily injury as defined by 18 U.S.C. Section 1365(3)(h).', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationExtension', @level2type=N'COLUMN', @level2name=N'SeriousBodilyInjury'
GO

-- Extended Properties [sk].[StudentDisciplineIncidentAssociationWeapon] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the type of weapon used during an incident.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationWeapon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationWeapon', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationWeapon', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationWeapon', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the type of weapon used during an incident.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentDisciplineIncidentAssociationWeapon', @level2type=N'COLUMN', @level2name=N'WeaponDescriptorId'
GO

-- Extended Properties [sk].[StudentEarlyLearningProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NDE specific StudentEarlyLearningProgramAssociation.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the classroom setting of the student''s program participation.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEarlyLearningProgramAssociation', @level2type=N'COLUMN', @level2name=N'EarlyLearningSettingDescriptorId'
GO

-- Extended Properties [sk].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description that best reflects the student''s immigrant status.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'ImmigrantIndicatorDescriptorId'
GO

-- Extended Properties [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information on the crisis that has affected a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that affected the student', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the student was displaced from their home due to the crisis. The student may or may not be considered homeless due to the displacement.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'DisplacedStudentIndicator'
GO

-- Extended Properties [sk].[StudentLanguageInstructionProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'students that have been redesignated as English Fluent.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'RedesignatedEnglishFluent'
GO

-- Extended Properties [sk].[StudentSchoolAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Override field to determine number of days the student was in membership for ADA and ADM calculation.  This field is optional, and records without a value will use the related calendar to determine days enrolled.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentDaysEnrolled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ResidentLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ResidentSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ReportingSchoolId'
GO

-- Extended Properties [sk].[StudentSectionAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To indicate if student earned both high school and postsecondary credit for this course.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'DualCreditDescriptorId'
GO

-- Extended Properties [sk].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of program a Special Education student is in - Part B or Part C.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationProgramDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Placement type of the student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PlacementTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True = Indicates the student needs alternate assessment.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ToTakeAlternateAssessment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date when the child''s first IEP or IFSP', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'InitialSpecialEducationEntryDate'
GO

-- Extended Properties [sk].[UnilateralRemovalDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the unilateral removal type for a special education student.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'UnilateralRemovalDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'sk', @level1type=N'TABLE', @level1name=N'UnilateralRemovalDescriptor', @level2type=N'COLUMN', @level2name=N'UnilateralRemovalDescriptorId'
GO

