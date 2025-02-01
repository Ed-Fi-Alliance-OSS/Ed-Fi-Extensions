-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DO $$
BEGIN

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.contact;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.name;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.school;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.schoolyeartype;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.staff;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.student;

DROP TRIGGER IF EXISTS UpdateChangeVersion ON homograph.studentschoolassociation;

CREATE OR REPLACE FUNCTION tracked_changes_homograph.studentschoolassociation_keychg()
    RETURNS trigger AS
$BODY$
DECLARE
BEGIN

    -- Handle key changes
    INSERT INTO tracked_changes_homograph.studentschoolassociation(
        oldschoolname, oldstudentfirstname, oldstudentlastsurname, 
        newschoolname, newstudentfirstname, newstudentlastsurname, 
        id, changeversion)
    VALUES (
        old.schoolname, old.studentfirstname, old.studentlastsurname, 
        new.schoolname, new.studentfirstname, new.studentlastsurname, 
        old.id, new.changeversion);

    RETURN null;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'handlekeychanges' AND event_object_schema = 'homograph' AND event_object_table = 'studentschoolassociation') THEN
    CREATE TRIGGER HandleKeyChanges AFTER UPDATE OF schoolname, studentfirstname, studentlastsurname ON homograph.studentschoolassociation
        FOR EACH ROW EXECUTE PROCEDURE tracked_changes_homograph.studentschoolassociation_keychg();
END IF;

DROP FUNCTION IF EXISTS changes.updateChangeVersion();

END
$$;
