-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table tpdm.AccreditationStatusDescriptor --
CREATE TABLE tpdm.AccreditationStatusDescriptor (
    AccreditationStatusDescriptorId INT NOT NULL,
    CONSTRAINT AccreditationStatusDescriptor_PK PRIMARY KEY (AccreditationStatusDescriptorId)
);

-- Table tpdm.AidTypeDescriptor --
CREATE TABLE tpdm.AidTypeDescriptor (
    AidTypeDescriptorId INT NOT NULL,
    CONSTRAINT AidTypeDescriptor_PK PRIMARY KEY (AidTypeDescriptorId)
);

-- Table tpdm.Candidate --
CREATE TABLE tpdm.Candidate (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    BirthCity VARCHAR(30) NULL,
    BirthCountryDescriptorId INT NULL,
    BirthDate DATE NOT NULL,
    BirthInternationalProvince VARCHAR(150) NULL,
    BirthSexDescriptorId INT NULL,
    BirthStateAbbreviationDescriptorId INT NULL,
    DateEnteredUS DATE NULL,
    DisplacementStatus VARCHAR(30) NULL,
    EconomicDisadvantaged BOOLEAN NULL,
    EnglishLanguageExamDescriptorId INT NULL,
    FirstGenerationStudent BOOLEAN NULL,
    FirstName VARCHAR(75) NOT NULL,
    GenderDescriptorId INT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    HispanicLatinoEthnicity BOOLEAN NULL,
    LastSurname VARCHAR(75) NOT NULL,
    LimitedEnglishProficiencyDescriptorId INT NULL,
    MaidenName VARCHAR(75) NULL,
    MiddleName VARCHAR(75) NULL,
    MultipleBirthStatus BOOLEAN NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    PersonId VARCHAR(32) NULL,
    SexDescriptorId INT NOT NULL,
    SourceSystemDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Candidate_PK PRIMARY KEY (CandidateIdentifier)
);
ALTER TABLE tpdm.Candidate ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.Candidate ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Candidate ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateAddress --
CREATE TABLE tpdm.CandidateAddress (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    AddressTypeDescriptorId INT NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    ApartmentRoomSuiteNumber VARCHAR(50) NULL,
    BuildingSiteNumber VARCHAR(20) NULL,
    CongressionalDistrict VARCHAR(30) NULL,
    CountyFIPSCode VARCHAR(5) NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    Latitude VARCHAR(20) NULL,
    LocaleDescriptorId INT NULL,
    Longitude VARCHAR(20) NULL,
    NameOfCounty VARCHAR(30) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateAddress_PK PRIMARY KEY (CandidateIdentifier, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
);
ALTER TABLE tpdm.CandidateAddress ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateAddressPeriod --
CREATE TABLE tpdm.CandidateAddressPeriod (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    AddressTypeDescriptorId INT NOT NULL,
    City VARCHAR(30) NOT NULL,
    PostalCode VARCHAR(17) NOT NULL,
    StateAbbreviationDescriptorId INT NOT NULL,
    StreetNumberName VARCHAR(150) NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateAddressPeriod_PK PRIMARY KEY (CandidateIdentifier, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName, BeginDate)
);
ALTER TABLE tpdm.CandidateAddressPeriod ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateDisability --
CREATE TABLE tpdm.CandidateDisability (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDeterminationSourceTypeDescriptorId INT NULL,
    DisabilityDiagnosis VARCHAR(80) NULL,
    OrderOfDisability INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateDisability_PK PRIMARY KEY (CandidateIdentifier, DisabilityDescriptorId)
);
ALTER TABLE tpdm.CandidateDisability ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateDisabilityDesignation --
CREATE TABLE tpdm.CandidateDisabilityDesignation (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    DisabilityDescriptorId INT NOT NULL,
    DisabilityDesignationDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateDisabilityDesignation_PK PRIMARY KEY (CandidateIdentifier, DisabilityDescriptorId, DisabilityDesignationDescriptorId)
);
ALTER TABLE tpdm.CandidateDisabilityDesignation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateEducatorPreparationProgramAssociation --
CREATE TABLE tpdm.CandidateEducatorPreparationProgramAssociation (
    BeginDate DATE NOT NULL,
    CandidateIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    EndDate DATE NULL,
    EPPProgramPathwayDescriptorId INT NULL,
    ReasonExitedDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CandidateEducatorPreparationProgramAssociation_PK PRIMARY KEY (BeginDate, CandidateIdentifier, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
);
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateEducatorPreparationProgramAssociationCohortYear --
CREATE TABLE tpdm.CandidateEducatorPreparationProgramAssociationCohortYear (
    BeginDate DATE NOT NULL,
    CandidateIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    CohortYearTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateEducatorPreparationProgramAssociationCohortYear_PK PRIMARY KEY (BeginDate, CandidateIdentifier, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, CohortYearTypeDescriptorId, SchoolYear)
);
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociationCohortYear ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateEducatorPreparationProgramAssociationDegreeSpec_2501c4 --
CREATE TABLE tpdm.CandidateEducatorPreparationProgramAssociationDegreeSpec_2501c4 (
    BeginDate DATE NOT NULL,
    CandidateIdentifier VARCHAR(32) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    MajorSpecialization VARCHAR(255) NOT NULL,
    EndDate DATE NULL,
    MinorSpecialization VARCHAR(255) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateEducatorPreparationProgramAssociationDegr_2501c4_PK PRIMARY KEY (BeginDate, CandidateIdentifier, EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, MajorSpecialization)
);
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociationDegreeSpec_2501c4 ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateElectronicMail --
CREATE TABLE tpdm.CandidateElectronicMail (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    ElectronicMailAddress VARCHAR(128) NOT NULL,
    ElectronicMailTypeDescriptorId INT NOT NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    PrimaryEmailAddressIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateElectronicMail_PK PRIMARY KEY (CandidateIdentifier, ElectronicMailAddress, ElectronicMailTypeDescriptorId)
);
ALTER TABLE tpdm.CandidateElectronicMail ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateLanguage --
CREATE TABLE tpdm.CandidateLanguage (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateLanguage_PK PRIMARY KEY (CandidateIdentifier, LanguageDescriptorId)
);
ALTER TABLE tpdm.CandidateLanguage ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateLanguageUse --
CREATE TABLE tpdm.CandidateLanguageUse (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    LanguageDescriptorId INT NOT NULL,
    LanguageUseDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateLanguageUse_PK PRIMARY KEY (CandidateIdentifier, LanguageDescriptorId, LanguageUseDescriptorId)
);
ALTER TABLE tpdm.CandidateLanguageUse ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateOtherName --
CREATE TABLE tpdm.CandidateOtherName (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    OtherNameTypeDescriptorId INT NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    GenerationCodeSuffix VARCHAR(10) NULL,
    LastSurname VARCHAR(75) NOT NULL,
    MiddleName VARCHAR(75) NULL,
    PersonalTitlePrefix VARCHAR(30) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateOtherName_PK PRIMARY KEY (CandidateIdentifier, OtherNameTypeDescriptorId)
);
ALTER TABLE tpdm.CandidateOtherName ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidatePersonalIdentificationDocument --
CREATE TABLE tpdm.CandidatePersonalIdentificationDocument (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    IdentificationDocumentUseDescriptorId INT NOT NULL,
    PersonalInformationVerificationDescriptorId INT NOT NULL,
    DocumentExpirationDate DATE NULL,
    DocumentTitle VARCHAR(60) NULL,
    IssuerCountryDescriptorId INT NULL,
    IssuerDocumentIdentificationCode VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidatePersonalIdentificationDocument_PK PRIMARY KEY (CandidateIdentifier, IdentificationDocumentUseDescriptorId, PersonalInformationVerificationDescriptorId)
);
ALTER TABLE tpdm.CandidatePersonalIdentificationDocument ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateRace --
CREATE TABLE tpdm.CandidateRace (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    RaceDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateRace_PK PRIMARY KEY (CandidateIdentifier, RaceDescriptorId)
);
ALTER TABLE tpdm.CandidateRace ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CandidateTelephone --
CREATE TABLE tpdm.CandidateTelephone (
    CandidateIdentifier VARCHAR(32) NOT NULL,
    TelephoneNumber VARCHAR(24) NOT NULL,
    TelephoneNumberTypeDescriptorId INT NOT NULL,
    DoNotPublishIndicator BOOLEAN NULL,
    OrderOfPriority INT NULL,
    TextMessageCapabilityIndicator BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CandidateTelephone_PK PRIMARY KEY (CandidateIdentifier, TelephoneNumber, TelephoneNumberTypeDescriptorId)
);
ALTER TABLE tpdm.CandidateTelephone ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CertificationRouteDescriptor --
CREATE TABLE tpdm.CertificationRouteDescriptor (
    CertificationRouteDescriptorId INT NOT NULL,
    CONSTRAINT CertificationRouteDescriptor_PK PRIMARY KEY (CertificationRouteDescriptorId)
);

-- Table tpdm.CoteachingStyleObservedDescriptor --
CREATE TABLE tpdm.CoteachingStyleObservedDescriptor (
    CoteachingStyleObservedDescriptorId INT NOT NULL,
    CONSTRAINT CoteachingStyleObservedDescriptor_PK PRIMARY KEY (CoteachingStyleObservedDescriptorId)
);

-- Table tpdm.CredentialExtension --
CREATE TABLE tpdm.CredentialExtension (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    BoardCertificationIndicator BOOLEAN NULL,
    CertificationRouteDescriptorId INT NULL,
    CertificationTitle VARCHAR(64) NULL,
    CredentialStatusDate DATE NULL,
    CredentialStatusDescriptorId INT NULL,
    EducatorRoleDescriptorId INT NULL,
    PersonId VARCHAR(32) NULL,
    SourceSystemDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialExtension_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId)
);
ALTER TABLE tpdm.CredentialExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.CredentialStatusDescriptor --
CREATE TABLE tpdm.CredentialStatusDescriptor (
    CredentialStatusDescriptorId INT NOT NULL,
    CONSTRAINT CredentialStatusDescriptor_PK PRIMARY KEY (CredentialStatusDescriptorId)
);

-- Table tpdm.CredentialStudentAcademicRecord --
CREATE TABLE tpdm.CredentialStudentAcademicRecord (
    CredentialIdentifier VARCHAR(60) NOT NULL,
    StateOfIssueStateAbbreviationDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CredentialStudentAcademicRecord_PK PRIMARY KEY (CredentialIdentifier, StateOfIssueStateAbbreviationDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
);
ALTER TABLE tpdm.CredentialStudentAcademicRecord ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EducatorPreparationProgram --
CREATE TABLE tpdm.EducatorPreparationProgram (
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    AccreditationStatusDescriptorId INT NULL,
    ProgramId VARCHAR(20) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EducatorPreparationProgram_PK PRIMARY KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
);
ALTER TABLE tpdm.EducatorPreparationProgram ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EducatorPreparationProgram ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EducatorPreparationProgram ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EducatorPreparationProgramGradeLevel --
CREATE TABLE tpdm.EducatorPreparationProgramGradeLevel (
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(255) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EducatorPreparationProgramGradeLevel_PK PRIMARY KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId, GradeLevelDescriptorId)
);
ALTER TABLE tpdm.EducatorPreparationProgramGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EducatorRoleDescriptor --
CREATE TABLE tpdm.EducatorRoleDescriptor (
    EducatorRoleDescriptorId INT NOT NULL,
    CONSTRAINT EducatorRoleDescriptor_PK PRIMARY KEY (EducatorRoleDescriptorId)
);

-- Table tpdm.EnglishLanguageExamDescriptor --
CREATE TABLE tpdm.EnglishLanguageExamDescriptor (
    EnglishLanguageExamDescriptorId INT NOT NULL,
    CONSTRAINT EnglishLanguageExamDescriptor_PK PRIMARY KEY (EnglishLanguageExamDescriptorId)
);

-- Table tpdm.EPPProgramPathwayDescriptor --
CREATE TABLE tpdm.EPPProgramPathwayDescriptor (
    EPPProgramPathwayDescriptorId INT NOT NULL,
    CONSTRAINT EPPProgramPathwayDescriptor_PK PRIMARY KEY (EPPProgramPathwayDescriptorId)
);

-- Table tpdm.Evaluation --
CREATE TABLE tpdm.Evaluation (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationDescription VARCHAR(255) NULL,
    EvaluationTypeDescriptorId INT NULL,
    InterRaterReliabilityScore INT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT Evaluation_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId)
);
ALTER TABLE tpdm.Evaluation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.Evaluation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.Evaluation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationElement --
CREATE TABLE tpdm.EvaluationElement (
    EducationOrganizationId INT NOT NULL,
    EvaluationElementTitle VARCHAR(255) NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationTypeDescriptorId INT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    SortOrder INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EvaluationElement_PK PRIMARY KEY (EducationOrganizationId, EvaluationElementTitle, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId)
);
ALTER TABLE tpdm.EvaluationElement ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EvaluationElement ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EvaluationElement ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationElementRating --
CREATE TABLE tpdm.EvaluationElementRating (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationElementTitle VARCHAR(255) NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AreaOfRefinement VARCHAR(1024) NULL,
    AreaOfReinforcement VARCHAR(1024) NULL,
    Comments VARCHAR(1024) NULL,
    EvaluationElementRatingLevelDescriptorId INT NULL,
    Feedback VARCHAR(2048) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EvaluationElementRating_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationElementTitle, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId)
);
ALTER TABLE tpdm.EvaluationElementRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EvaluationElementRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EvaluationElementRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationElementRatingLevel --
CREATE TABLE tpdm.EvaluationElementRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationElementTitle VARCHAR(255) NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationRatingLevelDescriptorId INT NOT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationElementRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationElementTitle, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId, EvaluationRatingLevelDescriptorId)
);
ALTER TABLE tpdm.EvaluationElementRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationElementRatingLevelDescriptor --
CREATE TABLE tpdm.EvaluationElementRatingLevelDescriptor (
    EvaluationElementRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT EvaluationElementRatingLevelDescriptor_PK PRIMARY KEY (EvaluationElementRatingLevelDescriptorId)
);

