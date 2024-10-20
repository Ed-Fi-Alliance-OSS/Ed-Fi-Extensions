-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE tpdm.Candidate ADD COLUMN Json bytea;
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ADD COLUMN Json bytea;
ALTER TABLE tpdm.EducatorPreparationProgram ADD COLUMN Json bytea;
ALTER TABLE tpdm.Evaluation ADD COLUMN Json bytea;
ALTER TABLE tpdm.EvaluationElement ADD COLUMN Json bytea;
ALTER TABLE tpdm.EvaluationElementRating ADD COLUMN Json bytea;
ALTER TABLE tpdm.EvaluationObjective ADD COLUMN Json bytea;
ALTER TABLE tpdm.EvaluationObjectiveRating ADD COLUMN Json bytea;
ALTER TABLE tpdm.EvaluationRating ADD COLUMN Json bytea;
ALTER TABLE tpdm.FinancialAid ADD COLUMN Json bytea;
ALTER TABLE tpdm.PerformanceEvaluation ADD COLUMN Json bytea;
ALTER TABLE tpdm.PerformanceEvaluationRating ADD COLUMN Json bytea;
ALTER TABLE tpdm.RubricDimension ADD COLUMN Json bytea;
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ADD COLUMN Json bytea;
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ADD COLUMN Json bytea;
