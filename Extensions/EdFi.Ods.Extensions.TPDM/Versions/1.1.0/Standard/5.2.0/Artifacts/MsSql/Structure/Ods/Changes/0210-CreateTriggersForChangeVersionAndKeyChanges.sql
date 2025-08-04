-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP TRIGGER IF EXISTS [tpdm].[tpdm_Candidate_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_Candidate_TR_UpdateChangeVersion] ON [tpdm].[Candidate] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[Candidate] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_CandidateEducatorPreparationProgramAssociation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_CandidateEducatorPreparationProgramAssociation_TR_UpdateChangeVersion] ON [tpdm].[CandidateEducatorPreparationProgramAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[CandidateEducatorPreparationProgramAssociation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EducatorPreparationProgram_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EducatorPreparationProgram_TR_UpdateChangeVersion] ON [tpdm].[EducatorPreparationProgram] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EducatorPreparationProgram] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_Evaluation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_Evaluation_TR_UpdateChangeVersion] ON [tpdm].[Evaluation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[Evaluation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationElement_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationElement_TR_UpdateChangeVersion] ON [tpdm].[EvaluationElement] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EvaluationElement] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationElementRating_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationElementRating_TR_UpdateChangeVersion] ON [tpdm].[EvaluationElementRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EvaluationElementRating] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationObjective_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationObjective_TR_UpdateChangeVersion] ON [tpdm].[EvaluationObjective] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EvaluationObjective] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationObjectiveRating_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationObjectiveRating_TR_UpdateChangeVersion] ON [tpdm].[EvaluationObjectiveRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EvaluationObjectiveRating] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationRating_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationRating_TR_UpdateChangeVersion] ON [tpdm].[EvaluationRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[EvaluationRating] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_FinancialAid_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_FinancialAid_TR_UpdateChangeVersion] ON [tpdm].[FinancialAid] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[FinancialAid] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluation_TR_UpdateChangeVersion] ON [tpdm].[PerformanceEvaluation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[PerformanceEvaluation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluationRating_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluationRating_TR_UpdateChangeVersion] ON [tpdm].[PerformanceEvaluationRating] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[PerformanceEvaluationRating] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_RubricDimension_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_RubricDimension_TR_UpdateChangeVersion] ON [tpdm].[RubricDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[RubricDimension] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_SurveyResponsePersonTargetAssociation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_SurveyResponsePersonTargetAssociation_TR_UpdateChangeVersion] ON [tpdm].[SurveyResponsePersonTargetAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[SurveyResponsePersonTargetAssociation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [tpdm].[tpdm_SurveySectionResponsePersonTargetAssociation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [tpdm].[tpdm_SurveySectionResponsePersonTargetAssociation_TR_UpdateChangeVersion] ON [tpdm].[SurveySectionResponsePersonTargetAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE u
    SET 
        ChangeVersion = NEXT VALUE FOR [changes].[ChangeVersionSequence],
        LastModifiedDate = 
            CASE 
                WHEN i.LastModifiedDate = d.LastModifiedDate THEN GETUTCDATE()
                ELSE i.LastModifiedDate
            END
    FROM [tpdm].[SurveySectionResponsePersonTargetAssociation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