-- Table tpdm.EvaluationElementRatingResult --
CREATE TABLE tpdm.EvaluationElementRatingResult (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationElementTitle VARCHAR(255) NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Rating DECIMAL(6, 3) NOT NULL,
    RatingResultTitle VARCHAR(50) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationElementRatingResult_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationElementTitle, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, Rating, RatingResultTitle)
);
ALTER TABLE tpdm.EvaluationElementRatingResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationObjective --
CREATE TABLE tpdm.EvaluationObjective (
    EducationOrganizationId INT NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationObjectiveDescription VARCHAR(255) NULL,
    EvaluationTypeDescriptorId INT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    SortOrder INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EvaluationObjective_PK PRIMARY KEY (EducationOrganizationId, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId)
);
ALTER TABLE tpdm.EvaluationObjective ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EvaluationObjective ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EvaluationObjective ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationObjectiveRating --
CREATE TABLE tpdm.EvaluationObjectiveRating (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Comments VARCHAR(1024) NULL,
    ObjectiveRatingLevelDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EvaluationObjectiveRating_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId)
);
ALTER TABLE tpdm.EvaluationObjectiveRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EvaluationObjectiveRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EvaluationObjectiveRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationObjectiveRatingLevel --
CREATE TABLE tpdm.EvaluationObjectiveRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationRatingLevelDescriptorId INT NOT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationObjectiveRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId, EvaluationRatingLevelDescriptorId)
);
ALTER TABLE tpdm.EvaluationObjectiveRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationObjectiveRatingResult --
CREATE TABLE tpdm.EvaluationObjectiveRatingResult (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Rating DECIMAL(6, 3) NOT NULL,
    RatingResultTitle VARCHAR(50) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationObjectiveRatingResult_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, Rating, RatingResultTitle)
);
ALTER TABLE tpdm.EvaluationObjectiveRatingResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationPeriodDescriptor --
CREATE TABLE tpdm.EvaluationPeriodDescriptor (
    EvaluationPeriodDescriptorId INT NOT NULL,
    CONSTRAINT EvaluationPeriodDescriptor_PK PRIMARY KEY (EvaluationPeriodDescriptorId)
);

