-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [sample].[ArtMediumDescriptor] WITH CHECK ADD CONSTRAINT [FK_ArtMediumDescriptor_Descriptor] FOREIGN KEY ([ArtMediumDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRoute] WITH CHECK ADD CONSTRAINT [FK_BusRoute_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

ALTER TABLE [sample].[BusRoute] WITH CHECK ADD CONSTRAINT [FK_BusRoute_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
GO

ALTER TABLE [sample].[BusRouteBusYear] WITH CHECK ADD CONSTRAINT [FK_BusRouteBusYear_BusRoute] FOREIGN KEY ([BusId], [BusRouteNumber])
REFERENCES [sample].[BusRoute] ([BusId], [BusRouteNumber])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRouteProgram] WITH CHECK ADD CONSTRAINT [FK_BusRouteProgram_BusRoute] FOREIGN KEY ([BusId], [BusRouteNumber])
REFERENCES [sample].[BusRoute] ([BusId], [BusRouteNumber])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRouteProgram] WITH CHECK ADD CONSTRAINT [FK_BusRouteProgram_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
GO

ALTER TABLE [sample].[BusRouteServiceAreaPostalCode] WITH CHECK ADD CONSTRAINT [FK_BusRouteServiceAreaPostalCode_BusRoute] FOREIGN KEY ([BusId], [BusRouteNumber])
REFERENCES [sample].[BusRoute] ([BusId], [BusRouteNumber])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRouteStartTime] WITH CHECK ADD CONSTRAINT [FK_BusRouteStartTime_BusRoute] FOREIGN KEY ([BusId], [BusRouteNumber])
REFERENCES [sample].[BusRoute] ([BusId], [BusRouteNumber])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRouteTelephone] WITH CHECK ADD CONSTRAINT [FK_BusRouteTelephone_BusRoute] FOREIGN KEY ([BusId], [BusRouteNumber])
REFERENCES [sample].[BusRoute] ([BusId], [BusRouteNumber])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[BusRouteTelephone] WITH CHECK ADD CONSTRAINT [FK_BusRouteTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

ALTER TABLE [sample].[ContactAddressExtension] WITH CHECK ADD CONSTRAINT [FK_ContactAddressExtension_ContactAddress] FOREIGN KEY ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[ContactAddress] ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactAddressSchoolDistrict] WITH CHECK ADD CONSTRAINT [FK_ContactAddressSchoolDistrict_ContactAddress] FOREIGN KEY ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[ContactAddress] ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactAddressTerm] WITH CHECK ADD CONSTRAINT [FK_ContactAddressTerm_ContactAddress] FOREIGN KEY ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[ContactAddress] ([ContactUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactAddressTerm] WITH CHECK ADD CONSTRAINT [FK_ContactAddressTerm_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

ALTER TABLE [sample].[ContactAuthor] WITH CHECK ADD CONSTRAINT [FK_ContactAuthor_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactCeilingHeight] WITH CHECK ADD CONSTRAINT [FK_ContactCeilingHeight_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactCTEProgram] WITH CHECK ADD CONSTRAINT [FK_ContactCTEProgram_CareerPathwayDescriptor] FOREIGN KEY ([CareerPathwayDescriptorId])
REFERENCES [edfi].[CareerPathwayDescriptor] ([CareerPathwayDescriptorId])
GO

ALTER TABLE [sample].[ContactCTEProgram] WITH CHECK ADD CONSTRAINT [FK_ContactCTEProgram_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactEducationContent] WITH CHECK ADD CONSTRAINT [FK_ContactEducationContent_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactEducationContent] WITH CHECK ADD CONSTRAINT [FK_ContactEducationContent_EducationContent] FOREIGN KEY ([ContentIdentifier])
REFERENCES [edfi].[EducationContent] ([ContentIdentifier])
GO

ALTER TABLE [sample].[ContactExtension] WITH CHECK ADD CONSTRAINT [FK_ContactExtension_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactExtension] WITH CHECK ADD CONSTRAINT [FK_ContactExtension_CredentialFieldDescriptor] FOREIGN KEY ([CredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

ALTER TABLE [sample].[ContactFavoriteBookTitle] WITH CHECK ADD CONSTRAINT [FK_ContactFavoriteBookTitle_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactStudentProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_ContactStudentProgramAssociation_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[ContactStudentProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_ContactStudentProgramAssociation_StudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
GO

ALTER TABLE [sample].[ContactTeacherConference] WITH CHECK ADD CONSTRAINT [FK_ContactTeacherConference_Contact] FOREIGN KEY ([ContactUSI])
REFERENCES [edfi].[Contact] ([ContactUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[FavoriteBookCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_FavoriteBookCategoryDescriptor_Descriptor] FOREIGN KEY ([FavoriteBookCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[MembershipTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipTypeDescriptor_Descriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[SchoolCTEProgram] WITH CHECK ADD CONSTRAINT [FK_SchoolCTEProgram_CareerPathwayDescriptor] FOREIGN KEY ([CareerPathwayDescriptorId])
REFERENCES [edfi].[CareerPathwayDescriptor] ([CareerPathwayDescriptorId])
GO

ALTER TABLE [sample].[SchoolCTEProgram] WITH CHECK ADD CONSTRAINT [FK_SchoolCTEProgram_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[SchoolDirectlyOwnedBus] WITH CHECK ADD CONSTRAINT [FK_SchoolDirectlyOwnedBus_Bus] FOREIGN KEY ([DirectlyOwnedBusId])
REFERENCES [sample].[Bus] ([BusId])
GO

ALTER TABLE [sample].[SchoolDirectlyOwnedBus] WITH CHECK ADD CONSTRAINT [FK_SchoolDirectlyOwnedBus_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StaffPet] WITH CHECK ADD CONSTRAINT [FK_StaffPet_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StaffPetPreference] WITH CHECK ADD CONSTRAINT [FK_StaffPetPreference_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentAquaticPet] WITH CHECK ADD CONSTRAINT [FK_StudentAquaticPet_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentArtProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentArtProgramAssociationArtMedium] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationArtMedium_ArtMediumDescriptor] FOREIGN KEY ([ArtMediumDescriptorId])
REFERENCES [sample].[ArtMediumDescriptor] ([ArtMediumDescriptorId])
GO

ALTER TABLE [sample].[StudentArtProgramAssociationArtMedium] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationArtMedium_StudentArtProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [sample].[StudentArtProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentArtProgramAssociationPortfolioYears] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationPortfolioYears_StudentArtProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [sample].[StudentArtProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentArtProgramAssociationService] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationService_ServiceDescriptor] FOREIGN KEY ([ServiceDescriptorId])
REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
GO

ALTER TABLE [sample].[StudentArtProgramAssociationService] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationService_StudentArtProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [sample].[StudentArtProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentArtProgramAssociationStyle] WITH CHECK ADD CONSTRAINT [FK_StudentArtProgramAssociationStyle_StudentArtProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [sample].[StudentArtProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationDiscipline] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationDiscipline_DisciplineDescriptor] FOREIGN KEY ([DisciplineDescriptorId])
REFERENCES [edfi].[DisciplineDescriptor] ([DisciplineDescriptorId])
GO

ALTER TABLE [sample].[StudentContactAssociationDiscipline] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationDiscipline_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationExtension_InterventionStudy] FOREIGN KEY ([EducationOrganizationId], [InterventionStudyIdentificationCode])
REFERENCES [edfi].[InterventionStudy] ([EducationOrganizationId], [InterventionStudyIdentificationCode])
GO

ALTER TABLE [sample].[StudentContactAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationExtension_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationFavoriteBookTitle] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationFavoriteBookTitle_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationHoursPerWeek] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationHoursPerWeek_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationPagesRead] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationPagesRead_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationStaffEducationOrganizationEmploymentAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationStaffEducationOrganizationEmploymentAssociation_StaffEducationOrganizationEmploymentAssociation] FOREIGN KEY ([EducationOrganizationId], [EmploymentStatusDescriptorId], [HireDate], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationEmploymentAssociation] ([EducationOrganizationId], [EmploymentStatusDescriptorId], [HireDate], [StaffUSI])
GO

ALTER TABLE [sample].[StudentContactAssociationStaffEducationOrganizationEmploymentAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationStaffEducationOrganizationEmploymentAssociation_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationTelephone] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationTelephone_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentContactAssociationTelephone] WITH CHECK ADD CONSTRAINT [FK_StudentContactAssociationTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

ALTER TABLE [sample].[StudentCTEProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationExtension_StudentCTEProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressExtension_StudentEducationOrganizationAssociationAddress] FOREIGN KEY ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[StudentEducationOrganizationAssociationAddress] ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressSchoolDistrict] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressSchoolDistrict_StudentEducationOrganizationAssociationAddress] FOREIGN KEY ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[StudentEducationOrganizationAssociationAddress] ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressTerm] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressTerm_StudentEducationOrganizationAssociationAddress] FOREIGN KEY ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [edfi].[StudentEducationOrganizationAssociationAddress] ([EducationOrganizationId], [StudentUSI], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentEducationOrganizationAssociationAddressTerm] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressTerm_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

ALTER TABLE [sample].[StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCharacteristicStudentNeed_StudentEducationOrganizationAssociationStudentCharact] FOREIGN KEY ([EducationOrganizationId], [StudentUSI], [StudentCharacteristicDescriptorId])
REFERENCES [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] ([EducationOrganizationId], [StudentUSI], [StudentCharacteristicDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentFavoriteBook] WITH CHECK ADD CONSTRAINT [FK_StudentFavoriteBook_FavoriteBookCategoryDescriptor] FOREIGN KEY ([FavoriteBookCategoryDescriptorId])
REFERENCES [sample].[FavoriteBookCategoryDescriptor] ([FavoriteBookCategoryDescriptorId])
GO

ALTER TABLE [sample].[StudentFavoriteBook] WITH CHECK ADD CONSTRAINT [FK_StudentFavoriteBook_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentFavoriteBookArtMedium] WITH CHECK ADD CONSTRAINT [FK_StudentFavoriteBookArtMedium_ArtMediumDescriptor] FOREIGN KEY ([ArtMediumDescriptorId])
REFERENCES [sample].[ArtMediumDescriptor] ([ArtMediumDescriptorId])
GO

ALTER TABLE [sample].[StudentFavoriteBookArtMedium] WITH CHECK ADD CONSTRAINT [FK_StudentFavoriteBookArtMedium_StudentFavoriteBook] FOREIGN KEY ([StudentUSI], [FavoriteBookCategoryDescriptorId])
REFERENCES [sample].[StudentFavoriteBook] ([StudentUSI], [FavoriteBookCategoryDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociation_GraduationPlan] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear])
REFERENCES [edfi].[GraduationPlan] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociation_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociation_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationAcademicSubject_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationCareerPathwayCode] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationCareerPathwayCode_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationCTEProgram] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationCTEProgram_CareerPathwayDescriptor] FOREIGN KEY ([CareerPathwayDescriptorId])
REFERENCES [edfi].[CareerPathwayDescriptor] ([CareerPathwayDescriptorId])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationCTEProgram] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationCTEProgram_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationDescription] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationDescription_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationDesignatedBy] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationDesignatedBy_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationIndustryCredential] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationIndustryCredential_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationStudentContactAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationStudentContactAssociation_StudentContactAssociation] FOREIGN KEY ([ContactUSI], [StudentUSI])
REFERENCES [edfi].[StudentContactAssociation] ([ContactUSI], [StudentUSI])
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationStudentContactAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationStudentContactAssociation_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentGraduationPlanAssociationYearsAttended] WITH CHECK ADD CONSTRAINT [FK_StudentGraduationPlanAssociationYearsAttended_StudentGraduationPlanAssociation] FOREIGN KEY ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
REFERENCES [sample].[StudentGraduationPlanAssociation] ([EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentPet] WITH CHECK ADD CONSTRAINT [FK_StudentPet_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentPetPreference] WITH CHECK ADD CONSTRAINT [FK_StudentPetPreference_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [sample].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_MembershipTypeDescriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [sample].[MembershipTypeDescriptor] ([MembershipTypeDescriptorId])
GO

ALTER TABLE [sample].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [sample].[StudentSectionAssociationRelatedGeneralStudentProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationRelatedGeneralStudentProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([RelatedBeginDate], [RelatedEducationOrganizationId], [RelatedProgramEducationOrganizationId], [RelatedProgramName], [RelatedProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
GO

ALTER TABLE [sample].[StudentSectionAssociationRelatedGeneralStudentProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationRelatedGeneralStudentProgramAssociation_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

