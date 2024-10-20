-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE homograph.Name ADD COLUMN Json bytea;
ALTER TABLE homograph.Parent ADD COLUMN Json bytea;
ALTER TABLE homograph.School ADD COLUMN Json bytea;
ALTER TABLE homograph.SchoolYearType ADD COLUMN Json bytea;
ALTER TABLE homograph.Staff ADD COLUMN Json bytea;
ALTER TABLE homograph.Student ADD COLUMN Json bytea;
ALTER TABLE homograph.StudentSchoolAssociation ADD COLUMN Json bytea;