-- Table tpdm.EvaluationRating --
CREATE TABLE tpdm.EvaluationRating (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationRatingLevelDescriptorId INT NULL,
    EvaluationRatingStatusDescriptorId INT NULL,
    LocalCourseCode VARCHAR(60) NULL,
    SchoolId INT NULL,
    SectionIdentifier VARCHAR(255) NULL,
    SessionName VARCHAR(60) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT EvaluationRating_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId)
);
ALTER TABLE tpdm.EvaluationRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.EvaluationRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.EvaluationRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationRatingLevel --
CREATE TABLE tpdm.EvaluationRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationRatingLevelDescriptorId INT NOT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId, EvaluationRatingLevelDescriptorId)
);
ALTER TABLE tpdm.EvaluationRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationRatingLevelDescriptor --
CREATE TABLE tpdm.EvaluationRatingLevelDescriptor (
    EvaluationRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT EvaluationRatingLevelDescriptor_PK PRIMARY KEY (EvaluationRatingLevelDescriptorId)
);

-- Table tpdm.EvaluationRatingResult --
CREATE TABLE tpdm.EvaluationRatingResult (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Rating DECIMAL(6, 3) NOT NULL,
    RatingResultTitle VARCHAR(50) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationRatingResult_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, Rating, RatingResultTitle)
);
ALTER TABLE tpdm.EvaluationRatingResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationRatingReviewer --
CREATE TABLE tpdm.EvaluationRatingReviewer (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    ReviewerPersonId VARCHAR(32) NULL,
    ReviewerSourceSystemDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationRatingReviewer_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, FirstName, LastSurname)
);
ALTER TABLE tpdm.EvaluationRatingReviewer ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationRatingReviewerReceivedTraining --
CREATE TABLE tpdm.EvaluationRatingReviewerReceivedTraining (
    EducationOrganizationId INT NOT NULL,
    EvaluationDate TIMESTAMP NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    InterRaterReliabilityScore INT NULL,
    ReceivedTrainingDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT EvaluationRatingReviewerReceivedTraining_PK PRIMARY KEY (EducationOrganizationId, EvaluationDate, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, FirstName, LastSurname)
);
ALTER TABLE tpdm.EvaluationRatingReviewerReceivedTraining ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.EvaluationRatingStatusDescriptor --
CREATE TABLE tpdm.EvaluationRatingStatusDescriptor (
    EvaluationRatingStatusDescriptorId INT NOT NULL,
    CONSTRAINT EvaluationRatingStatusDescriptor_PK PRIMARY KEY (EvaluationRatingStatusDescriptorId)
);

