-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- Table [sample].[ArtMediumDescriptor] --
CREATE TABLE [sample].[ArtMediumDescriptor] (
    [ArtMediumDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ArtMediumDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ArtMediumDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [sample].[Bus] --
CREATE TABLE [sample].[Bus] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Bus_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[Bus] ADD CONSTRAINT [Bus_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [sample].[Bus] ADD CONSTRAINT [Bus_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [sample].[Bus] ADD CONSTRAINT [Bus_DF_LastModifiedDate] DEFAULT (getutcdate()) FOR [LastModifiedDate]
GO

-- Table [sample].[BusRoute] --
CREATE TABLE [sample].[BusRoute] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [BeginDate] [DATE] NULL,
    [BusRouteDirection] [NVARCHAR](15) NOT NULL,
    [BusRouteDuration] [INT] NULL,
    [Daily] [BIT] NULL,
    [DisabilityDescriptorId] [INT] NULL,
    [EducationOrganizationId] [BIGINT] NULL,
    [ExpectedTransitTime] [NVARCHAR](30) NOT NULL,
    [HoursPerWeek] [DECIMAL](5, 2) NOT NULL,
    [OperatingCost] [MONEY] NOT NULL,
    [OptimalCapacity] [DECIMAL](5, 4) NULL,
    [StaffClassificationDescriptorId] [INT] NULL,
    [StaffUSI] [INT] NULL,
    [StartDate] [DATE] NULL,
    [WeeklyMileage] [DECIMAL](5, 2) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [BusRoute_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRoute] ADD CONSTRAINT [BusRoute_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [sample].[BusRoute] ADD CONSTRAINT [BusRoute_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [sample].[BusRoute] ADD CONSTRAINT [BusRoute_DF_LastModifiedDate] DEFAULT (getutcdate()) FOR [LastModifiedDate]
GO

-- Table [sample].[BusRouteBusYear] --
CREATE TABLE [sample].[BusRouteBusYear] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [BusYear] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [BusRouteBusYear_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC,
        [BusYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRouteBusYear] ADD CONSTRAINT [BusRouteBusYear_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[BusRouteProgram] --
CREATE TABLE [sample].[BusRouteProgram] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [BusRouteProgram_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC,
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRouteProgram] ADD CONSTRAINT [BusRouteProgram_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[BusRouteServiceAreaPostalCode] --
CREATE TABLE [sample].[BusRouteServiceAreaPostalCode] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [ServiceAreaPostalCode] [NVARCHAR](17) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [BusRouteServiceAreaPostalCode_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC,
        [ServiceAreaPostalCode] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRouteServiceAreaPostalCode] ADD CONSTRAINT [BusRouteServiceAreaPostalCode_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[BusRouteStartTime] --
CREATE TABLE [sample].[BusRouteStartTime] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [StartTime] [TIME](7) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [BusRouteStartTime_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC,
        [StartTime] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRouteStartTime] ADD CONSTRAINT [BusRouteStartTime_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[BusRouteTelephone] --
CREATE TABLE [sample].[BusRouteTelephone] (
    [BusId] [NVARCHAR](60) NOT NULL,
    [BusRouteNumber] [INT] NOT NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [OrderOfPriority] [INT] NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [BusRouteTelephone_PK] PRIMARY KEY CLUSTERED (
        [BusId] ASC,
        [BusRouteNumber] ASC,
        [TelephoneNumber] ASC,
        [TelephoneNumberTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[BusRouteTelephone] ADD CONSTRAINT [BusRouteTelephone_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactAddressExtension] --
CREATE TABLE [sample].[ContactAddressExtension] (
    [ContactUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [OnBusRoute] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactAddressExtension] ADD CONSTRAINT [ContactAddressExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactAddressSchoolDistrict] --
CREATE TABLE [sample].[ContactAddressSchoolDistrict] (
    [ContactUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [SchoolDistrict] [NVARCHAR](250) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactAddressSchoolDistrict_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [SchoolDistrict] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactAddressSchoolDistrict] ADD CONSTRAINT [ContactAddressSchoolDistrict_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactAddressTerm] --
CREATE TABLE [sample].[ContactAddressTerm] (
    [ContactUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactAddressTerm_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactAddressTerm] ADD CONSTRAINT [ContactAddressTerm_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactAuthor] --
CREATE TABLE [sample].[ContactAuthor] (
    [ContactUSI] [INT] NOT NULL,
    [Author] [NVARCHAR](100) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactAuthor_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [Author] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactAuthor] ADD CONSTRAINT [ContactAuthor_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactCeilingHeight] --
CREATE TABLE [sample].[ContactCeilingHeight] (
    [ContactUSI] [INT] NOT NULL,
    [CeilingHeight] [DECIMAL](5, 1) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactCeilingHeight_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [CeilingHeight] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactCeilingHeight] ADD CONSTRAINT [ContactCeilingHeight_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactCTEProgramService] --
CREATE TABLE [sample].[ContactCTEProgramService] (
    [ContactUSI] [INT] NOT NULL,
    [CIPCode] [NVARCHAR](120) NULL,
    [CTEProgramServiceDescriptorId] [INT] NOT NULL,
    [PrimaryIndicator] [BIT] NULL,
    [ServiceBeginDate] [DATE] NULL,
    [ServiceEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactCTEProgramService_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactCTEProgramService] ADD CONSTRAINT [ContactCTEProgramService_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactEducationContent] --
CREATE TABLE [sample].[ContactEducationContent] (
    [ContactUSI] [INT] NOT NULL,
    [ContentIdentifier] [NVARCHAR](225) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactEducationContent_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [ContentIdentifier] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactEducationContent] ADD CONSTRAINT [ContactEducationContent_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactExtension] --
CREATE TABLE [sample].[ContactExtension] (
    [ContactUSI] [INT] NOT NULL,
    [AverageCarLineWait] [NVARCHAR](30) NULL,
    [BecameParent] [SMALLINT] NULL,
    [CoffeeSpend] [MONEY] NULL,
    [CredentialFieldDescriptorId] [INT] NULL,
    [Duration] [INT] NULL,
    [GPA] [DECIMAL](18, 4) NULL,
    [GraduationDate] [DATE] NULL,
    [IsSportsFan] [BIT] NOT NULL,
    [LuckyNumber] [INT] NULL,
    [PreferredWakeUpTime] [TIME](7) NULL,
    [RainCertainty] [DECIMAL](5, 4) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactExtension_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactExtension] ADD CONSTRAINT [ContactExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactFavoriteBookTitle] --
CREATE TABLE [sample].[ContactFavoriteBookTitle] (
    [ContactUSI] [INT] NOT NULL,
    [FavoriteBookTitle] [NVARCHAR](100) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactFavoriteBookTitle_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [FavoriteBookTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactFavoriteBookTitle] ADD CONSTRAINT [ContactFavoriteBookTitle_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactStudentProgramAssociation] --
CREATE TABLE [sample].[ContactStudentProgramAssociation] (
    [ContactUSI] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactStudentProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactStudentProgramAssociation] ADD CONSTRAINT [ContactStudentProgramAssociation_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[ContactTeacherConference] --
CREATE TABLE [sample].[ContactTeacherConference] (
    [ContactUSI] [INT] NOT NULL,
    [DayOfWeek] [NVARCHAR](10) NOT NULL,
    [EndTime] [TIME](7) NOT NULL,
    [StartTime] [TIME](7) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ContactTeacherConference_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[ContactTeacherConference] ADD CONSTRAINT [ContactTeacherConference_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[FavoriteBookCategoryDescriptor] --
CREATE TABLE [sample].[FavoriteBookCategoryDescriptor] (
    [FavoriteBookCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FavoriteBookCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FavoriteBookCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [sample].[MembershipTypeDescriptor] --
CREATE TABLE [sample].[MembershipTypeDescriptor] (
    [MembershipTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [sample].[SchoolCTEProgramService] --
CREATE TABLE [sample].[SchoolCTEProgramService] (
    [SchoolId] [BIGINT] NOT NULL,
    [CIPCode] [NVARCHAR](120) NULL,
    [CTEProgramServiceDescriptorId] [INT] NOT NULL,
    [PrimaryIndicator] [BIT] NULL,
    [ServiceBeginDate] [DATE] NULL,
    [ServiceEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolCTEProgramService_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[SchoolCTEProgramService] ADD CONSTRAINT [SchoolCTEProgramService_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[SchoolDirectlyOwnedBus] --
CREATE TABLE [sample].[SchoolDirectlyOwnedBus] (
    [SchoolId] [BIGINT] NOT NULL,
    [DirectlyOwnedBusId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolDirectlyOwnedBus_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC,
        [DirectlyOwnedBusId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[SchoolDirectlyOwnedBus] ADD CONSTRAINT [SchoolDirectlyOwnedBus_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[SchoolExtension] --
CREATE TABLE [sample].[SchoolExtension] (
    [SchoolId] [BIGINT] NOT NULL,
    [IsExemplary] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StaffExtension] --
CREATE TABLE [sample].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [FirstPetOwnedDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffExtension_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StaffPet] --
CREATE TABLE [sample].[StaffPet] (
    [StaffUSI] [INT] NOT NULL,
    [PetName] [NVARCHAR](20) NOT NULL,
    [IsFixed] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffPet_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC,
        [PetName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StaffPet] ADD CONSTRAINT [StaffPet_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StaffPetPreference] --
CREATE TABLE [sample].[StaffPetPreference] (
    [StaffUSI] [INT] NOT NULL,
    [MaximumWeight] [INT] NOT NULL,
    [MinimumWeight] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffPetPreference_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StaffPetPreference] ADD CONSTRAINT [StaffPetPreference_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentAquaticPet] --
CREATE TABLE [sample].[StudentAquaticPet] (
    [StudentUSI] [INT] NOT NULL,
    [MimimumTankVolume] [INT] NOT NULL,
    [PetName] [NVARCHAR](20) NOT NULL,
    [IsFixed] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAquaticPet_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC,
        [MimimumTankVolume] ASC,
        [PetName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentAquaticPet] ADD CONSTRAINT [StudentAquaticPet_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociation] --
CREATE TABLE [sample].[StudentArtProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ArtPieces] [INT] NULL,
    [ExhibitDate] [DATE] NULL,
    [HoursPerDay] [DECIMAL](5, 2) NULL,
    [IdentificationCode] [NVARCHAR](60) NULL,
    [KilnReservation] [TIME](7) NULL,
    [KilnReservationLength] [NVARCHAR](30) NULL,
    [MasteredMediums] [DECIMAL](5, 4) NULL,
    [NumberOfDaysInAttendance] [DECIMAL](18, 4) NULL,
    [PortfolioPieces] [INT] NULL,
    [PrivateArtProgram] [BIT] NOT NULL,
    [ProgramFees] [MONEY] NULL,
    CONSTRAINT [StudentArtProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [sample].[StudentArtProgramAssociationArtMedium] --
CREATE TABLE [sample].[StudentArtProgramAssociationArtMedium] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ArtMediumDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationArtMedium_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC,
        [ArtMediumDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationArtMedium] ADD CONSTRAINT [StudentArtProgramAssociationArtMedium_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociationFavoriteBook] --
CREATE TABLE [sample].[StudentArtProgramAssociationFavoriteBook] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [BookTitle] [NVARCHAR](200) NULL,
    [FavoriteBookCategoryDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationFavoriteBook_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationFavoriteBook] ADD CONSTRAINT [StudentArtProgramAssociationFavoriteBook_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociationFavoriteBookArtMedium] --
CREATE TABLE [sample].[StudentArtProgramAssociationFavoriteBookArtMedium] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ArtMediumDescriptorId] [INT] NOT NULL,
    [ArtPieces] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationFavoriteBookArtMedium_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC,
        [ArtMediumDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationFavoriteBookArtMedium] ADD CONSTRAINT [StudentArtProgramAssociationFavoriteBookArtMedium_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociationPortfolioYears] --
CREATE TABLE [sample].[StudentArtProgramAssociationPortfolioYears] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PortfolioYears] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationPortfolioYears_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC,
        [PortfolioYears] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationPortfolioYears] ADD CONSTRAINT [StudentArtProgramAssociationPortfolioYears_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociationService] --
CREATE TABLE [sample].[StudentArtProgramAssociationService] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ServiceDescriptorId] [INT] NOT NULL,
    [PrimaryIndicator] [BIT] NULL,
    [ServiceBeginDate] [DATE] NULL,
    [ServiceEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationService_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC,
        [ServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationService] ADD CONSTRAINT [StudentArtProgramAssociationService_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentArtProgramAssociationStyle] --
CREATE TABLE [sample].[StudentArtProgramAssociationStyle] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Style] [NVARCHAR](50) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentArtProgramAssociationStyle_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC,
        [Style] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentArtProgramAssociationStyle] ADD CONSTRAINT [StudentArtProgramAssociationStyle_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationDiscipline] --
CREATE TABLE [sample].[StudentContactAssociationDiscipline] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisciplineDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationDiscipline_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC,
        [DisciplineDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationDiscipline] ADD CONSTRAINT [StudentContactAssociationDiscipline_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationExtension] --
CREATE TABLE [sample].[StudentContactAssociationExtension] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [BedtimeReader] [BIT] NOT NULL,
    [BedtimeReadingRate] [DECIMAL](5, 4) NULL,
    [BookBudget] [MONEY] NULL,
    [BooksBorrowed] [INT] NULL,
    [EducationOrganizationId] [BIGINT] NULL,
    [InterventionStudyIdentificationCode] [NVARCHAR](60) NULL,
    [LibraryDuration] [INT] NULL,
    [LibraryTime] [TIME](7) NULL,
    [LibraryVisits] [SMALLINT] NULL,
    [PriorContactRestrictions] [NVARCHAR](250) NULL,
    [ReadGreenEggsAndHamDate] [DATE] NULL,
    [ReadingTimeSpent] [NVARCHAR](30) NULL,
    [StudentRead] [SMALLINT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationExtension] ADD CONSTRAINT [StudentContactAssociationExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationFavoriteBookTitle] --
CREATE TABLE [sample].[StudentContactAssociationFavoriteBookTitle] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FavoriteBookTitle] [NVARCHAR](100) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationFavoriteBookTitle_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC,
        [FavoriteBookTitle] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationFavoriteBookTitle] ADD CONSTRAINT [StudentContactAssociationFavoriteBookTitle_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationHoursPerWeek] --
CREATE TABLE [sample].[StudentContactAssociationHoursPerWeek] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [HoursPerWeek] [DECIMAL](5, 2) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationHoursPerWeek_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC,
        [HoursPerWeek] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationHoursPerWeek] ADD CONSTRAINT [StudentContactAssociationHoursPerWeek_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationPagesRead] --
CREATE TABLE [sample].[StudentContactAssociationPagesRead] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PagesRead] [DECIMAL](18, 2) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationPagesRead_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC,
        [PagesRead] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationPagesRead] ADD CONSTRAINT [StudentContactAssociationPagesRead_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationStaffEducationOrganizationEmploymentAssociation] --
CREATE TABLE [sample].[StudentContactAssociationStaffEducationOrganizationEmploymentAssociation] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [EmploymentStatusDescriptorId] [INT] NOT NULL,
    [HireDate] [DATE] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationStaffEducationOrganizationEmploymentAssociation_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC,
        [EducationOrganizationId] ASC,
        [EmploymentStatusDescriptorId] ASC,
        [HireDate] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationStaffEducationOrganizationEmploymentAssociation] ADD CONSTRAINT [StudentContactAssociationStaffEducationOrganizationEmploymentAssociation_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentContactAssociationTelephone] --
CREATE TABLE [sample].[StudentContactAssociationTelephone] (
    [ContactUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [OrderOfPriority] [INT] NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentContactAssociationTelephone_PK] PRIMARY KEY CLUSTERED (
        [ContactUSI] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentContactAssociationTelephone] ADD CONSTRAINT [StudentContactAssociationTelephone_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentCTEProgramAssociationExtension] --
CREATE TABLE [sample].[StudentCTEProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AnalysisCompleted] [BIT] NULL,
    [AnalysisDate] [DATETIME2](7) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentCTEProgramAssociationExtension] ADD CONSTRAINT [StudentCTEProgramAssociationExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentEducationOrganizationAssociationAddressExtension] --
CREATE TABLE [sample].[StudentEducationOrganizationAssociationAddressExtension] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [OnBusRoute] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationAddressExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentEducationOrganizationAssociationAddressSchoolDistrict] --
CREATE TABLE [sample].[StudentEducationOrganizationAssociationAddressSchoolDistrict] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [SchoolDistrict] [NVARCHAR](250) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAddressSchoolDistrict_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [SchoolDistrict] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressSchoolDistrict] ADD CONSTRAINT [StudentEducationOrganizationAssociationAddressSchoolDistrict_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentEducationOrganizationAssociationAddressTerm] --
CREATE TABLE [sample].[StudentEducationOrganizationAssociationAddressTerm] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [City] [NVARCHAR](30) NOT NULL,
    [PostalCode] [NVARCHAR](17) NOT NULL,
    [StateAbbreviationDescriptorId] [INT] NOT NULL,
    [StreetNumberName] [NVARCHAR](150) NOT NULL,
    [TermDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAddressTerm_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [AddressTypeDescriptorId] ASC,
        [City] ASC,
        [PostalCode] ASC,
        [StateAbbreviationDescriptorId] ASC,
        [StreetNumberName] ASC,
        [TermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressTerm] ADD CONSTRAINT [StudentEducationOrganizationAssociationAddressTerm_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [sample].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FavoriteProgramName] [NVARCHAR](60) NULL,
    [FavoriteProgramTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed] --
CREATE TABLE [sample].[StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [StudentCharacteristicDescriptorId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [PrimaryStudentNeedIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [StudentCharacteristicDescriptorId] ASC,
        [BeginDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed] ADD CONSTRAINT [StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentFavoriteBook] --
CREATE TABLE [sample].[StudentFavoriteBook] (
    [StudentUSI] [INT] NOT NULL,
    [FavoriteBookCategoryDescriptorId] [INT] NOT NULL,
    [BookTitle] [NVARCHAR](200) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentFavoriteBook_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC,
        [FavoriteBookCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentFavoriteBook] ADD CONSTRAINT [StudentFavoriteBook_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentFavoriteBookArtMedium] --
CREATE TABLE [sample].[StudentFavoriteBookArtMedium] (
    [StudentUSI] [INT] NOT NULL,
    [FavoriteBookCategoryDescriptorId] [INT] NOT NULL,
    [ArtMediumDescriptorId] [INT] NOT NULL,
    [ArtPieces] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentFavoriteBookArtMedium_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC,
        [FavoriteBookCategoryDescriptorId] ASC,
        [ArtMediumDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentFavoriteBookArtMedium] ADD CONSTRAINT [StudentFavoriteBookArtMedium_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociation] --
CREATE TABLE [sample].[StudentGraduationPlanAssociation] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CommencementTime] [TIME](7) NULL,
    [EffectiveDate] [DATE] NOT NULL,
    [GraduationFee] [MONEY] NULL,
    [HighSchoolDuration] [NVARCHAR](30) NULL,
    [HoursPerWeek] [DECIMAL](5, 2) NOT NULL,
    [IsActivePlan] [BIT] NULL,
    [RequiredAttendance] [DECIMAL](5, 4) NULL,
    [StaffUSI] [INT] NULL,
    [TargetGPA] [DECIMAL](18, 4) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociation] ADD CONSTRAINT [StudentGraduationPlanAssociation_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociation] ADD CONSTRAINT [StudentGraduationPlanAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociation] ADD CONSTRAINT [StudentGraduationPlanAssociation_DF_LastModifiedDate] DEFAULT (getutcdate()) FOR [LastModifiedDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationAcademicSubject] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationAcademicSubject] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [AcademicSubjectDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationAcademicSubject] ADD CONSTRAINT [StudentGraduationPlanAssociationAcademicSubject_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationCareerPathwayCode] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationCareerPathwayCode] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CareerPathwayCode] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationCareerPathwayCode_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [CareerPathwayCode] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationCareerPathwayCode] ADD CONSTRAINT [StudentGraduationPlanAssociationCareerPathwayCode_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationCTEProgramService] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationCTEProgramService] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CIPCode] [NVARCHAR](120) NULL,
    [CTEProgramServiceDescriptorId] [INT] NOT NULL,
    [PrimaryIndicator] [BIT] NULL,
    [ServiceBeginDate] [DATE] NULL,
    [ServiceEndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationCTEProgramService_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationCTEProgramService] ADD CONSTRAINT [StudentGraduationPlanAssociationCTEProgramService_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationDescription] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationDescription] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Description] [NVARCHAR](1024) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationDescription_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [Description] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationDescription] ADD CONSTRAINT [StudentGraduationPlanAssociationDescription_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationDesignatedBy] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationDesignatedBy] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DesignatedBy] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationDesignatedBy_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [DesignatedBy] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationDesignatedBy] ADD CONSTRAINT [StudentGraduationPlanAssociationDesignatedBy_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationIndustryCredential] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationIndustryCredential] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [IndustryCredential] [NVARCHAR](100) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationIndustryCredential_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [IndustryCredential] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationIndustryCredential] ADD CONSTRAINT [StudentGraduationPlanAssociationIndustryCredential_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationStudentContactAssociation] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationStudentContactAssociation] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ContactUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationStudentContactAssociation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [ContactUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationStudentContactAssociation] ADD CONSTRAINT [StudentGraduationPlanAssociationStudentContactAssociation_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentGraduationPlanAssociationYearsAttended] --
CREATE TABLE [sample].[StudentGraduationPlanAssociationYearsAttended] (
    [EducationOrganizationId] [BIGINT] NOT NULL,
    [GraduationPlanTypeDescriptorId] [INT] NOT NULL,
    [GraduationSchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [YearsAttended] [SMALLINT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentGraduationPlanAssociationYearsAttended_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [GraduationPlanTypeDescriptorId] ASC,
        [GraduationSchoolYear] ASC,
        [StudentUSI] ASC,
        [YearsAttended] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentGraduationPlanAssociationYearsAttended] ADD CONSTRAINT [StudentGraduationPlanAssociationYearsAttended_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentPet] --
CREATE TABLE [sample].[StudentPet] (
    [StudentUSI] [INT] NOT NULL,
    [PetName] [NVARCHAR](20) NOT NULL,
    [IsFixed] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentPet_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC,
        [PetName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentPet] ADD CONSTRAINT [StudentPet_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentPetPreference] --
CREATE TABLE [sample].[StudentPetPreference] (
    [StudentUSI] [INT] NOT NULL,
    [MaximumWeight] [INT] NOT NULL,
    [MinimumWeight] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentPetPreference_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentPetPreference] ADD CONSTRAINT [StudentPetPreference_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentSchoolAssociationExtension] --
CREATE TABLE [sample].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [BIGINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [MembershipTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

-- Table [sample].[StudentSectionAssociationRelatedGeneralStudentProgramAssociation] --
CREATE TABLE [sample].[StudentSectionAssociationRelatedGeneralStudentProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [BIGINT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [RelatedBeginDate] [DATE] NOT NULL,
    [RelatedEducationOrganizationId] [BIGINT] NOT NULL,
    [RelatedProgramEducationOrganizationId] [BIGINT] NOT NULL,
    [RelatedProgramName] [NVARCHAR](60) NOT NULL,
    [RelatedProgramTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationRelatedGeneralStudentProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC,
        [RelatedBeginDate] ASC,
        [RelatedEducationOrganizationId] ASC,
        [RelatedProgramEducationOrganizationId] ASC,
        [RelatedProgramName] ASC,
        [RelatedProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sample].[StudentSectionAssociationRelatedGeneralStudentProgramAssociation] ADD CONSTRAINT [StudentSectionAssociationRelatedGeneralStudentProgramAssociation_DF_CreateDate] DEFAULT (getutcdate()) FOR [CreateDate]
GO

