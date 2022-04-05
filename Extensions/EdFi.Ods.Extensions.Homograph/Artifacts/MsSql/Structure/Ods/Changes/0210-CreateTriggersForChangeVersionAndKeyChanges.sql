-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP TRIGGER IF EXISTS [homograph].[homograph_Name_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_Name_TR_UpdateChangeVersion] ON [homograph].[Name] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[Name]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[Name] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_Parent_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_Parent_TR_UpdateChangeVersion] ON [homograph].[Parent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[Parent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[Parent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_School_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_School_TR_UpdateChangeVersion] ON [homograph].[School] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[School]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[School] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_SchoolYearType_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_SchoolYearType_TR_UpdateChangeVersion] ON [homograph].[SchoolYearType] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[SchoolYearType]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[SchoolYearType] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_Staff_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_Staff_TR_UpdateChangeVersion] ON [homograph].[Staff] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[Staff]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[Staff] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_Student_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_Student_TR_UpdateChangeVersion] ON [homograph].[Student] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[Student]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[Student] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

DROP TRIGGER IF EXISTS [homograph].[homograph_StudentSchoolAssociation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [homograph].[homograph_StudentSchoolAssociation_TR_UpdateChangeVersion] ON [homograph].[StudentSchoolAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [homograph].[StudentSchoolAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [homograph].[StudentSchoolAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);

    -- Handle key changes
    INSERT INTO tracked_changes_homograph.StudentSchoolAssociation(
        OldSchoolName, OldStudentFirstName, OldStudentLastSurname, 
        NewSchoolName, NewStudentFirstName, NewStudentLastSurname, 
        Id, ChangeVersion)
    SELECT
        d.SchoolName, d.StudentFirstName, d.StudentLastSurname, 
        i.SchoolName, i.StudentFirstName, i.StudentLastSurname, 
        d.Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM deleted d INNER JOIN inserted i ON d.Id = i.Id

    WHERE
        d.SchoolName <> i.SchoolName OR d.StudentFirstName <> i.StudentFirstName OR d.StudentLastSurname <> i.StudentLastSurname;
END	
GO