-- Table tpdm.EvaluationTypeDescriptor --
CREATE TABLE tpdm.EvaluationTypeDescriptor (
    EvaluationTypeDescriptorId INT NOT NULL,
    CONSTRAINT EvaluationTypeDescriptor_PK PRIMARY KEY (EvaluationTypeDescriptorId)
);

-- Table tpdm.FinancialAid --
CREATE TABLE tpdm.FinancialAid (
    AidTypeDescriptorId INT NOT NULL,
    BeginDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    AidAmount DECIMAL(19, 4) NULL,
    AidConditionDescription VARCHAR(1024) NULL,
    EndDate DATE NULL,
    PellGrantRecipient BOOLEAN NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT FinancialAid_PK PRIMARY KEY (AidTypeDescriptorId, BeginDate, StudentUSI)
);
ALTER TABLE tpdm.FinancialAid ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.FinancialAid ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.FinancialAid ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.GenderDescriptor --
CREATE TABLE tpdm.GenderDescriptor (
    GenderDescriptorId INT NOT NULL,
    CONSTRAINT GenderDescriptor_PK PRIMARY KEY (GenderDescriptorId)
);

-- Table tpdm.ObjectiveRatingLevelDescriptor --
CREATE TABLE tpdm.ObjectiveRatingLevelDescriptor (
    ObjectiveRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT ObjectiveRatingLevelDescriptor_PK PRIMARY KEY (ObjectiveRatingLevelDescriptorId)
);

