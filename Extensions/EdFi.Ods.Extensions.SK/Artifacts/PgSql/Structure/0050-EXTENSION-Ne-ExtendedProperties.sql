-- Extended Properties [ne].[AssessmentAdministration] --
COMMENT ON TABLE ne.AssessmentAdministration IS 'Assessment administration used for rostering from the EdFi ODS.';
COMMENT ON COLUMN ne.AssessmentAdministration.AssessmentIdentifier IS 'A unique number or alphanumeric code assigned to an assessment.';
COMMENT ON COLUMN ne.AssessmentAdministration.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.AssessmentAdministration.Namespace IS 'Namespace for the Assessment.';

-- Extended Properties [ne].[CalendarDateExtension] --
COMMENT ON TABLE ne.CalendarDateExtension IS '';
COMMENT ON COLUMN ne.CalendarDateExtension.CalendarCode IS 'The identifier for the Calendar.';
COMMENT ON COLUMN ne.CalendarDateExtension.Date IS 'The month, day, and year of the CalendarEvent.';
COMMENT ON COLUMN ne.CalendarDateExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.CalendarDateExtension.SchoolYear IS 'The identifier for the school year associated with the Calendar.';
COMMENT ON COLUMN ne.CalendarDateExtension.InstructionalDuration IS 'The portion of the day that instruction occurred.';

-- Extended Properties [ne].[CrisisDetails] --
COMMENT ON TABLE ne.CrisisDetails IS 'Information about the specific crisis that occurred.';
COMMENT ON COLUMN ne.CrisisDetails.CrisisEventDescriptorId IS 'The specific event that occurred';
COMMENT ON COLUMN ne.CrisisDetails.CrisisTypeDescriptorId IS 'The type of crisis event that occurred';
COMMENT ON COLUMN ne.CrisisDetails.CrisisStartDate IS 'First date that the crisis occurred';
COMMENT ON COLUMN ne.CrisisDetails.CrisisDesription IS 'Description of the event';

-- Extended Properties [ne].[CrisisEventDescriptor] --
COMMENT ON TABLE ne.CrisisEventDescriptor IS 'The specific event that occurred.';
COMMENT ON COLUMN ne.CrisisEventDescriptor.CrisisEventDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[CrisisTypeDescriptor] --
COMMENT ON TABLE ne.CrisisTypeDescriptor IS 'The type of crisis event that occurred.';
COMMENT ON COLUMN ne.CrisisTypeDescriptor.CrisisTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[DisciplineActionExtension] --
COMMENT ON TABLE ne.DisciplineActionExtension IS '';
COMMENT ON COLUMN ne.DisciplineActionExtension.DisciplineActionIdentifier IS 'Identifier assigned by the education organization to the DisciplineAction.';
COMMENT ON COLUMN ne.DisciplineActionExtension.DisciplineDate IS 'The date of the DisciplineAction.';
COMMENT ON COLUMN ne.DisciplineActionExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.DisciplineActionExtension.UnilateralRemovalDescriptorId IS 'For SPED students only who were were subject to Uniliteral Removal';
COMMENT ON COLUMN ne.DisciplineActionExtension.GFSAExpulsionModifiedToLessThanOneYear IS 'True = Student expelled under GFSA had expulsion modified to less than one year.';

-- Extended Properties [ne].[DisciplineIncidentExtension] --
COMMENT ON TABLE ne.DisciplineIncidentExtension IS '';
COMMENT ON COLUMN ne.DisciplineIncidentExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN ne.DisciplineIncidentExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.DisciplineIncidentExtension.HomicideIndicator IS 'Indicates if this discipline incident involved homicide.';
COMMENT ON COLUMN ne.DisciplineIncidentExtension.ShootingIndicator IS 'Indicates if the discipline incident involved a shooting.';

