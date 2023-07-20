-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE [tpdm].[AccreditationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_AccreditationStatusDescriptor_Descriptor] FOREIGN KEY ([AccreditationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[AidTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_AidTypeDescriptor_Descriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_EnglishLanguageExamDescriptor] FOREIGN KEY ([EnglishLanguageExamDescriptorId])
REFERENCES [tpdm].[EnglishLanguageExamDescriptor] ([EnglishLanguageExamDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_GenderDescriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [tpdm].[GenderDescriptor] ([GenderDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_LimitedEnglishProficiencyDescriptor] FOREIGN KEY ([LimitedEnglishProficiencyDescriptorId])
REFERENCES [edfi].[LimitedEnglishProficiencyDescriptor] ([LimitedEnglishProficiencyDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_SexDescriptor] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_SexDescriptor1] FOREIGN KEY ([BirthSexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

ALTER TABLE [tpdm].[Candidate] WITH CHECK ADD CONSTRAINT [FK_Candidate_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateAddress] WITH CHECK ADD CONSTRAINT [FK_CandidateAddress_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateAddress] WITH CHECK ADD CONSTRAINT [FK_CandidateAddress_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateAddress] WITH CHECK ADD CONSTRAINT [FK_CandidateAddress_LocaleDescriptor] FOREIGN KEY ([LocaleDescriptorId])
REFERENCES [edfi].[LocaleDescriptor] ([LocaleDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateAddress] WITH CHECK ADD CONSTRAINT [FK_CandidateAddress_StateAbbreviationDescriptor] FOREIGN KEY ([StateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateAddressPeriod] WITH CHECK ADD CONSTRAINT [FK_CandidateAddressPeriod_CandidateAddress] FOREIGN KEY ([CandidateIdentifier], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
REFERENCES [tpdm].[CandidateAddress] ([CandidateIdentifier], [AddressTypeDescriptorId], [City], [PostalCode], [StateAbbreviationDescriptorId], [StreetNumberName])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateDisability] WITH CHECK ADD CONSTRAINT [FK_CandidateDisability_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateDisability] WITH CHECK ADD CONSTRAINT [FK_CandidateDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateDisability] WITH CHECK ADD CONSTRAINT [FK_CandidateDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId])
REFERENCES [edfi].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_CandidateDisabilityDesignation_CandidateDisability] FOREIGN KEY ([CandidateIdentifier], [DisabilityDescriptorId])
REFERENCES [tpdm].[CandidateDisability] ([CandidateIdentifier], [DisabilityDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateDisabilityDesignation] WITH CHECK ADD CONSTRAINT [FK_CandidateDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId])
REFERENCES [edfi].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociation_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociation_EducatorPreparationProgram] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[EducatorPreparationProgram] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociation_EPPProgramPathwayDescriptor] FOREIGN KEY ([EPPProgramPathwayDescriptorId])
REFERENCES [tpdm].[EPPProgramPathwayDescriptor] ([EPPProgramPathwayDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociation_ReasonExitedDescriptor] FOREIGN KEY ([ReasonExitedDescriptorId])
REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociationCohortYear] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociationCohortYear_CandidateEducatorPreparationProgramAssociation] FOREIGN KEY ([BeginDate], [CandidateIdentifier], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[CandidateEducatorPreparationProgramAssociation] ([BeginDate], [CandidateIdentifier], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociationCohortYear] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociationCohortYear_CohortYearTypeDescriptor] FOREIGN KEY ([CohortYearTypeDescriptorId])
REFERENCES [edfi].[CohortYearTypeDescriptor] ([CohortYearTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociationCohortYear] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociationCohortYear_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociationCohortYear] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociationCohortYear_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociationDegreeSpecialization] WITH CHECK ADD CONSTRAINT [FK_CandidateEducatorPreparationProgramAssociationDegreeSpecialization_CandidateEducatorPreparationProgramAssociation] FOREIGN KEY ([BeginDate], [CandidateIdentifier], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[CandidateEducatorPreparationProgramAssociation] ([BeginDate], [CandidateIdentifier], [EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateElectronicMail] WITH CHECK ADD CONSTRAINT [FK_CandidateElectronicMail_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateElectronicMail] WITH CHECK ADD CONSTRAINT [FK_CandidateElectronicMail_ElectronicMailTypeDescriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId])
REFERENCES [edfi].[ElectronicMailTypeDescriptor] ([ElectronicMailTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateLanguage] WITH CHECK ADD CONSTRAINT [FK_CandidateLanguage_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateLanguage] WITH CHECK ADD CONSTRAINT [FK_CandidateLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateLanguageUse] WITH CHECK ADD CONSTRAINT [FK_CandidateLanguageUse_CandidateLanguage] FOREIGN KEY ([CandidateIdentifier], [LanguageDescriptorId])
REFERENCES [tpdm].[CandidateLanguage] ([CandidateIdentifier], [LanguageDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateLanguageUse] WITH CHECK ADD CONSTRAINT [FK_CandidateLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId])
REFERENCES [edfi].[LanguageUseDescriptor] ([LanguageUseDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateOtherName] WITH CHECK ADD CONSTRAINT [FK_CandidateOtherName_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateOtherName] WITH CHECK ADD CONSTRAINT [FK_CandidateOtherName_OtherNameTypeDescriptor] FOREIGN KEY ([OtherNameTypeDescriptorId])
REFERENCES [edfi].[OtherNameTypeDescriptor] ([OtherNameTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_CandidatePersonalIdentificationDocument_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_CandidatePersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

ALTER TABLE [tpdm].[CandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_CandidatePersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

ALTER TABLE [tpdm].[CandidatePersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_CandidatePersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateRace] WITH CHECK ADD CONSTRAINT [FK_CandidateRace_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateRace] WITH CHECK ADD CONSTRAINT [FK_CandidateRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

ALTER TABLE [tpdm].[CandidateTelephone] WITH CHECK ADD CONSTRAINT [FK_CandidateTelephone_Candidate] FOREIGN KEY ([CandidateIdentifier])
REFERENCES [tpdm].[Candidate] ([CandidateIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CandidateTelephone] WITH CHECK ADD CONSTRAINT [FK_CandidateTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

ALTER TABLE [tpdm].[CertificationRouteDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificationRouteDescriptor_Descriptor] FOREIGN KEY ([CertificationRouteDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CoteachingStyleObservedDescriptor] WITH CHECK ADD CONSTRAINT [FK_CoteachingStyleObservedDescriptor_Descriptor] FOREIGN KEY ([CoteachingStyleObservedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_CertificationRouteDescriptor] FOREIGN KEY ([CertificationRouteDescriptorId])
REFERENCES [tpdm].[CertificationRouteDescriptor] ([CertificationRouteDescriptorId])
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_CredentialStatusDescriptor] FOREIGN KEY ([CredentialStatusDescriptorId])
REFERENCES [tpdm].[CredentialStatusDescriptor] ([CredentialStatusDescriptorId])
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_EducatorRoleDescriptor] FOREIGN KEY ([EducatorRoleDescriptorId])
REFERENCES [tpdm].[EducatorRoleDescriptor] ([EducatorRoleDescriptorId])
GO

ALTER TABLE [tpdm].[CredentialExtension] WITH CHECK ADD CONSTRAINT [FK_CredentialExtension_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[CredentialStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_CredentialStatusDescriptor_Descriptor] FOREIGN KEY ([CredentialStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_CredentialStudentAcademicRecord_Credential] FOREIGN KEY ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
REFERENCES [edfi].[Credential] ([CredentialIdentifier], [StateOfIssueStateAbbreviationDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[CredentialStudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_CredentialStudentAcademicRecord_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfi].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EducatorPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_EducatorPreparationProgram_AccreditationStatusDescriptor] FOREIGN KEY ([AccreditationStatusDescriptorId])
REFERENCES [tpdm].[AccreditationStatusDescriptor] ([AccreditationStatusDescriptorId])
GO

ALTER TABLE [tpdm].[EducatorPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_EducatorPreparationProgram_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

ALTER TABLE [tpdm].[EducatorPreparationProgram] WITH CHECK ADD CONSTRAINT [FK_EducatorPreparationProgram_ProgramTypeDescriptor] FOREIGN KEY ([ProgramTypeDescriptorId])
REFERENCES [edfi].[ProgramTypeDescriptor] ([ProgramTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EducatorPreparationProgramGradeLevel] WITH CHECK ADD CONSTRAINT [FK_EducatorPreparationProgramGradeLevel_EducatorPreparationProgram] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [tpdm].[EducatorPreparationProgram] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EducatorPreparationProgramGradeLevel] WITH CHECK ADD CONSTRAINT [FK_EducatorPreparationProgramGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EducatorRoleDescriptor] WITH CHECK ADD CONSTRAINT [FK_EducatorRoleDescriptor_Descriptor] FOREIGN KEY ([EducatorRoleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EnglishLanguageExamDescriptor] WITH CHECK ADD CONSTRAINT [FK_EnglishLanguageExamDescriptor_Descriptor] FOREIGN KEY ([EnglishLanguageExamDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EPPProgramPathwayDescriptor] WITH CHECK ADD CONSTRAINT [FK_EPPProgramPathwayDescriptor_Descriptor] FOREIGN KEY ([EPPProgramPathwayDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[Evaluation] WITH CHECK ADD CONSTRAINT [FK_Evaluation_EvaluationTypeDescriptor] FOREIGN KEY ([EvaluationTypeDescriptorId])
REFERENCES [tpdm].[EvaluationTypeDescriptor] ([EvaluationTypeDescriptorId])
GO

ALTER TABLE [tpdm].[Evaluation] WITH CHECK ADD CONSTRAINT [FK_Evaluation_PerformanceEvaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElement] WITH CHECK ADD CONSTRAINT [FK_EvaluationElement_EvaluationObjective] FOREIGN KEY ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationObjective] ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElement] WITH CHECK ADD CONSTRAINT [FK_EvaluationElement_EvaluationTypeDescriptor] FOREIGN KEY ([EvaluationTypeDescriptorId])
REFERENCES [tpdm].[EvaluationTypeDescriptor] ([EvaluationTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRating_EvaluationElement] FOREIGN KEY ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationElement] ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRating_EvaluationElementRatingLevelDescriptor] FOREIGN KEY ([EvaluationElementRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationElementRatingLevelDescriptor] ([EvaluationElementRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElementRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRating_EvaluationObjectiveRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationObjectiveRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElementRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRatingLevel_EvaluationElement] FOREIGN KEY ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationElement] ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationElementRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRatingLevel_EvaluationRatingLevelDescriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationRatingLevelDescriptor] ([EvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationElementRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRatingLevelDescriptor_Descriptor] FOREIGN KEY ([EvaluationElementRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationElementRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRatingResult_EvaluationElementRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationElementRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationElementRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationElementRatingResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjective] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjective_Evaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[Evaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjective] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjective_EvaluationTypeDescriptor] FOREIGN KEY ([EvaluationTypeDescriptorId])
REFERENCES [tpdm].[EvaluationTypeDescriptor] ([EvaluationTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRating_EvaluationObjective] FOREIGN KEY ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationObjective] ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRating_EvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRating_ObjectiveRatingLevelDescriptor] FOREIGN KEY ([ObjectiveRatingLevelDescriptorId])
REFERENCES [tpdm].[ObjectiveRatingLevelDescriptor] ([ObjectiveRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRatingLevel_EvaluationObjective] FOREIGN KEY ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationObjective] ([EducationOrganizationId], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRatingLevel_EvaluationRatingLevelDescriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationRatingLevelDescriptor] ([EvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRatingResult_EvaluationObjectiveRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationObjectiveRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationObjectiveRatingResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationPeriodDescriptor] WITH CHECK ADD CONSTRAINT [FK_EvaluationPeriodDescriptor_Descriptor] FOREIGN KEY ([EvaluationPeriodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationRating_Evaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[Evaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationRating_EvaluationRatingLevelDescriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationRatingLevelDescriptor] ([EvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationRating_EvaluationRatingStatusDescriptor] FOREIGN KEY ([EvaluationRatingStatusDescriptorId])
REFERENCES [tpdm].[EvaluationRatingStatusDescriptor] ([EvaluationRatingStatusDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationRating_PerformanceEvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluationRating] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRating] WITH CHECK ADD CONSTRAINT [FK_EvaluationRating_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingLevel_Evaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[Evaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingLevel] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingLevel_EvaluationRatingLevelDescriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationRatingLevelDescriptor] ([EvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingLevelDescriptor_Descriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingResult_EvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingResult] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRatingReviewer] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingReviewer_EvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationRating] ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingReviewer] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingReviewer_Person] FOREIGN KEY ([ReviewerPersonId], [ReviewerSourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[EvaluationRatingReviewerReceivedTraining] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingReviewerReceivedTraining_EvaluationRatingReviewer] FOREIGN KEY ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId], [FirstName], [LastSurname])
REFERENCES [tpdm].[EvaluationRatingReviewer] ([EducationOrganizationId], [EvaluationDate], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId], [FirstName], [LastSurname])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationRatingStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_EvaluationRatingStatusDescriptor_Descriptor] FOREIGN KEY ([EvaluationRatingStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[EvaluationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EvaluationTypeDescriptor_Descriptor] FOREIGN KEY ([EvaluationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[FinancialAid] WITH CHECK ADD CONSTRAINT [FK_FinancialAid_AidTypeDescriptor] FOREIGN KEY ([AidTypeDescriptorId])
REFERENCES [tpdm].[AidTypeDescriptor] ([AidTypeDescriptorId])
GO

ALTER TABLE [tpdm].[FinancialAid] WITH CHECK ADD CONSTRAINT [FK_FinancialAid_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

ALTER TABLE [tpdm].[GenderDescriptor] WITH CHECK ADD CONSTRAINT [FK_GenderDescriptor_Descriptor] FOREIGN KEY ([GenderDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[ObjectiveRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_ObjectiveRatingLevelDescriptor_Descriptor] FOREIGN KEY ([ObjectiveRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_EvaluationPeriodDescriptor] FOREIGN KEY ([EvaluationPeriodDescriptorId])
REFERENCES [tpdm].[EvaluationPeriodDescriptor] ([EvaluationPeriodDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_PerformanceEvaluationTypeDescriptor] FOREIGN KEY ([PerformanceEvaluationTypeDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluationTypeDescriptor] ([PerformanceEvaluationTypeDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluation_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationGradeLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationGradeLevel_PerformanceEvaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRating_CoteachingStyleObservedDescriptor] FOREIGN KEY ([CoteachingStyleObservedDescriptorId])
REFERENCES [tpdm].[CoteachingStyleObservedDescriptor] ([CoteachingStyleObservedDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRating_PerformanceEvaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRating_PerformanceEvaluationRatingLevelDescriptor] FOREIGN KEY ([PerformanceEvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluationRatingLevelDescriptor] ([PerformanceEvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRating] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRating_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingLevel_EvaluationRatingLevelDescriptor] FOREIGN KEY ([EvaluationRatingLevelDescriptorId])
REFERENCES [tpdm].[EvaluationRatingLevelDescriptor] ([EvaluationRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingLevel] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingLevel_PerformanceEvaluation] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluation] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingLevelDescriptor_Descriptor] FOREIGN KEY ([PerformanceEvaluationRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingResult] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingResult_PerformanceEvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluationRating] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingResult] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingResult_ResultDatatypeTypeDescriptor] FOREIGN KEY ([ResultDatatypeTypeDescriptorId])
REFERENCES [edfi].[ResultDatatypeTypeDescriptor] ([ResultDatatypeTypeDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingReviewer] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingReviewer_PerformanceEvaluationRating] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
REFERENCES [tpdm].[PerformanceEvaluationRating] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingReviewer] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingReviewer_Person] FOREIGN KEY ([ReviewerPersonId], [ReviewerSourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingReviewerReceivedTraining] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationRatingReviewerReceivedTraining_PerformanceEvaluationRatingReviewer] FOREIGN KEY ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId], [FirstName], [LastSurname])
REFERENCES [tpdm].[PerformanceEvaluationRatingReviewer] ([EducationOrganizationId], [EvaluationPeriodDescriptorId], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [PersonId], [SchoolYear], [SourceSystemDescriptorId], [TermDescriptorId], [FirstName], [LastSurname])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[PerformanceEvaluationTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PerformanceEvaluationTypeDescriptor_Descriptor] FOREIGN KEY ([PerformanceEvaluationTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[RubricDimension] WITH CHECK ADD CONSTRAINT [FK_RubricDimension_EvaluationElement] FOREIGN KEY ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
REFERENCES [tpdm].[EvaluationElement] ([EducationOrganizationId], [EvaluationElementTitle], [EvaluationObjectiveTitle], [EvaluationPeriodDescriptorId], [EvaluationTitle], [PerformanceEvaluationTitle], [PerformanceEvaluationTypeDescriptorId], [SchoolYear], [TermDescriptorId])
GO

ALTER TABLE [tpdm].[RubricDimension] WITH CHECK ADD CONSTRAINT [FK_RubricDimension_RubricRatingLevelDescriptor] FOREIGN KEY ([RubricRatingLevelDescriptorId])
REFERENCES [tpdm].[RubricRatingLevelDescriptor] ([RubricRatingLevelDescriptorId])
GO

ALTER TABLE [tpdm].[RubricRatingLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_RubricRatingLevelDescriptor_Descriptor] FOREIGN KEY ([RubricRatingLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_PostSecondaryInstitution] FOREIGN KEY ([PostSecondaryInstitutionId])
REFERENCES [edfi].[PostSecondaryInstitution] ([PostSecondaryInstitutionId])
GO

ALTER TABLE [tpdm].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SurveyResponseExtension] WITH CHECK ADD CONSTRAINT [FK_SurveyResponseExtension_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[SurveyResponseExtension] WITH CHECK ADD CONSTRAINT [FK_SurveyResponseExtension_SurveyResponse] FOREIGN KEY ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier])
REFERENCES [edfi].[SurveyResponse] ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier])
ON DELETE CASCADE
GO

ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] WITH CHECK ADD CONSTRAINT [FK_SurveyResponsePersonTargetAssociation_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] WITH CHECK ADD CONSTRAINT [FK_SurveyResponsePersonTargetAssociation_SurveyResponse] FOREIGN KEY ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier])
REFERENCES [edfi].[SurveyResponse] ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier])
GO

ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] WITH CHECK ADD CONSTRAINT [FK_SurveySectionResponsePersonTargetAssociation_Person] FOREIGN KEY ([PersonId], [SourceSystemDescriptorId])
REFERENCES [edfi].[Person] ([PersonId], [SourceSystemDescriptorId])
GO

ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] WITH CHECK ADD CONSTRAINT [FK_SurveySectionResponsePersonTargetAssociation_SurveySectionResponse] FOREIGN KEY ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier], [SurveySectionTitle])
REFERENCES [edfi].[SurveySectionResponse] ([Namespace], [SurveyIdentifier], [SurveyResponseIdentifier], [SurveySectionTitle])
GO

