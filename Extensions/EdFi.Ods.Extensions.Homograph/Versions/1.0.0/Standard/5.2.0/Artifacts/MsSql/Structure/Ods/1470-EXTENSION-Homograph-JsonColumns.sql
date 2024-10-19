-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

ALTER TABLE homograph.Contact ADD Json varbinary(8000);
ALTER TABLE homograph.Name ADD Json varbinary(8000);
ALTER TABLE homograph.School ADD Json varbinary(8000);
ALTER TABLE homograph.SchoolYearType ADD Json varbinary(8000);
ALTER TABLE homograph.Staff ADD Json varbinary(8000);
ALTER TABLE homograph.Student ADD Json varbinary(8000);
ALTER TABLE homograph.StudentSchoolAssociation ADD Json varbinary(8000);