-- Table tpdm.PerformanceEvaluation --
CREATE TABLE tpdm.PerformanceEvaluation (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AcademicSubjectDescriptorId INT NULL,
    PerformanceEvaluationDescription VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PerformanceEvaluation_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId)
);
ALTER TABLE tpdm.PerformanceEvaluation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.PerformanceEvaluation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.PerformanceEvaluation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationGradeLevel --
CREATE TABLE tpdm.PerformanceEvaluationGradeLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    GradeLevelDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceEvaluationGradeLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId, GradeLevelDescriptorId)
);
ALTER TABLE tpdm.PerformanceEvaluationGradeLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationRating --
CREATE TABLE tpdm.PerformanceEvaluationRating (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ActualDate DATE NOT NULL,
    ActualDuration INT NULL,
    ActualTime TIME NULL,
    Announced BOOLEAN NULL,
    Comments VARCHAR(1024) NULL,
    CoteachingStyleObservedDescriptorId INT NULL,
    PerformanceEvaluationRatingLevelDescriptorId INT NULL,
    ScheduleDate DATE NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT PerformanceEvaluationRating_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId)
);
ALTER TABLE tpdm.PerformanceEvaluationRating ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.PerformanceEvaluationRating ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.PerformanceEvaluationRating ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationRatingLevel --
CREATE TABLE tpdm.PerformanceEvaluationRatingLevel (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    EvaluationRatingLevelDescriptorId INT NOT NULL,
    MaxRating DECIMAL(6, 3) NULL,
    MinRating DECIMAL(6, 3) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceEvaluationRatingLevel_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, SchoolYear, TermDescriptorId, EvaluationRatingLevelDescriptorId)
);
ALTER TABLE tpdm.PerformanceEvaluationRatingLevel ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationRatingLevelDescriptor --
CREATE TABLE tpdm.PerformanceEvaluationRatingLevelDescriptor (
    PerformanceEvaluationRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT PerformanceEvaluationRatingLevelDescriptor_PK PRIMARY KEY (PerformanceEvaluationRatingLevelDescriptorId)
);

