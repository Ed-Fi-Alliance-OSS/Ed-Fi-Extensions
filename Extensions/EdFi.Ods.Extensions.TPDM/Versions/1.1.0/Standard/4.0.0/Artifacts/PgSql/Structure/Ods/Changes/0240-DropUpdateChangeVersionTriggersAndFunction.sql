-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DO $$
BEGIN

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.candidate;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.candidateeducatorpreparationprogramassociation;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.educatorpreparationprogram;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluation;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluationelement;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluationelementrating;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluationobjective;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluationobjectiverating;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.evaluationrating;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.financialaid;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.performanceevaluation;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.performanceevaluationrating;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.rubricdimension;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.surveyresponsepersontargetassociation;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON tpdm.surveysectionresponsepersontargetassociation;

DROP FUNCTION IF EXISTS changes.updateChangeVersion();

END
$$;
