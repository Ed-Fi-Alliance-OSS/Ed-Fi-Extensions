-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'tracked_changes_tpdm')
EXEC sys.sp_executesql N'CREATE SCHEMA [tracked_changes_tpdm]'
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[Candidate]'))
CREATE TABLE [tracked_changes_tpdm].[Candidate]
(
       OldCandidateIdentifier [NVARCHAR](32) NOT NULL,
       NewCandidateIdentifier [NVARCHAR](32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_Candidate PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[CandidateEducatorPreparationProgramAssociation]'))
CREATE TABLE [tracked_changes_tpdm].[CandidateEducatorPreparationProgramAssociation]
(
       OldBeginDate [DATE] NOT NULL,
       OldCandidateIdentifier [NVARCHAR](32) NOT NULL,
       OldEducationOrganizationId [INT] NOT NULL,
       OldProgramName [NVARCHAR](255) NOT NULL,
       OldProgramTypeDescriptorId [INT] NOT NULL,
       OldProgramTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldProgramTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewBeginDate [DATE] NULL,
       NewCandidateIdentifier [NVARCHAR](32) NULL,
       NewEducationOrganizationId [INT] NULL,
       NewProgramName [NVARCHAR](255) NULL,
       NewProgramTypeDescriptorId [INT] NULL,
       NewProgramTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewProgramTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_CandidateEducatorPreparationProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EducatorPreparationProgram]'))
CREATE TABLE [tracked_changes_tpdm].[EducatorPreparationProgram]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldProgramName [NVARCHAR](255) NOT NULL,
       OldProgramTypeDescriptorId [INT] NOT NULL,
       OldProgramTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldProgramTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewProgramName [NVARCHAR](255) NULL,
       NewProgramTypeDescriptorId [INT] NULL,
       NewProgramTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewProgramTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EducatorPreparationProgram PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[Evaluation]'))
CREATE TABLE [tracked_changes_tpdm].[Evaluation]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_Evaluation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EvaluationElement]'))
CREATE TABLE [tracked_changes_tpdm].[EvaluationElement]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationElementTitle [NVARCHAR](255) NOT NULL,
       OldEvaluationObjectiveTitle [NVARCHAR](50) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationElementTitle [NVARCHAR](255) NULL,
       NewEvaluationObjectiveTitle [NVARCHAR](50) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EvaluationElement PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EvaluationElementRating]'))
CREATE TABLE [tracked_changes_tpdm].[EvaluationElementRating]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationDate [DATETIME2](7) NOT NULL,
       OldEvaluationElementTitle [NVARCHAR](255) NOT NULL,
       OldEvaluationObjectiveTitle [NVARCHAR](50) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationDate [DATETIME2](7) NULL,
       NewEvaluationElementTitle [NVARCHAR](255) NULL,
       NewEvaluationObjectiveTitle [NVARCHAR](50) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EvaluationElementRating PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EvaluationObjective]'))
CREATE TABLE [tracked_changes_tpdm].[EvaluationObjective]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationObjectiveTitle [NVARCHAR](50) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationObjectiveTitle [NVARCHAR](50) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EvaluationObjective PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EvaluationObjectiveRating]'))
CREATE TABLE [tracked_changes_tpdm].[EvaluationObjectiveRating]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationDate [DATETIME2](7) NOT NULL,
       OldEvaluationObjectiveTitle [NVARCHAR](50) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationDate [DATETIME2](7) NULL,
       NewEvaluationObjectiveTitle [NVARCHAR](50) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EvaluationObjectiveRating PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[EvaluationRating]'))
