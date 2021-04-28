-- Extended Properties [sk].[AssessmentAdministration] --
COMMENT ON TABLE sk.AssessmentAdministration IS 'Assessment administration used for rostering from the EdFi ODS.';
COMMENT ON COLUMN sk.AssessmentAdministration.AssessmentIdentifier IS 'A unique number or alphanumeric code assigned to an assessment.';
COMMENT ON COLUMN sk.AssessmentAdministration.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.AssessmentAdministration.Namespace IS 'Namespace for the Assessment.';

-- Extended Properties [sk].[CrisisDetails] --
COMMENT ON TABLE sk.CrisisDetails IS 'Information about the specific crisis that occurred.';
COMMENT ON COLUMN sk.CrisisDetails.CrisisEventDescriptorId IS 'The specific event that occurred';
COMMENT ON COLUMN sk.CrisisDetails.CrisisTypeDescriptorId IS 'The type of crisis event that occurred';
COMMENT ON COLUMN sk.CrisisDetails.CrisisStartDate IS 'First date that the crisis occurred';
COMMENT ON COLUMN sk.CrisisDetails.CrisisDesription IS 'Description of the event';

-- Extended Properties [sk].[CrisisEventDescriptor] --
COMMENT ON TABLE sk.CrisisEventDescriptor IS 'The specific event that occurred.';
COMMENT ON COLUMN sk.CrisisEventDescriptor.CrisisEventDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[CrisisTypeDescriptor] --
COMMENT ON TABLE sk.CrisisTypeDescriptor IS 'The type of crisis event that occurred.';
COMMENT ON COLUMN sk.CrisisTypeDescriptor.CrisisTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[DisciplineActionExtension] --
COMMENT ON TABLE sk.DisciplineActionExtension IS '';
COMMENT ON COLUMN sk.DisciplineActionExtension.DisciplineActionIdentifier IS 'Identifier assigned by the education organization to the DisciplineAction.';
COMMENT ON COLUMN sk.DisciplineActionExtension.DisciplineDate IS 'The date of the DisciplineAction.';
COMMENT ON COLUMN sk.DisciplineActionExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.DisciplineActionExtension.UnilateralRemovalDescriptorId IS 'For SPED students only who were were subject to Uniliteral Removal';
COMMENT ON COLUMN sk.DisciplineActionExtension.GFSAExpulsionModifiedToLessThanOneYear IS 'True = Student expelled under GFSA had expulsion modified to less than one year.';

-- Extended Properties [sk].[DisciplineIncidentExtension] --
COMMENT ON TABLE sk.DisciplineIncidentExtension IS '';
COMMENT ON COLUMN sk.DisciplineIncidentExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN sk.DisciplineIncidentExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.DisciplineIncidentExtension.HomicideIndicator IS 'Indicates if this discipline incident involved homicide.';
COMMENT ON COLUMN sk.DisciplineIncidentExtension.ShootingIndicator IS 'Indicates if the discipline incident involved a shooting.';

-- Extended Properties [sk].[DualCreditDescriptor] --
COMMENT ON TABLE sk.DualCreditDescriptor IS 'To indicate if student earned both high school and postsecondary credit for this course.';
COMMENT ON COLUMN sk.DualCreditDescriptor.DualCreditDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[EarlyLearningSettingDescriptor] --
COMMENT ON TABLE sk.EarlyLearningSettingDescriptor IS 'To indicate the classroom setting of the student''s program participation.';
COMMENT ON COLUMN sk.EarlyLearningSettingDescriptor.EarlyLearningSettingDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[ImmigrantIndicatorDescriptor] --
COMMENT ON TABLE sk.ImmigrantIndicatorDescriptor IS 'Description that best reflects the student''s immigrant status.';
COMMENT ON COLUMN sk.ImmigrantIndicatorDescriptor.ImmigrantIndicatorDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[PlacementTypeDescriptor] --
COMMENT ON TABLE sk.PlacementTypeDescriptor IS 'Indicates placement type of the student.';
COMMENT ON COLUMN sk.PlacementTypeDescriptor.PlacementTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[PositionTitleDescriptor] --
COMMENT ON TABLE sk.PositionTitleDescriptor IS 'Description of the default position titles for the dashboard claimset mapping.';
COMMENT ON COLUMN sk.PositionTitleDescriptor.PositionTitleDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[PostGraduateActivity] --
COMMENT ON TABLE sk.PostGraduateActivity IS 'NDE new Domain for capturing the CTE post graduation activity details. The Post School Survey template is provided for all 12th grade Career Education Concentrators identified as a [School-Year] completer with diploma and is submitted ONE-YEAR AFTER high school graduation.';
COMMENT ON COLUMN sk.PostGraduateActivity.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN sk.PostGraduateActivity.SchoolYear IS 'Represents the school year during which the student graduated.';
COMMENT ON COLUMN sk.PostGraduateActivity.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.PostGraduateActivity.PostGraduateActivityDescriptorId IS 'Appropriate code to describe the student''s activity after completion.';
COMMENT ON COLUMN sk.PostGraduateActivity.PostGraduateActivityDeterminationDescriptorId IS 'Appropriate code to describe the student''s activity after completion.';

