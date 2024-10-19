-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE tpdm.Candidate ADD Json varbinary(8000);
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ADD Json varbinary(8000);
ALTER TABLE tpdm.EducatorPreparationProgram ADD Json varbinary(8000);
ALTER TABLE tpdm.Evaluation ADD Json varbinary(8000);
ALTER TABLE tpdm.EvaluationElement ADD Json varbinary(8000);
ALTER TABLE tpdm.EvaluationElementRating ADD Json varbinary(8000);
ALTER TABLE tpdm.EvaluationObjective ADD Json varbinary(8000);
ALTER TABLE tpdm.EvaluationObjectiveRating ADD Json varbinary(8000);
ALTER TABLE tpdm.EvaluationRating ADD Json varbinary(8000);
ALTER TABLE tpdm.FinancialAid ADD Json varbinary(8000);
ALTER TABLE tpdm.PerformanceEvaluation ADD Json varbinary(8000);
ALTER TABLE tpdm.PerformanceEvaluationRating ADD Json varbinary(8000);
ALTER TABLE tpdm.RubricDimension ADD Json varbinary(8000);
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ADD Json varbinary(8000);
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ADD Json varbinary(8000);
