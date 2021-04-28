-- Table sk.AssessmentAdministration --
CREATE TABLE sk.AssessmentAdministration (
    AssessmentIdentifier VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    Namespace VARCHAR(255) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT AssessmentAdministration_PK PRIMARY KEY (AssessmentIdentifier, EducationOrganizationId, Namespace)
); 
ALTER TABLE sk.AssessmentAdministration ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE sk.AssessmentAdministration ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE sk.AssessmentAdministration ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table sk.CalendarDateExtension --
CREATE TABLE sk.CalendarDateExtension (
    CalendarCode VARCHAR(60) NOT NULL,
    Date DATE NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    InstructionalDuration DECIMAL(3, 2) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CalendarDateExtension_PK PRIMARY KEY (CalendarCode, Date, SchoolId, SchoolYear)
); 
ALTER TABLE sk.CalendarDateExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.CrisisDetails --
CREATE TABLE sk.CrisisDetails (
    CrisisEventDescriptorId INT NOT NULL,
    CrisisTypeDescriptorId INT NOT NULL,
    CrisisStartDate DATE NOT NULL,
    CrisisDesription VARCHAR(1024) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CrisisDetails_PK PRIMARY KEY (CrisisEventDescriptorId)
); 
ALTER TABLE sk.CrisisDetails ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE sk.CrisisDetails ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE sk.CrisisDetails ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table sk.CrisisEventDescriptor --
CREATE TABLE sk.CrisisEventDescriptor (
    CrisisEventDescriptorId INT NOT NULL,
    CONSTRAINT CrisisEventDescriptor_PK PRIMARY KEY (CrisisEventDescriptorId)
); 

-- Table sk.CrisisTypeDescriptor --
CREATE TABLE sk.CrisisTypeDescriptor (
    CrisisTypeDescriptorId INT NOT NULL,
    CONSTRAINT CrisisTypeDescriptor_PK PRIMARY KEY (CrisisTypeDescriptorId)
); 

-- Table sk.DisciplineActionExtension --
CREATE TABLE sk.DisciplineActionExtension (
    DisciplineActionIdentifier VARCHAR(20) NOT NULL,
    DisciplineDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    UnilateralRemovalDescriptorId INT NULL,
    GFSAExpulsionModifiedToLessThanOneYear BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineActionExtension_PK PRIMARY KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
); 
ALTER TABLE sk.DisciplineActionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.DisciplineIncidentExtension --
CREATE TABLE sk.DisciplineIncidentExtension (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    HomicideIndicator BOOLEAN NULL,
    ShootingIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineIncidentExtension_PK PRIMARY KEY (IncidentIdentifier, SchoolId)
); 
ALTER TABLE sk.DisciplineIncidentExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.DualCreditDescriptor --
CREATE TABLE sk.DualCreditDescriptor (
    DualCreditDescriptorId INT NOT NULL,
    CONSTRAINT DualCreditDescriptor_PK PRIMARY KEY (DualCreditDescriptorId)
); 

-- Table sk.EarlyLearningSettingDescriptor --
CREATE TABLE sk.EarlyLearningSettingDescriptor (
    EarlyLearningSettingDescriptorId INT NOT NULL,
    CONSTRAINT EarlyLearningSettingDescriptor_PK PRIMARY KEY (EarlyLearningSettingDescriptorId)
); 

-- Table sk.ImmigrantIndicatorDescriptor --
CREATE TABLE sk.ImmigrantIndicatorDescriptor (
    ImmigrantIndicatorDescriptorId INT NOT NULL,
    CONSTRAINT ImmigrantIndicatorDescriptor_PK PRIMARY KEY (ImmigrantIndicatorDescriptorId)
); 

-- Table sk.PlacementTypeDescriptor --
CREATE TABLE sk.PlacementTypeDescriptor (
    PlacementTypeDescriptorId INT NOT NULL,
    CONSTRAINT PlacementTypeDescriptor_PK PRIMARY KEY (PlacementTypeDescriptorId)
); 

-- Table sk.PositionTitleDescriptor --
CREATE TABLE sk.PositionTitleDescriptor (
    PositionTitleDescriptorId INT NOT NULL,
    CONSTRAINT PositionTitleDescriptor_PK PRIMARY KEY (PositionTitleDescriptorId)
); 

-- Table sk.PostGraduateActivity --
CREATE TABLE sk.PostGraduateActivity (
    LocalEducationAgencyId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    PostGraduateActivityDescriptorId INT NOT NULL,
    PostGraduateActivityDeterminationDescriptorId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PostGraduateActivity_PK PRIMARY KEY (LocalEducationAgencyId, SchoolYear, StudentUSI)
); 
ALTER TABLE sk.PostGraduateActivity ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE sk.PostGraduateActivity ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE sk.PostGraduateActivity ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table sk.PostGraduateActivityDescriptor --
CREATE TABLE sk.PostGraduateActivityDescriptor (
    PostGraduateActivityDescriptorId INT NOT NULL,
    CONSTRAINT PostGraduateActivityDescriptor_PK PRIMARY KEY (PostGraduateActivityDescriptorId)
); 

