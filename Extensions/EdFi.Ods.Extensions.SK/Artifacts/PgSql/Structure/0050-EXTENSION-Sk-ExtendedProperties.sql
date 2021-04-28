-- Extended Properties [sk].[SpecialEducationProgramDescriptor] --
COMMENT ON TABLE sk.SpecialEducationProgramDescriptor IS 'Type of program a Special Education student is in - Part B or Part C.';
COMMENT ON COLUMN sk.SpecialEducationProgramDescriptor.SpecialEducationProgramDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

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

-- Extended Properties [sk].[StudentSpecialEducationProgramAssociationExtension] --
COMMENT ON TABLE sk.StudentSpecialEducationProgramAssociationExtension IS '';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN sk.StudentSpecialEducationProgramAssociationExtension.ToTakeAlternateAssessment IS 'True = Indicates the student needs alternate assessment.';