CREATE TABLE [tracked_changes_tpdm].[EvaluationRating]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationDate [DATETIME2](7) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationDate [DATETIME2](7) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_EvaluationRating PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[FinancialAid]'))
CREATE TABLE [tracked_changes_tpdm].[FinancialAid]
(
       OldAidTypeDescriptorId [INT] NOT NULL,
       OldAidTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldAidTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldBeginDate [DATE] NOT NULL,
       OldStudentUSI [INT] NOT NULL,
       OldStudentUniqueId [NVARCHAR](32) NOT NULL,
       NewAidTypeDescriptorId [INT] NULL,
       NewAidTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewAidTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewBeginDate [DATE] NULL,
       NewStudentUSI [INT] NULL,
       NewStudentUniqueId [NVARCHAR](32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_FinancialAid PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[PerformanceEvaluation]'))
CREATE TABLE [tracked_changes_tpdm].[PerformanceEvaluation]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_PerformanceEvaluation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[PerformanceEvaluationRating]'))
CREATE TABLE [tracked_changes_tpdm].[PerformanceEvaluationRating]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_PerformanceEvaluationRating PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[RubricDimension]'))
CREATE TABLE [tracked_changes_tpdm].[RubricDimension]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldEvaluationElementTitle [NVARCHAR](255) NOT NULL,
       OldEvaluationObjectiveTitle [NVARCHAR](50) NOT NULL,
       OldEvaluationPeriodDescriptorId [INT] NOT NULL,
       OldEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTitle [NVARCHAR](50) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorId [INT] NOT NULL,
       OldPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldRubricRating [INT] NOT NULL,
       OldSchoolYear [SMALLINT] NOT NULL,
       OldTermDescriptorId [INT] NOT NULL,
       OldTermDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTermDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewEvaluationElementTitle [NVARCHAR](255) NULL,
       NewEvaluationObjectiveTitle [NVARCHAR](50) NULL,
       NewEvaluationPeriodDescriptorId [INT] NULL,
       NewEvaluationPeriodDescriptorNamespace [NVARCHAR](255) NULL,
       NewEvaluationPeriodDescriptorCodeValue [NVARCHAR](50) NULL,
       NewEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTitle [NVARCHAR](50) NULL,
       NewPerformanceEvaluationTypeDescriptorId [INT] NULL,
       NewPerformanceEvaluationTypeDescriptorNamespace [NVARCHAR](255) NULL,
       NewPerformanceEvaluationTypeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewRubricRating [INT] NULL,
       NewSchoolYear [SMALLINT] NULL,
       NewTermDescriptorId [INT] NULL,
       NewTermDescriptorNamespace [NVARCHAR](255) NULL,
       NewTermDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_RubricDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[SurveyResponsePersonTargetAssociation]'))
CREATE TABLE [tracked_changes_tpdm].[SurveyResponsePersonTargetAssociation]
(
       OldNamespace [NVARCHAR](255) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSurveyIdentifier [NVARCHAR](60) NOT NULL,
       OldSurveyResponseIdentifier [NVARCHAR](60) NOT NULL,
       NewNamespace [NVARCHAR](255) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSurveyIdentifier [NVARCHAR](60) NULL,
       NewSurveyResponseIdentifier [NVARCHAR](60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_SurveyResponsePersonTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_tpdm].[SurveySectionResponsePersonTargetAssociation]'))
CREATE TABLE [tracked_changes_tpdm].[SurveySectionResponsePersonTargetAssociation]
(
       OldNamespace [NVARCHAR](255) NOT NULL,
       OldPersonId [NVARCHAR](32) NOT NULL,
       OldSourceSystemDescriptorId [INT] NOT NULL,
       OldSourceSystemDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldSourceSystemDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldSurveyIdentifier [NVARCHAR](60) NOT NULL,
       OldSurveyResponseIdentifier [NVARCHAR](60) NOT NULL,
       OldSurveySectionTitle [NVARCHAR](255) NOT NULL,
       NewNamespace [NVARCHAR](255) NULL,
       NewPersonId [NVARCHAR](32) NULL,
       NewSourceSystemDescriptorId [INT] NULL,
       NewSourceSystemDescriptorNamespace [NVARCHAR](255) NULL,
       NewSourceSystemDescriptorCodeValue [NVARCHAR](50) NULL,
       NewSurveyIdentifier [NVARCHAR](60) NULL,
       NewSurveyResponseIdentifier [NVARCHAR](60) NULL,
       NewSurveySectionTitle [NVARCHAR](255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_SurveySectionResponsePersonTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)