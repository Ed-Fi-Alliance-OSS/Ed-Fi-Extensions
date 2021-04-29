-- Table sk.SpecialEducationProgramDescriptor --
CREATE TABLE sk.SpecialEducationProgramDescriptor (
    SpecialEducationProgramDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationProgramDescriptor_PK PRIMARY KEY (SpecialEducationProgramDescriptorId)
); 

-- Table sk.StudentLanguageInstructionProgramAssociationExtension --
CREATE TABLE sk.StudentLanguageInstructionProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    RedesignatedEnglishFluent BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentLanguageInstructionProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE sk.StudentLanguageInstructionProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentSchoolAssociationExtension --
CREATE TABLE sk.StudentSchoolAssociationExtension (
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ResidentLocalEducationAgencyId INT NOT NULL,
    ResidentSchoolId INT NULL,
    ReportingSchoolId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationExtension_PK PRIMARY KEY (EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE sk.StudentSchoolAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE sk.StudentSpecialEducationProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ToTakeAlternateAssessment BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

