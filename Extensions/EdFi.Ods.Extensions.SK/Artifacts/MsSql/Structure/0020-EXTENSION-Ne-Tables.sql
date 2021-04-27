-- Table [ne].[AssessmentAdministration] --
CREATE TABLE [ne].[AssessmentAdministration] (
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AssessmentAdministration_PK] PRIMARY KEY CLUSTERED (
        [AssessmentIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [Namespace] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[AssessmentAdministration] ADD CONSTRAINT [AssessmentAdministration_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [ne].[AssessmentAdministration] ADD CONSTRAINT [AssessmentAdministration_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [ne].[AssessmentAdministration] ADD CONSTRAINT [AssessmentAdministration_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [ne].[CalendarDateExtension] --
CREATE TABLE [ne].[CalendarDateExtension] (
    [CalendarCode] [NVARCHAR](60) NOT NULL,
    [Date] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [InstructionalDuration] [DECIMAL](3, 2) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CalendarDateExtension_PK] PRIMARY KEY CLUSTERED (
        [CalendarCode] ASC,
        [Date] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[CalendarDateExtension] ADD CONSTRAINT [CalendarDateExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[CrisisDetails] --
CREATE TABLE [ne].[CrisisDetails] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    [CrisisTypeDescriptorId] [INT] NOT NULL,
    [CrisisStartDate] [DATE] NOT NULL,
    [CrisisDesription] [NVARCHAR](1024) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CrisisDetails_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [ne].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [ne].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [ne].[CrisisEventDescriptor] --
CREATE TABLE [ne].[CrisisEventDescriptor] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CrisisEventDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[CrisisTypeDescriptor] --
CREATE TABLE [ne].[CrisisTypeDescriptor] (
    [CrisisTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CrisisTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CrisisTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[DisciplineActionExtension] --
CREATE TABLE [ne].[DisciplineActionExtension] (
    [DisciplineActionIdentifier] [NVARCHAR](20) NOT NULL,
    [DisciplineDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [UnilateralRemovalDescriptorId] [INT] NULL,
    [GFSAExpulsionModifiedToLessThanOneYear] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [DisciplineActionExtension_PK] PRIMARY KEY CLUSTERED (
        [DisciplineActionIdentifier] ASC,
        [DisciplineDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[DisciplineActionExtension] ADD CONSTRAINT [DisciplineActionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[DisciplineIncidentExtension] --
CREATE TABLE [ne].[DisciplineIncidentExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [HomicideIndicator] [BIT] NULL,
    [ShootingIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [DisciplineIncidentExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[DisciplineIncidentExtension] ADD CONSTRAINT [DisciplineIncidentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[DualCreditDescriptor] --
CREATE TABLE [ne].[DualCreditDescriptor] (
    [DualCreditDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DualCreditDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DualCreditDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[EarlyLearningSettingDescriptor] --
CREATE TABLE [ne].[EarlyLearningSettingDescriptor] (
    [EarlyLearningSettingDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EarlyLearningSettingDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EarlyLearningSettingDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[ImmigrantIndicatorDescriptor] --
CREATE TABLE [ne].[ImmigrantIndicatorDescriptor] (
    [ImmigrantIndicatorDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ImmigrantIndicatorDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ImmigrantIndicatorDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[PlacementTypeDescriptor] --
CREATE TABLE [ne].[PlacementTypeDescriptor] (
    [PlacementTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PlacementTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PlacementTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[PositionTitleDescriptor] --
CREATE TABLE [ne].[PositionTitleDescriptor] (
    [PositionTitleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PositionTitleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PositionTitleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[PostGraduateActivity] --
CREATE TABLE [ne].[PostGraduateActivity] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PostGraduateActivityDescriptorId] [INT] NOT NULL,
    [PostGraduateActivityDeterminationDescriptorId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PostGraduateActivity_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[PostGraduateActivity] ADD CONSTRAINT [PostGraduateActivity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [ne].[PostGraduateActivity] ADD CONSTRAINT [PostGraduateActivity_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [ne].[PostGraduateActivity] ADD CONSTRAINT [PostGraduateActivity_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [ne].[PostGraduateActivityDescriptor] --
CREATE TABLE [ne].[PostGraduateActivityDescriptor] (
    [PostGraduateActivityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PostGraduateActivityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PostGraduateActivityDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[PostGraduateActivityDeterminationDescriptor] --
CREATE TABLE [ne].[PostGraduateActivityDeterminationDescriptor] (
    [PostGraduateActivityDeterminationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PostGraduateActivityDeterminationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PostGraduateActivityDeterminationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[SectionDelivery] --
CREATE TABLE [ne].[SectionDelivery] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionDeliveryDescriptorId] [INT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionDelivery_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionDeliveryDescriptorId] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[SectionDelivery] ADD CONSTRAINT [SectionDelivery_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[SectionDeliveryDescriptor] --
CREATE TABLE [ne].[SectionDeliveryDescriptor] (
    [SectionDeliveryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SectionDeliveryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SectionDeliveryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[SectionExtension] --
CREATE TABLE [ne].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [CourseStaffIdOverride] [NVARCHAR](10) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[SpecialEducationProgramDescriptor] --
CREATE TABLE [ne].[SpecialEducationProgramDescriptor] (
    [SpecialEducationProgramDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationProgramDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationProgramDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[StudentDisciplineIncidentAssociationExtension] --
CREATE TABLE [ne].[StudentDisciplineIncidentAssociationExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [GunFreeSchoolViolation] [BIT] NULL,
    [SchoolRelatedArrestIndicator] [BIT] NULL,
    [ReferralToLawEnforcement] [BIT] NULL,
    [SeriousBodilyInjury] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentDisciplineIncidentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentDisciplineIncidentAssociationExtension] ADD CONSTRAINT [StudentDisciplineIncidentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentDisciplineIncidentAssociationWeapon] --
CREATE TABLE [ne].[StudentDisciplineIncidentAssociationWeapon] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [WeaponDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentDisciplineIncidentAssociationWeapon_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC,
        [WeaponDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentDisciplineIncidentAssociationWeapon] ADD CONSTRAINT [StudentDisciplineIncidentAssociationWeapon_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentEarlyLearningProgramAssociation] --
CREATE TABLE [ne].[StudentEarlyLearningProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EarlyLearningSettingDescriptorId] [INT] NULL,
    CONSTRAINT [StudentEarlyLearningProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [ne].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [ne].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ImmigrantIndicatorDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
CREATE TABLE [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisplacedStudentIndicator] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationStudentCrisisEvent_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentEducationOrganizationAssociationStudentCrisisEvent] ADD CONSTRAINT [StudentEducationOrganizationAssociationStudentCrisisEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentLanguageInstructionProgramAssociationExtension] --
CREATE TABLE [ne].[StudentLanguageInstructionProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [RedesignatedEnglishFluent] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentLanguageInstructionProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentLanguageInstructionProgramAssociationExtension] ADD CONSTRAINT [StudentLanguageInstructionProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentSchoolAssociationExtension] --
CREATE TABLE [ne].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [StudentDaysEnrolled] [DECIMAL](5, 2) NULL,
    [ResidentLocalEducationAgencyId] [INT] NOT NULL,
    [ResidentSchoolId] [INT] NULL,
    [ReportingSchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentSectionAssociationExtension] --
CREATE TABLE [ne].[StudentSectionAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DualCreditDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentSectionAssociationExtension] ADD CONSTRAINT [StudentSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [ne].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEducationProgramDescriptorId] [INT] NULL,
    [PlacementTypeDescriptorId] [INT] NULL,
    [ToTakeAlternateAssessment] [BIT] NULL,
    [InitialSpecialEducationEntryDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ne].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [ne].[UnilateralRemovalDescriptor] --
CREATE TABLE [ne].[UnilateralRemovalDescriptor] (
    [UnilateralRemovalDescriptorId] [INT] NOT NULL,
    CONSTRAINT [UnilateralRemovalDescriptor_PK] PRIMARY KEY CLUSTERED (
        [UnilateralRemovalDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