-- Table tpdm.PerformanceEvaluationRatingResult --
CREATE TABLE tpdm.PerformanceEvaluationRatingResult (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Rating DECIMAL(6, 3) NOT NULL,
    RatingResultTitle VARCHAR(50) NOT NULL,
    ResultDatatypeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceEvaluationRatingResult_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, Rating, RatingResultTitle)
);
ALTER TABLE tpdm.PerformanceEvaluationRatingResult ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationRatingReviewer --
CREATE TABLE tpdm.PerformanceEvaluationRatingReviewer (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    ReviewerPersonId VARCHAR(32) NULL,
    ReviewerSourceSystemDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceEvaluationRatingReviewer_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, FirstName, LastSurname)
);
ALTER TABLE tpdm.PerformanceEvaluationRatingReviewer ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationRatingReviewerReceivedTraining --
CREATE TABLE tpdm.PerformanceEvaluationRatingReviewerReceivedTraining (
    EducationOrganizationId INT NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FirstName VARCHAR(75) NOT NULL,
    LastSurname VARCHAR(75) NOT NULL,
    InterRaterReliabilityScore INT NULL,
    ReceivedTrainingDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT PerformanceEvaluationRatingReviewerReceivedTraining_PK PRIMARY KEY (EducationOrganizationId, EvaluationPeriodDescriptorId, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, PersonId, SchoolYear, SourceSystemDescriptorId, TermDescriptorId, FirstName, LastSurname)
);
ALTER TABLE tpdm.PerformanceEvaluationRatingReviewerReceivedTraining ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.PerformanceEvaluationTypeDescriptor --
CREATE TABLE tpdm.PerformanceEvaluationTypeDescriptor (
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    CONSTRAINT PerformanceEvaluationTypeDescriptor_PK PRIMARY KEY (PerformanceEvaluationTypeDescriptorId)
);

