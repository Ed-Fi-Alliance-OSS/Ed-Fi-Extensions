-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP VIEW IF EXISTS auth.EducationOrganizationIdToUniversityId;
DROP VIEW IF EXISTS auth.EducationOrganizationIdToTeacherPreparationProviderId;
DROP VIEW IF EXISTS auth.StaffUSIToTeacherPreparationProviderId;
DROP VIEW IF EXISTS auth.StaffUSIToUniversityId;
DROP VIEW IF EXISTS auth.EducationOrganizationIdToEducationServiceCenterId;
DROP VIEW IF EXISTS auth.EducationOrganizationIdToStateAgencyId;
DROP VIEW IF EXISTS auth.EducationOrganizationIdentifiers;

-- add university and teacherpreparationprovider
CREATE OR REPLACE VIEW auth.EducationOrganizationIdentifiers
AS
SELECT  edorg.EducationOrganizationId,
        CASE
            WHEN sea.StateEducationAgencyId IS NOT NULL THEN N'StateEducationAgency'
            WHEN esc.EducationServiceCenterId IS NOT NULL THEN N'EducationServiceCenter'
            WHEN lea.LocalEducationAgencyId IS NOT NULL THEN N'LocalEducationAgency'
            WHEN sch.SchoolId IS NOT NULL THEN N'School'
            WHEN co.CommunityOrganizationId IS NOT NULL THEN N'CommunityOrganization'
            WHEN cp.CommunityProviderId IS NOT NULL THEN N'CommunityProvider'
            WHEN co.CommunityOrganizationId IS NOT NULL THEN N'CommunityOrganization'
            WHEN psi.PostSecondaryInstitutionId IS NOT NULL THEN N'PostSecondaryInstitution'
        END AS EducationOrganizationType,
        COALESCE(sea.StateEducationAgencyId, esc.StateEducationAgencyId, lea.StateEducationAgencyId, lea_sch.StateEducationAgencyId) AS StateEducationAgencyId,
        COALESCE(esc.EducationServiceCenterId, lea.EducationServiceCenterId, lea_sch.EducationServiceCenterId) AS EducationServiceCenterId,
        COALESCE(lea.LocalEducationAgencyId, sch.LocalEducationAgencyId) AS LocalEducationAgencyId,
        COALESCE(co.CommunityOrganizationID, cp.CommunityOrganizationId) AS CommunityOrganizationId,
        cp.CommunityProviderId,
        psi.PostSecondaryInstitutionId,
        sch.SchoolId,
        edorg.Discriminator AS FullEducationOrganizationType,
        edorg.NameOfInstitution        
FROM    edfi.EducationOrganization edorg
        LEFT JOIN edfi.StateEducationAgency sea
            ON edorg.EducationOrganizationId = sea.StateEducationAgencyId
        LEFT JOIN edfi.EducationServiceCenter esc
            ON edorg.EducationOrganizationId = esc.EducationServiceCenterId
        LEFT JOIN edfi.LocalEducationAgency lea
            ON edorg.EducationOrganizationId = lea.LocalEducationAgencyId
        LEFT JOIN edfi.School sch
            ON edorg.EducationOrganizationId = sch.SchoolId
        LEFT JOIN edfi.LocalEducationAgency lea_sch
            ON sch.LocalEducationAgencyId = lea_sch.LocalEducationAgencyId
        LEFT JOIN edfi.CommunityOrganization co
            ON edorg.EducationOrganizationId = co.CommunityOrganizationId
        LEFT JOIN edfi.CommunityProvider cp
            ON edorg.EducationOrganizationId = cp.CommunityProviderId
        LEFT JOIN edfi.CommunityOrganization cp_co
            ON cp.CommunityOrganizationId = cp_co.CommunityOrganizationId
        LEFT JOIN edfi.PostSecondaryInstitution psi
WHERE   --Use same CASE as above to eliminate non-institutions (e.g. Networks)
        CASE
            WHEN sea.StateEducationAgencyId IS NOT NULL THEN N'StateEducationAgency'
            WHEN esc.EducationServiceCenterId IS NOT NULL THEN N'EducationServiceCenter'
            WHEN lea.LocalEducationAgencyId IS NOT NULL THEN N'LocalEducationAgency'
            WHEN sch.SchoolId IS NOT NULL THEN N'School'
            WHEN co.CommunityOrganizationId IS NOT NULL THEN N'CommunityOrganization'
            WHEN cp.CommunityProviderId IS NOT NULL THEN N'CommunityProvider'
            WHEN psi.PostSecondaryInstitutionId IS NOT NULL THEN N'PostSecondaryInstitution'
        END IS NOT NULL;

-- recreate dependent views on educationorganizationidentifiers

CREATE OR REPLACE VIEW auth.EducationOrganizationIdToEducationServiceCenterId
AS
-- Only LEAs and Schools are accessible to ESC-level claims
    SELECT EducationServiceCenterId
         ,LocalEducationAgencyId AS EducationOrganizationId
    FROM auth.EducationOrganizationIdentifiers
    WHERE LocalEducationAgencyId IS NOT NULL

    UNION
    SELECT EducationServiceCenterId
         ,SchoolId AS EducationOrganizationId
    FROM auth.EducationOrganizationIdentifiers
    WHERE SchoolId IS NOT NULL

    UNION
-- ESC-level claims also can access the ESC
    SELECT EducationServiceCenterId
         ,EducationServiceCenterId AS EducationOrganizationId
    FROM edfi.EducationServiceCenter;

CREATE OR REPLACE VIEW auth.EducationOrganizationIdToStateAgencyId
AS
-- Only ESCs, LEAs and Schools are accessible to State-level claims
    SELECT StateEducationAgencyId
         ,EducationServiceCenterId AS EducationOrganizationId
    FROM auth.EducationOrganizationIdentifiers
    WHERE EducationServiceCenterId IS NOT NULL

    UNION
    SELECT StateEducationAgencyId
         ,LocalEducationAgencyId AS EducationOrganizationId
    FROM auth.EducationOrganizationIdentifiers
    WHERE LocalEducationAgencyId IS NOT NULL

    UNION
    SELECT StateEducationAgencyId
         ,SchoolId AS EducationOrganizationId
    FROM auth.EducationOrganizationIdentifiers
    WHERE SchoolId IS NOT NULL

    UNION
-- State-level claims also can access the State
    SELECT StateEducationAgencyId
         ,StateEducationAgencyId AS EducationOrganizationId
    FROM edfi.StateEducationAgency;