-- Table sk.PostGraduateActivityDeterminationDescriptor --
CREATE TABLE sk.PostGraduateActivityDeterminationDescriptor (
    PostGraduateActivityDeterminationDescriptorId INT NOT NULL,
    CONSTRAINT PostGraduateActivityDeterminationDescriptor_PK PRIMARY KEY (PostGraduateActivityDeterminationDescriptorId)
); 

-- Table sk.SectionDelivery --
CREATE TABLE sk.SectionDelivery (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionDeliveryDescriptorId INT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionDelivery_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionDeliveryDescriptorId, SectionIdentifier, SessionName)
); 
ALTER TABLE sk.SectionDelivery ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.SectionDeliveryDescriptor --
CREATE TABLE sk.SectionDeliveryDescriptor (
    SectionDeliveryDescriptorId INT NOT NULL,
    CONSTRAINT SectionDeliveryDescriptor_PK PRIMARY KEY (SectionDeliveryDescriptorId)
); 

-- Table sk.SectionExtension --
CREATE TABLE sk.SectionExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CourseStaffIdOverride VARCHAR(10) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE sk.SectionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.SpecialEducationProgramDescriptor --
CREATE TABLE sk.SpecialEducationProgramDescriptor (
    SpecialEducationProgramDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationProgramDescriptor_PK PRIMARY KEY (SpecialEducationProgramDescriptorId)
); 

-- Table sk.StudentDisciplineIncidentAssociationExtension --
CREATE TABLE sk.StudentDisciplineIncidentAssociationExtension (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    GunFreeSchoolViolation BOOLEAN NULL,
    SchoolRelatedArrestIndicator BOOLEAN NULL,
    ReferralToLawEnforcement BOOLEAN NULL,
    SeriousBodilyInjury BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentDisciplineIncidentAssociationExtension_PK PRIMARY KEY (IncidentIdentifier, SchoolId, StudentUSI)
); 
ALTER TABLE sk.StudentDisciplineIncidentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentDisciplineIncidentAssociationWeapon --
CREATE TABLE sk.StudentDisciplineIncidentAssociationWeapon (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    WeaponDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentDisciplineIncidentAssociationWeapon_PK PRIMARY KEY (IncidentIdentifier, SchoolId, StudentUSI, WeaponDescriptorId)
); 
ALTER TABLE sk.StudentDisciplineIncidentAssociationWeapon ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentEarlyLearningProgramAssociation --
CREATE TABLE sk.StudentEarlyLearningProgramAssociation (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    EarlyLearningSettingDescriptorId INT NULL,
    CONSTRAINT StudentEarlyLearningProgramAssociation_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 

-- Table sk.StudentEducationOrganizationAssociationExtension --
CREATE TABLE sk.StudentEducationOrganizationAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ImmigrantIndicatorDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
); 
ALTER TABLE sk.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentEducationOrganizationAssociationStudentCrisisEvent --
CREATE TABLE sk.StudentEducationOrganizationAssociationStudentCrisisEvent (
    CrisisEventDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    DisplacedStudentIndicator BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationStudentCrisisEvent_PK PRIMARY KEY (CrisisEventDescriptorId, EducationOrganizationId, StudentUSI)
); 
ALTER TABLE sk.StudentEducationOrganizationAssociationStudentCrisisEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

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
    StudentDaysEnrolled DECIMAL(5, 2) NULL,
    ResidentLocalEducationAgencyId INT NOT NULL,
    ResidentSchoolId INT NULL,
    ReportingSchoolId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationExtension_PK PRIMARY KEY (EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE sk.StudentSchoolAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentSectionAssociationExtension --
CREATE TABLE sk.StudentSectionAssociationExtension (
    BeginDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    DualCreditDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSectionAssociationExtension_PK PRIMARY KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
); 
ALTER TABLE sk.StudentSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE sk.StudentSpecialEducationProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    SpecialEducationProgramDescriptorId INT NULL,
    PlacementTypeDescriptorId INT NULL,
    ToTakeAlternateAssessment BOOLEAN NULL,
    InitialSpecialEducationEntryDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE sk.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table sk.UnilateralRemovalDescriptor --
CREATE TABLE sk.UnilateralRemovalDescriptor (
    UnilateralRemovalDescriptorId INT NOT NULL,
    CONSTRAINT UnilateralRemovalDescriptor_PK PRIMARY KEY (UnilateralRemovalDescriptorId)
); 