-- Extended Properties [ne].[DualCreditDescriptor] --
COMMENT ON TABLE ne.DualCreditDescriptor IS 'To indicate if student earned both high school and postsecondary credit for this course.';
COMMENT ON COLUMN ne.DualCreditDescriptor.DualCreditDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[EarlyLearningSettingDescriptor] --
COMMENT ON TABLE ne.EarlyLearningSettingDescriptor IS 'To indicate the classroom setting of the student''s program participation.';
COMMENT ON COLUMN ne.EarlyLearningSettingDescriptor.EarlyLearningSettingDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[ImmigrantIndicatorDescriptor] --
COMMENT ON TABLE ne.ImmigrantIndicatorDescriptor IS 'Description that best reflects the student''s immigrant status.';
COMMENT ON COLUMN ne.ImmigrantIndicatorDescriptor.ImmigrantIndicatorDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[PlacementTypeDescriptor] --
COMMENT ON TABLE ne.PlacementTypeDescriptor IS 'Indicates placement type of the student.';
COMMENT ON COLUMN ne.PlacementTypeDescriptor.PlacementTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[PositionTitleDescriptor] --
COMMENT ON TABLE ne.PositionTitleDescriptor IS 'Description of the default position titles for the dashboard claimset mapping.';
COMMENT ON COLUMN ne.PositionTitleDescriptor.PositionTitleDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[PostGraduateActivity] --
COMMENT ON TABLE ne.PostGraduateActivity IS 'NDE new Domain for capturing the CTE post graduation activity details. The Post School Survey template is provided for all 12th grade Career Education Concentrators identified as a [School-Year] completer with diploma and is submitted ONE-YEAR AFTER high school graduation.';
COMMENT ON COLUMN ne.PostGraduateActivity.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN ne.PostGraduateActivity.SchoolYear IS 'Represents the school year during which the student graduated.';
COMMENT ON COLUMN ne.PostGraduateActivity.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.PostGraduateActivity.PostGraduateActivityDescriptorId IS 'Appropriate code to describe the student''s activity after completion.';
COMMENT ON COLUMN ne.PostGraduateActivity.PostGraduateActivityDeterminationDescriptorId IS 'Appropriate code to describe the student''s activity after completion.';

-- Extended Properties [ne].[PostGraduateActivityDescriptor] --
COMMENT ON TABLE ne.PostGraduateActivityDescriptor IS 'Description of the student�s activity after completion.';
COMMENT ON COLUMN ne.PostGraduateActivityDescriptor.PostGraduateActivityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[PostGraduateActivityDeterminationDescriptor] --
COMMENT ON TABLE ne.PostGraduateActivityDeterminationDescriptor IS 'Description of the method of determining the Post Graduate Activity Code value for the student.';
COMMENT ON COLUMN ne.PostGraduateActivityDeterminationDescriptor.PostGraduateActivityDeterminationDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[SectionDelivery] --
COMMENT ON TABLE ne.SectionDelivery IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN ne.SectionDelivery.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN ne.SectionDelivery.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.SectionDelivery.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN ne.SectionDelivery.SectionDeliveryDescriptorId IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN ne.SectionDelivery.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN ne.SectionDelivery.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';

-- Extended Properties [ne].[SectionDeliveryDescriptor] --
COMMENT ON TABLE ne.SectionDeliveryDescriptor IS 'Description of the delivery method for a section of a course.';
COMMENT ON COLUMN ne.SectionDeliveryDescriptor.SectionDeliveryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[SectionExtension] --
COMMENT ON TABLE ne.SectionExtension IS '';
COMMENT ON COLUMN ne.SectionExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN ne.SectionExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.SectionExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN ne.SectionExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN ne.SectionExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN ne.SectionExtension.CourseStaffIdOverride IS 'Staff Id of non district employee correspoinding to the teacher of the course.';

-- Extended Properties [ne].[SpecialEducationProgramDescriptor] --
COMMENT ON TABLE ne.SpecialEducationProgramDescriptor IS 'Type of program a Special Education student is in - Part B or Part C.';
COMMENT ON COLUMN ne.SpecialEducationProgramDescriptor.SpecialEducationProgramDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [ne].[StudentDisciplineIncidentAssociationExtension] --
COMMENT ON TABLE ne.StudentDisciplineIncidentAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.GunFreeSchoolViolation IS 'True = Student was charged with a Gun-Free Schools Violation.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.SchoolRelatedArrestIndicator IS 'Indicates if student was involved in a disciplinary incident that resulted in an arrest.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.ReferralToLawEnforcement IS 'Indicates if a student was referred to law enforcement.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationExtension.SeriousBodilyInjury IS 'Indicates if an incident resulted in serious bodily injury as defined by 18 U.S.C. Section 1365(3)(h).';