-- Extended Properties [sk].[PostGraduateActivityDescriptor] --
COMMENT ON TABLE sk.PostGraduateActivityDescriptor IS 'Description of the student�s activity after completion.';
COMMENT ON COLUMN sk.PostGraduateActivityDescriptor.PostGraduateActivityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[PostGraduateActivityDeterminationDescriptor] --
COMMENT ON TABLE sk.PostGraduateActivityDeterminationDescriptor IS 'Description of the method of determining the Post Graduate Activity Code value for the student.';
COMMENT ON COLUMN sk.PostGraduateActivityDeterminationDescriptor.PostGraduateActivityDeterminationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[SectionDelivery] --
COMMENT ON TABLE sk.SectionDelivery IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN sk.SectionDelivery.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN sk.SectionDelivery.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.SectionDelivery.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN sk.SectionDelivery.SectionDeliveryDescriptorId IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN sk.SectionDelivery.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN sk.SectionDelivery.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';

-- Extended Properties [sk].[SectionDeliveryDescriptor] --
COMMENT ON TABLE sk.SectionDeliveryDescriptor IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN sk.SectionDeliveryDescriptor.SectionDeliveryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[SectionExtension] --
COMMENT ON TABLE sk.SectionExtension IS '';
COMMENT ON COLUMN sk.SectionExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN sk.SectionExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.SectionExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN sk.SectionExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN sk.SectionExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN sk.SectionExtension.CourseStaffIdOverride IS 'Staff Id of non district employee correspoinding to the teacher of the course.';

-- Extended Properties [sk].[SpecialEducationProgramDescriptor] --
COMMENT ON TABLE sk.SpecialEducationProgramDescriptor IS 'Type of program a Special Education student is in - Part B or Part C.';
COMMENT ON COLUMN sk.SpecialEducationProgramDescriptor.SpecialEducationProgramDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [sk].[StudentDisciplineIncidentAssociationExtension] --
COMMENT ON TABLE sk.StudentDisciplineIncidentAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.GunFreeSchoolViolation IS 'True = Student was charged with a Gun-Free Schools Violation.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.SchoolRelatedArrestIndicator IS 'Indicates if student was involved in a disciplinary incident that resulted in an arrest.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.ReferralToLawEnforcement IS 'Indicates if a student was referred to law enforcement.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationExtension.SeriousBodilyInjury IS 'Indicates if an incident resulted in serious bodily injury as defined by 18 U.S.C. Section 1365(3)(h).';

-- Extended Properties [sk].[StudentDisciplineIncidentAssociationWeapon] --
COMMENT ON TABLE sk.StudentDisciplineIncidentAssociationWeapon IS 'Identifies the type of weapon used during an incident.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationWeapon.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationWeapon.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationWeapon.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentDisciplineIncidentAssociationWeapon.WeaponDescriptorId IS 'Identifies the type of weapon used during an incident.';

-- Extended Properties [sk].[StudentEarlyLearningProgramAssociation] --
COMMENT ON TABLE sk.StudentEarlyLearningProgramAssociation IS 'NDE specific StudentEarlyLearningProgramAssociation.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentEarlyLearningProgramAssociation.EarlyLearningSettingDescriptorId IS 'Indicates the classroom setting of the student''s program participation.';

-- Extended Properties [sk].[StudentEducationOrganizationAssociationExtension] --
COMMENT ON TABLE sk.StudentEducationOrganizationAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationExtension.ImmigrantIndicatorDescriptorId IS 'Description that best reflects the student''s immigrant status.';

-- Extended Properties [sk].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
COMMENT ON TABLE sk.StudentEducationOrganizationAssociationStudentCrisisEvent IS 'Information on the crisis that has affected a student.';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationStudentCrisisEvent.CrisisEventDescriptorId IS 'The specific event that affected the student';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationStudentCrisisEvent.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationStudentCrisisEvent.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentEducationOrganizationAssociationStudentCrisisEvent.DisplacedStudentIndicator IS 'An indication that the student was displaced from their home due to the crisis. The student may or may not be considered homeless due to the displacement.';

-- Extended Properties [sk].[StudentLanguageInstructionProgramAssociationExtension] --
COMMENT ON TABLE sk.StudentLanguageInstructionProgramAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentLanguageInstructionProgramAssociationExtension.RedesignatedEnglishFluent IS 'students that have been redesignated as English Fluent.';

-- Extended Properties [sk].[StudentSchoolAssociationExtension] --
COMMENT ON TABLE sk.StudentSchoolAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.StudentDaysEnrolled IS 'Override field to determine number of days the student was in membership for ADA and ADM calculation.  This field is optional, and records without a value will use the related calendar to determine days enrolled.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.ResidentLocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.ResidentSchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.StudentSchoolAssociationExtension.ReportingSchoolId IS 'The identifier assigned to a school.';

-- Extended Properties [sk].[StudentSectionAssociationExtension] --
COMMENT ON TABLE sk.StudentSectionAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.BeginDate IS 'Month, day, and year of the Student''s entry or assignment to the Section.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentSectionAssociationExtension.DualCreditDescriptorId IS 'To indicate if student earned both high school and postsecondary credit for this course.';

-- Extended Properties [sk].[StudentSpecialEducationProgramAssociationExtension] --
COMMENT ON TABLE sk.StudentSpecialEducationProgramAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.SpecialEducationProgramDescriptorId IS 'Type of program a Special Education student is in - Part B or Part C.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.PlacementTypeDescriptorId IS 'Placement type of the student.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ToTakeAlternateAssessment IS 'True = Indicates the student needs alternate assessment.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.InitialSpecialEducationEntryDate IS 'Date when the child''s first IEP or IFSP';

-- Extended Properties [sk].[UnilateralRemovalDescriptor] --
COMMENT ON TABLE sk.UnilateralRemovalDescriptor IS 'Description of the unilateral removal type for a special education student.';
COMMENT ON COLUMN sk.UnilateralRemovalDescriptor.UnilateralRemovalDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

