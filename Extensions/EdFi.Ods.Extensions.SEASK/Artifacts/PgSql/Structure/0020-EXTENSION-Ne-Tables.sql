-- Table ne.CalendarDateExtension --
CREATE TABLE ne.CalendarDateExtension (
    CalendarCode VARCHAR(60) NOT NULL,
    Date DATE NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    InstructionalDuration DECIMAL(3, 2) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CalendarDateExtension_PK PRIMARY KEY (CalendarCode, Date, SchoolId, SchoolYear)
); 
ALTER TABLE ne.CalendarDateExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.CrisisDetails --
CREATE TABLE ne.CrisisDetails (
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
ALTER TABLE ne.CrisisDetails ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE ne.CrisisDetails ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE ne.CrisisDetails ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table ne.CrisisEventDescriptor --
CREATE TABLE ne.CrisisEventDescriptor (
    CrisisEventDescriptorId INT NOT NULL,
    CONSTRAINT CrisisEventDescriptor_PK PRIMARY KEY (CrisisEventDescriptorId)
); 

-- Table ne.CrisisTypeDescriptor --
CREATE TABLE ne.CrisisTypeDescriptor (
    CrisisTypeDescriptorId INT NOT NULL,
    CONSTRAINT CrisisTypeDescriptor_PK PRIMARY KEY (CrisisTypeDescriptorId)
); 

-- Table ne.DisciplineActionExtension --
CREATE TABLE ne.DisciplineActionExtension (
    DisciplineActionIdentifier VARCHAR(20) NOT NULL,
    DisciplineDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    UnilateralRemovalDescriptorId INT NULL,
    GFSAExpulsionModifiedToLessThanOneYear BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineActionExtension_PK PRIMARY KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
); 
ALTER TABLE ne.DisciplineActionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.DisciplineIncidentExtension --
CREATE TABLE ne.DisciplineIncidentExtension (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    HomicideIndicator BOOLEAN NULL,
    ShootingIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineIncidentExtension_PK PRIMARY KEY (IncidentIdentifier, SchoolId)
); 
ALTER TABLE ne.DisciplineIncidentExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.DualCreditDescriptor --
CREATE TABLE ne.DualCreditDescriptor (
    DualCreditDescriptorId INT NOT NULL,
    CONSTRAINT DualCreditDescriptor_PK PRIMARY KEY (DualCreditDescriptorId)
); 

-- Table ne.EarlyLearningSettingDescriptor --
CREATE TABLE ne.EarlyLearningSettingDescriptor (
    EarlyLearningSettingDescriptorId INT NOT NULL,
    CONSTRAINT EarlyLearningSettingDescriptor_PK PRIMARY KEY (EarlyLearningSettingDescriptorId)
); 

-- Table ne.ImmigrantIndicatorDescriptor --
CREATE TABLE ne.ImmigrantIndicatorDescriptor (
    ImmigrantIndicatorDescriptorId INT NOT NULL,
    CONSTRAINT ImmigrantIndicatorDescriptor_PK PRIMARY KEY (ImmigrantIndicatorDescriptorId)
); 

-- Table ne.PlacementTypeDescriptor --
CREATE TABLE ne.PlacementTypeDescriptor (
    PlacementTypeDescriptorId INT NOT NULL,
    CONSTRAINT PlacementTypeDescriptor_PK PRIMARY KEY (PlacementTypeDescriptorId)
); 

-- Table ne.PositionTitleDescriptor --
CREATE TABLE ne.PositionTitleDescriptor (
    PositionTitleDescriptorId INT NOT NULL,
    CONSTRAINT PositionTitleDescriptor_PK PRIMARY KEY (PositionTitleDescriptorId)
); 

-- Table ne.PostGraduateActivity --
CREATE TABLE ne.PostGraduateActivity (
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
ALTER TABLE ne.PostGraduateActivity ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE ne.PostGraduateActivity ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE ne.PostGraduateActivity ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table ne.PostGraduateActivityDescriptor --
CREATE TABLE ne.PostGraduateActivityDescriptor (
    PostGraduateActivityDescriptorId INT NOT NULL,
    CONSTRAINT PostGraduateActivityDescriptor_PK PRIMARY KEY (PostGraduateActivityDescriptorId)
); 

-- Table ne.PostGraduateActivityDeterminationDescriptor --
CREATE TABLE ne.PostGraduateActivityDeterminationDescriptor (
    PostGraduateActivityDeterminationDescriptorId INT NOT NULL,
    CONSTRAINT PostGraduateActivityDeterminationDescriptor_PK PRIMARY KEY (PostGraduateActivityDeterminationDescriptorId)
); 

-- Table ne.SectionDelivery --
CREATE TABLE ne.SectionDelivery (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionDeliveryDescriptorId INT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionDelivery_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionDeliveryDescriptorId, SectionIdentifier, SessionName)
); 
ALTER TABLE ne.SectionDelivery ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.SectionDeliveryDescriptor --
CREATE TABLE ne.SectionDeliveryDescriptor (
    SectionDeliveryDescriptorId INT NOT NULL,
    CONSTRAINT SectionDeliveryDescriptor_PK PRIMARY KEY (SectionDeliveryDescriptorId)
); 

-- Table ne.SectionExtension --
CREATE TABLE ne.SectionExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CourseStaffIdOverride VARCHAR(10) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE ne.SectionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.SpecialEducationProgramDescriptor --
CREATE TABLE ne.SpecialEducationProgramDescriptor (
    SpecialEducationProgramDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEducationProgramDescriptor_PK PRIMARY KEY (SpecialEducationProgramDescriptorId)
); 

-- Table ne.StudentDisciplineIncidentAssociationExtension --
CREATE TABLE ne.StudentDisciplineIncidentAssociationExtension (
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
ALTER TABLE ne.StudentDisciplineIncidentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentDisciplineIncidentAssociationWeapon --
CREATE TABLE ne.StudentDisciplineIncidentAssociationWeapon (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    WeaponDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentDisciplineIncidentAssociationWeapon_PK PRIMARY KEY (IncidentIdentifier, SchoolId, StudentUSI, WeaponDescriptorId)
); 
ALTER TABLE ne.StudentDisciplineIncidentAssociationWeapon ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentEarlyLearningProgramAssociation --
CREATE TABLE ne.StudentEarlyLearningProgramAssociation (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    EarlyLearningSettingDescriptorId INT NULL,
    CONSTRAINT StudentEarlyLearningProgramAssociation_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 

-- Table ne.StudentEducationOrganizationAssociationExtension --
CREATE TABLE ne.StudentEducationOrganizationAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ImmigrantIndicatorDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
); 
ALTER TABLE ne.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentEducationOrganizationAssociationStudentCrisisEvent --
CREATE TABLE ne.StudentEducationOrganizationAssociationStudentCrisisEvent (
    CrisisEventDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    DisplacedStudentIndicator BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationStudentCrisisEvent_PK PRIMARY KEY (CrisisEventDescriptorId, EducationOrganizationId, StudentUSI)
); 
ALTER TABLE ne.StudentEducationOrganizationAssociationStudentCrisisEvent ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentLanguageInstructionProgramAssociationExtension --
CREATE TABLE ne.StudentLanguageInstructionProgramAssociationExtension (
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
ALTER TABLE ne.StudentLanguageInstructionProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentSchoolAssociationExtension --
CREATE TABLE ne.StudentSchoolAssociationExtension (
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    StudentDaysEnrolled DECIMAL(5, 2) NULL,
    ResidentLocalEducationAgencyId INT NOT NULL,
    ReportingSchoolId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationExtension_PK PRIMARY KEY (EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE ne.StudentSchoolAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentSectionAssociationExtension --
CREATE TABLE ne.StudentSectionAssociationExtension (
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
ALTER TABLE ne.StudentSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE ne.StudentSpecialEducationProgramAssociationExtension (
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
ALTER TABLE ne.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table ne.UnilateralRemovalDescriptor --
CREATE TABLE ne.UnilateralRemovalDescriptor (
    UnilateralRemovalDescriptorId INT NOT NULL,
    CONSTRAINT UnilateralRemovalDescriptor_PK PRIMARY KEY (UnilateralRemovalDescriptorId)
); 