-- Extended Properties [ne].[StudentDisciplineIncidentAssociationWeapon] --
COMMENT ON TABLE ne.StudentDisciplineIncidentAssociationWeapon IS 'Identifies the type of weapon used during an incident.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationWeapon.IncidentIdentifier IS 'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationWeapon.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationWeapon.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentDisciplineIncidentAssociationWeapon.WeaponDescriptorId IS 'Identifies the type of weapon used during an incident.';

-- Extended Properties [ne].[StudentEarlyLearningProgramAssociation] --
COMMENT ON TABLE ne.StudentEarlyLearningProgramAssociation IS 'NDE specific StudentEarlyLearningProgramAssociation.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentEarlyLearningProgramAssociation.EarlyLearningSettingDescriptorId IS 'Indicates the classroom setting of the student''s program participation.';

-- Extended Properties [ne].[StudentEducationOrganizationAssociationExtension] --
COMMENT ON TABLE ne.StudentEducationOrganizationAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationExtension.ImmigrantIndicatorDescriptorId IS 'Description that best reflects the student''s immigrant status.';

-- Extended Properties [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
COMMENT ON TABLE ne.StudentEducationOrganizationAssociationStudentCrisisEvent IS 'Information on the crisis that has affected a student.';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationStudentCrisisEvent.CrisisEventDescriptorId IS 'The specific event that affected the student';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationStudentCrisisEvent.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationStudentCrisisEvent.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentEducationOrganizationAssociationStudentCrisisEvent.DisplacedStudentIndicator IS 'An indication that the student was displaced from their home due to the crisis. The student may or may not be considered homeless due to the displacement.';

-- Extended Properties [ne].[StudentLanguageInstructionProgramAssociationExtension] --
COMMENT ON TABLE ne.StudentLanguageInstructionProgramAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentLanguageInstructionProgramAssociationExtension.RedesignatedEnglishFluent IS 'students that have been redesignated as English Fluent.';

-- Extended Properties [ne].[StudentSchoolAssociationExtension] --
COMMENT ON TABLE ne.StudentSchoolAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.StudentDaysEnrolled IS 'Override field to determine number of days the student was in membership for ADA and ADM calculation.  This field is optional, and records without a value will use the related calendar to determine days enrolled.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.ResidentLocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.ResidentSchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.StudentSchoolAssociationExtension.ReportingSchoolId IS 'The identifier assigned to a school.';

-- Extended Properties [ne].[StudentSectionAssociationExtension] --
COMMENT ON TABLE ne.StudentSectionAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.BeginDate IS 'Month, day, and year of the Student''s entry or assignment to the Section.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentSectionAssociationExtension.DualCreditDescriptorId IS 'To indicate if student earned both high school and postsecondary credit for this course.';

-- Extended Properties [ne].[StudentSpecialEducationProgramAssociationExtension] --
COMMENT ON TABLE ne.StudentSpecialEducationProgramAssociationExtension IS '';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.SpecialEducationProgramDescriptorId IS 'Type of program a Special Education student is in - Part B or Part C.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.PlacementTypeDescriptorId IS 'Placement type of the student.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.ToTakeAlternateAssessment IS 'True = Indicates the student needs alternate assessment.';
COMMENT ON COLUMN ne.StudentSpecialEducationProgramAssociationExtension.InitialSpecialEducationEntryDate IS 'Date when the child''s first IEP or IFSP';

-- Extended Properties [ne].[UnilateralRemovalDescriptor] --
COMMENT ON TABLE ne.UnilateralRemovalDescriptor IS 'Description of the unilateral removal type for a special education student.';
COMMENT ON COLUMN ne.UnilateralRemovalDescriptor.UnilateralRemovalDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

