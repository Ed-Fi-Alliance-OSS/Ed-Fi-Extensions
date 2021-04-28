CREATE TABLE tracked_deletes_sk.AssessmentAdministration
(
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       Namespace VARCHAR(255) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AssessmentAdministration_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.CrisisDetails
(
       CrisisEventDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CrisisDetails_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.CrisisEventDescriptor
(
       CrisisEventDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CrisisEventDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.CrisisTypeDescriptor
(
       CrisisTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CrisisTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.DualCreditDescriptor
(
       DualCreditDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DualCreditDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.EarlyLearningSettingDescriptor
(
       EarlyLearningSettingDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EarlyLearningSettingDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.ImmigrantIndicatorDescriptor
(
       ImmigrantIndicatorDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ImmigrantIndicatorDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.PlacementTypeDescriptor
(
       PlacementTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PlacementTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.PositionTitleDescriptor
(
       PositionTitleDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PositionTitleDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.PostGraduateActivity
(
       LocalEducationAgencyId INT NOT NULL,
       SchoolYear SMALLINT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PostGraduateActivity_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.PostGraduateActivityDescriptor
(
       PostGraduateActivityDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PostGraduateActivityDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.PostGraduateActivityDeterminationDescriptor
(
       PostGraduateActivityDeterminationDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT PostGraduateActivityDeterminationDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.SectionDeliveryDescriptor
(
       SectionDeliveryDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SectionDeliveryDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.SpecialEducationProgramDescriptor
(
       SpecialEducationProgramDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationProgramDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.StudentEarlyLearningProgramAssociation
(
       BeginDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       ProgramEducationOrganizationId INT NOT NULL,
       ProgramName VARCHAR(60) NOT NULL,
       ProgramTypeDescriptorId INT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentEarlyLearningProgramAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_sk.UnilateralRemovalDescriptor
(
       UnilateralRemovalDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT UnilateralRemovalDescriptor_PK PRIMARY KEY (ChangeVersion)
);

