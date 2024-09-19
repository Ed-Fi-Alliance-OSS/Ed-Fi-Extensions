-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE SEQUENCE tpdm.candidate_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.Candidate ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.candidate_aggseq');
CREATE INDEX ix_candidate_aggid ON tpdm.Candidate (AggregateId);

CREATE SEQUENCE tpdm.candidateeducatorpreparationprogramassociation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.candidateeducatorpreparationprogramassociation_aggseq');
CREATE INDEX ix_candidateeducatorpreparationprogramassociation_aggid ON tpdm.CandidateEducatorPreparationProgramAssociation (AggregateId);

CREATE SEQUENCE tpdm.educatorpreparationprogram_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EducatorPreparationProgram ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.educatorpreparationprogram_aggseq');
CREATE INDEX ix_educatorpreparationprogram_aggid ON tpdm.EducatorPreparationProgram (AggregateId);

CREATE SEQUENCE tpdm.evaluation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.Evaluation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluation_aggseq');
CREATE INDEX ix_evaluation_aggid ON tpdm.Evaluation (AggregateId);

CREATE SEQUENCE tpdm.evaluationelement_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EvaluationElement ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluationelement_aggseq');
CREATE INDEX ix_evaluationelement_aggid ON tpdm.EvaluationElement (AggregateId);

CREATE SEQUENCE tpdm.evaluationelementrating_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EvaluationElementRating ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluationelementrating_aggseq');
CREATE INDEX ix_evaluationelementrating_aggid ON tpdm.EvaluationElementRating (AggregateId);

CREATE SEQUENCE tpdm.evaluationobjective_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EvaluationObjective ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluationobjective_aggseq');
CREATE INDEX ix_evaluationobjective_aggid ON tpdm.EvaluationObjective (AggregateId);

CREATE SEQUENCE tpdm.evaluationobjectiverating_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EvaluationObjectiveRating ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluationobjectiverating_aggseq');
CREATE INDEX ix_evaluationobjectiverating_aggid ON tpdm.EvaluationObjectiveRating (AggregateId);

CREATE SEQUENCE tpdm.evaluationrating_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.EvaluationRating ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.evaluationrating_aggseq');
CREATE INDEX ix_evaluationrating_aggid ON tpdm.EvaluationRating (AggregateId);

CREATE SEQUENCE tpdm.financialaid_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.FinancialAid ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.financialaid_aggseq');
CREATE INDEX ix_financialaid_aggid ON tpdm.FinancialAid (AggregateId);

CREATE SEQUENCE tpdm.performanceevaluation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.PerformanceEvaluation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.performanceevaluation_aggseq');
CREATE INDEX ix_performanceevaluation_aggid ON tpdm.PerformanceEvaluation (AggregateId);

CREATE SEQUENCE tpdm.performanceevaluationrating_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.PerformanceEvaluationRating ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.performanceevaluationrating_aggseq');
CREATE INDEX ix_performanceevaluationrating_aggid ON tpdm.PerformanceEvaluationRating (AggregateId);

CREATE SEQUENCE tpdm.rubricdimension_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.RubricDimension ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.rubricdimension_aggseq');
CREATE INDEX ix_rubricdimension_aggid ON tpdm.RubricDimension (AggregateId);

CREATE SEQUENCE tpdm.surveyresponsepersontargetassociation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.surveyresponsepersontargetassociation_aggseq');
CREATE INDEX ix_surveyresponsepersontargetassociation_aggid ON tpdm.SurveyResponsePersonTargetAssociation (AggregateId);

CREATE SEQUENCE tpdm.surveysectionresponsepersontargetassociation_aggseq START WITH -2147483648 INCREMENT BY 1 MINVALUE -2147483648;
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ADD COLUMN AggregateId int NOT NULL DEFAULT nextval('tpdm.surveysectionresponsepersontargetassociation_aggseq');
CREATE INDEX ix_surveysectionresponsepersontargetassociation_aggid ON tpdm.SurveySectionResponsePersonTargetAssociation (AggregateId);
