-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE sample.ArtMediumDescriptor ADD CONSTRAINT FK_a8902f_Descriptor FOREIGN KEY (ArtMediumDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRoute ADD CONSTRAINT FK_65385a_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorId)
REFERENCES edfi.DisabilityDescriptor (DisabilityDescriptorId)
;

ALTER TABLE sample.BusRoute ADD CONSTRAINT FK_65385a_StaffEducationOrganizationAssignmentAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationAssignmentAssociation (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
;

ALTER TABLE sample.BusRouteBusYear ADD CONSTRAINT FK_61b709_BusRoute FOREIGN KEY (BusId, BusRouteNumber)
REFERENCES sample.BusRoute (BusId, BusRouteNumber)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRouteProgram ADD CONSTRAINT FK_bcf259_BusRoute FOREIGN KEY (BusId, BusRouteNumber)
REFERENCES sample.BusRoute (BusId, BusRouteNumber)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRouteProgram ADD CONSTRAINT FK_bcf259_Program FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES edfi.Program (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
;

ALTER TABLE sample.BusRouteServiceAreaPostalCode ADD CONSTRAINT FK_71fc1e_BusRoute FOREIGN KEY (BusId, BusRouteNumber)
REFERENCES sample.BusRoute (BusId, BusRouteNumber)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRouteStartTime ADD CONSTRAINT FK_7c158e_BusRoute FOREIGN KEY (BusId, BusRouteNumber)
REFERENCES sample.BusRoute (BusId, BusRouteNumber)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRouteTelephone ADD CONSTRAINT FK_d9d35b_BusRoute FOREIGN KEY (BusId, BusRouteNumber)
REFERENCES sample.BusRoute (BusId, BusRouteNumber)
ON DELETE CASCADE
;

ALTER TABLE sample.BusRouteTelephone ADD CONSTRAINT FK_d9d35b_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorId)
REFERENCES edfi.TelephoneNumberTypeDescriptor (TelephoneNumberTypeDescriptorId)
;

ALTER TABLE sample.ContactAddressExtension ADD CONSTRAINT FK_f38b55_ContactAddress FOREIGN KEY (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.ContactAddress (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactAddressSchoolDistrict ADD CONSTRAINT FK_3ee07d_ContactAddress FOREIGN KEY (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.ContactAddress (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactAddressTerm ADD CONSTRAINT FK_c974f1_ContactAddress FOREIGN KEY (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.ContactAddress (ContactUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactAddressTerm ADD CONSTRAINT FK_c974f1_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

ALTER TABLE sample.ContactAuthor ADD CONSTRAINT FK_5f4d9a_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactCeilingHeight ADD CONSTRAINT FK_3236f2_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactCTEProgram ADD CONSTRAINT FK_17ab0b_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorId)
REFERENCES edfi.CareerPathwayDescriptor (CareerPathwayDescriptorId)
;

ALTER TABLE sample.ContactCTEProgram ADD CONSTRAINT FK_17ab0b_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactEducationContent ADD CONSTRAINT FK_c25b99_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactEducationContent ADD CONSTRAINT FK_c25b99_EducationContent FOREIGN KEY (ContentIdentifier)
REFERENCES edfi.EducationContent (ContentIdentifier)
;

ALTER TABLE sample.ContactExtension ADD CONSTRAINT FK_9fdf40_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactExtension ADD CONSTRAINT FK_9fdf40_CredentialFieldDescriptor FOREIGN KEY (CredentialFieldDescriptorId)
REFERENCES edfi.CredentialFieldDescriptor (CredentialFieldDescriptorId)
;

ALTER TABLE sample.ContactFavoriteBookTitle ADD CONSTRAINT FK_1be879_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactStudentProgramAssociation ADD CONSTRAINT FK_2c63b6_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.ContactStudentProgramAssociation ADD CONSTRAINT FK_2c63b6_StudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
;

ALTER TABLE sample.ContactTeacherConference ADD CONSTRAINT FK_ad1f57_Contact FOREIGN KEY (ContactUSI)
REFERENCES edfi.Contact (ContactUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.FavoriteBookCategoryDescriptor ADD CONSTRAINT FK_42666e_Descriptor FOREIGN KEY (FavoriteBookCategoryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sample.MembershipTypeDescriptor ADD CONSTRAINT FK_2cdcc2_Descriptor FOREIGN KEY (MembershipTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sample.SchoolCTEProgram ADD CONSTRAINT FK_7ba98a_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorId)
REFERENCES edfi.CareerPathwayDescriptor (CareerPathwayDescriptorId)
;

ALTER TABLE sample.SchoolCTEProgram ADD CONSTRAINT FK_7ba98a_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE sample.SchoolDirectlyOwnedBus ADD CONSTRAINT FK_4edefb_Bus FOREIGN KEY (DirectlyOwnedBusId)
REFERENCES sample.Bus (BusId)
;

ALTER TABLE sample.SchoolDirectlyOwnedBus ADD CONSTRAINT FK_4edefb_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE sample.SchoolExtension ADD CONSTRAINT FK_2199be_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE sample.StaffExtension ADD CONSTRAINT FK_d7b81a_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StaffPet ADD CONSTRAINT FK_e40bbd_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StaffPetPreference ADD CONSTRAINT FK_c50bc3_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentAquaticPet ADD CONSTRAINT FK_094617_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentArtProgramAssociation ADD CONSTRAINT FK_c468eb_GeneralStudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.GeneralStudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentArtProgramAssociationArtMedium ADD CONSTRAINT FK_f6ca63_ArtMediumDescriptor FOREIGN KEY (ArtMediumDescriptorId)
REFERENCES sample.ArtMediumDescriptor (ArtMediumDescriptorId)
;

ALTER TABLE sample.StudentArtProgramAssociationArtMedium ADD CONSTRAINT FK_f6ca63_StudentArtProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES sample.StudentArtProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentArtProgramAssociationPortfolioYears ADD CONSTRAINT FK_cb082b_StudentArtProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES sample.StudentArtProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentArtProgramAssociationService ADD CONSTRAINT FK_8141ae_ServiceDescriptor FOREIGN KEY (ServiceDescriptorId)
REFERENCES edfi.ServiceDescriptor (ServiceDescriptorId)
;

ALTER TABLE sample.StudentArtProgramAssociationService ADD CONSTRAINT FK_8141ae_StudentArtProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES sample.StudentArtProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentArtProgramAssociationStyle ADD CONSTRAINT FK_258568_StudentArtProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES sample.StudentArtProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationDiscipline ADD CONSTRAINT FK_3f8f4a_DisciplineDescriptor FOREIGN KEY (DisciplineDescriptorId)
REFERENCES edfi.DisciplineDescriptor (DisciplineDescriptorId)
;

ALTER TABLE sample.StudentContactAssociationDiscipline ADD CONSTRAINT FK_3f8f4a_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationExtension ADD CONSTRAINT FK_c098c4_InterventionStudy FOREIGN KEY (EducationOrganizationId, InterventionStudyIdentificationCode)
REFERENCES edfi.InterventionStudy (EducationOrganizationId, InterventionStudyIdentificationCode)
;

ALTER TABLE sample.StudentContactAssociationExtension ADD CONSTRAINT FK_c098c4_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationFavoriteBookTitle ADD CONSTRAINT FK_a3668c_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationHoursPerWeek ADD CONSTRAINT FK_c59fbb_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationPagesRead ADD CONSTRAINT FK_1a5c05_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationStaffEducationOrganizationEmplo_a92b1d ADD CONSTRAINT FK_a92b1d_StaffEducationOrganizationEmploymentAssociation FOREIGN KEY (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationEmploymentAssociation (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
;

ALTER TABLE sample.StudentContactAssociationStaffEducationOrganizationEmplo_a92b1d ADD CONSTRAINT FK_a92b1d_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationTelephone ADD CONSTRAINT FK_264afd_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentContactAssociationTelephone ADD CONSTRAINT FK_264afd_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorId)
REFERENCES edfi.TelephoneNumberTypeDescriptor (TelephoneNumberTypeDescriptorId)
;

ALTER TABLE sample.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_StudentCTEProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentCTEProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentEducationOrganizationAssociationAddressExtension ADD CONSTRAINT FK_c905b3_StudentEducationOrganizationAssociationAddress FOREIGN KEY (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.StudentEducationOrganizationAssociationAddress (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentEducationOrganizationAssociationAddressSchoolDistrict ADD CONSTRAINT FK_450d64_StudentEducationOrganizationAssociationAddress FOREIGN KEY (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.StudentEducationOrganizationAssociationAddress (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentEducationOrganizationAssociationAddressTerm ADD CONSTRAINT FK_98438b_StudentEducationOrganizationAssociationAddress FOREIGN KEY (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
REFERENCES edfi.StudentEducationOrganizationAssociationAddress (EducationOrganizationId, StudentUSI, AddressTypeDescriptorId, City, PostalCode, StateAbbreviationDescriptorId, StreetNumberName)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentEducationOrganizationAssociationAddressTerm ADD CONSTRAINT FK_98438b_TermDescriptor FOREIGN KEY (TermDescriptorId)
REFERENCES edfi.TermDescriptor (TermDescriptorId)
;

ALTER TABLE sample.StudentEducationOrganizationAssociationStudentCharacteri_17d152 ADD CONSTRAINT FK_17d152_StudentEducationOrganizationAssociationStudentCharacteristic FOREIGN KEY (EducationOrganizationId, StudentUSI, StudentCharacteristicDescriptorId)
REFERENCES edfi.StudentEducationOrganizationAssociationStudentCharacteristic (EducationOrganizationId, StudentUSI, StudentCharacteristicDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentFavoriteBook ADD CONSTRAINT FK_172e5d_FavoriteBookCategoryDescriptor FOREIGN KEY (FavoriteBookCategoryDescriptorId)
REFERENCES sample.FavoriteBookCategoryDescriptor (FavoriteBookCategoryDescriptorId)
;

ALTER TABLE sample.StudentFavoriteBook ADD CONSTRAINT FK_172e5d_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentFavoriteBookArtMedium ADD CONSTRAINT FK_458888_ArtMediumDescriptor FOREIGN KEY (ArtMediumDescriptorId)
REFERENCES sample.ArtMediumDescriptor (ArtMediumDescriptorId)
;

ALTER TABLE sample.StudentFavoriteBookArtMedium ADD CONSTRAINT FK_458888_StudentFavoriteBook FOREIGN KEY (StudentUSI, FavoriteBookCategoryDescriptorId)
REFERENCES sample.StudentFavoriteBook (StudentUSI, FavoriteBookCategoryDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociation ADD CONSTRAINT FK_5fe843_GraduationPlan FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear)
REFERENCES edfi.GraduationPlan (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear)
;

ALTER TABLE sample.StudentGraduationPlanAssociation ADD CONSTRAINT FK_5fe843_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
;

ALTER TABLE sample.StudentGraduationPlanAssociation ADD CONSTRAINT FK_5fe843_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

ALTER TABLE sample.StudentGraduationPlanAssociationAcademicSubject ADD CONSTRAINT FK_7ec6d6_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorId)
REFERENCES edfi.AcademicSubjectDescriptor (AcademicSubjectDescriptorId)
;

ALTER TABLE sample.StudentGraduationPlanAssociationAcademicSubject ADD CONSTRAINT FK_7ec6d6_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationCareerPathwayCode ADD CONSTRAINT FK_be4497_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationCTEProgram ADD CONSTRAINT FK_4d6493_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorId)
REFERENCES edfi.CareerPathwayDescriptor (CareerPathwayDescriptorId)
;

ALTER TABLE sample.StudentGraduationPlanAssociationCTEProgram ADD CONSTRAINT FK_4d6493_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationDescription ADD CONSTRAINT FK_bd1aca_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationDesignatedBy ADD CONSTRAINT FK_a608d1_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationIndustryCredential ADD CONSTRAINT FK_40e7ea_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationStudentContactAssociation ADD CONSTRAINT FK_1475b9_StudentContactAssociation FOREIGN KEY (ContactUSI, StudentUSI)
REFERENCES edfi.StudentContactAssociation (ContactUSI, StudentUSI)
;

ALTER TABLE sample.StudentGraduationPlanAssociationStudentContactAssociation ADD CONSTRAINT FK_1475b9_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentGraduationPlanAssociationYearsAttended ADD CONSTRAINT FK_0cf4e1_StudentGraduationPlanAssociation FOREIGN KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
REFERENCES sample.StudentGraduationPlanAssociation (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentPet ADD CONSTRAINT FK_21f4e6_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentPetPreference ADD CONSTRAINT FK_cf8624_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE sample.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_MembershipTypeDescriptor FOREIGN KEY (MembershipTypeDescriptorId)
REFERENCES sample.MembershipTypeDescriptor (MembershipTypeDescriptorId)
;

ALTER TABLE sample.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE sample.StudentSectionAssociationRelatedGeneralStudentProgramAss_c72e02 ADD CONSTRAINT FK_c72e02_GeneralStudentProgramAssociation FOREIGN KEY (RelatedBeginDate, RelatedEducationOrganizationId, RelatedProgramEducationOrganizationId, RelatedProgramName, RelatedProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.GeneralStudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
;

ALTER TABLE sample.StudentSectionAssociationRelatedGeneralStudentProgramAss_c72e02 ADD CONSTRAINT FK_c72e02_StudentSectionAssociation FOREIGN KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentSectionAssociation (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