-- Table tpdm.RubricDimension --
CREATE TABLE tpdm.RubricDimension (
    EducationOrganizationId INT NOT NULL,
    EvaluationElementTitle VARCHAR(255) NOT NULL,
    EvaluationObjectiveTitle VARCHAR(50) NOT NULL,
    EvaluationPeriodDescriptorId INT NOT NULL,
    EvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTitle VARCHAR(50) NOT NULL,
    PerformanceEvaluationTypeDescriptorId INT NOT NULL,
    RubricRating INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CriterionDescription VARCHAR(1024) NOT NULL,
    DimensionOrder INT NULL,
    RubricRatingLevelDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT RubricDimension_PK PRIMARY KEY (EducationOrganizationId, EvaluationElementTitle, EvaluationObjectiveTitle, EvaluationPeriodDescriptorId, EvaluationTitle, PerformanceEvaluationTitle, PerformanceEvaluationTypeDescriptorId, RubricRating, SchoolYear, TermDescriptorId)
);
ALTER TABLE tpdm.RubricDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.RubricDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.RubricDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.RubricRatingLevelDescriptor --
CREATE TABLE tpdm.RubricRatingLevelDescriptor (
    RubricRatingLevelDescriptorId INT NOT NULL,
    CONSTRAINT RubricRatingLevelDescriptor_PK PRIMARY KEY (RubricRatingLevelDescriptorId)
);

-- Table tpdm.SchoolExtension --
CREATE TABLE tpdm.SchoolExtension (
    SchoolId INT NOT NULL,
    PostSecondaryInstitutionId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SchoolExtension_PK PRIMARY KEY (SchoolId)
);
ALTER TABLE tpdm.SchoolExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.SurveyResponseExtension --
CREATE TABLE tpdm.SurveyResponseExtension (
    Namespace VARCHAR(255) NOT NULL,
    SurveyIdentifier VARCHAR(60) NOT NULL,
    SurveyResponseIdentifier VARCHAR(60) NOT NULL,
    PersonId VARCHAR(32) NULL,
    SourceSystemDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SurveyResponseExtension_PK PRIMARY KEY (Namespace, SurveyIdentifier, SurveyResponseIdentifier)
);
ALTER TABLE tpdm.SurveyResponseExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.SurveyResponsePersonTargetAssociation --
CREATE TABLE tpdm.SurveyResponsePersonTargetAssociation (
    Namespace VARCHAR(255) NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    SurveyIdentifier VARCHAR(60) NOT NULL,
    SurveyResponseIdentifier VARCHAR(60) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SurveyResponsePersonTargetAssociation_PK PRIMARY KEY (Namespace, PersonId, SourceSystemDescriptorId, SurveyIdentifier, SurveyResponseIdentifier)
);
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

-- Table tpdm.SurveySectionResponsePersonTargetAssociation --
CREATE TABLE tpdm.SurveySectionResponsePersonTargetAssociation (
    Namespace VARCHAR(255) NOT NULL,
    PersonId VARCHAR(32) NOT NULL,
    SourceSystemDescriptorId INT NOT NULL,
    SurveyIdentifier VARCHAR(60) NOT NULL,
    SurveyResponseIdentifier VARCHAR(60) NOT NULL,
    SurveySectionTitle VARCHAR(255) NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SurveySectionResponsePersonTargetAssociation_PK PRIMARY KEY (Namespace, PersonId, SourceSystemDescriptorId, SurveyIdentifier, SurveyResponseIdentifier, SurveySectionTitle)
);
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp AT TIME ZONE 'UTC';

