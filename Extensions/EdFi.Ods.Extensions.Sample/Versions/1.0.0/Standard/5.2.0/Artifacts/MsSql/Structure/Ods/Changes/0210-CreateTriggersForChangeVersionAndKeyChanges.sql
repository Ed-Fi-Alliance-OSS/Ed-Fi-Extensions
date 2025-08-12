-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

DROP TRIGGER IF EXISTS [sample].[sample_Bus_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [sample].[sample_Bus_TR_UpdateChangeVersion] ON [sample].[Bus] AFTER UPDATE AS
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
    FROM [sample].[Bus] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [sample].[sample_BusRoute_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [sample].[sample_BusRoute_TR_UpdateChangeVersion] ON [sample].[BusRoute] AFTER UPDATE AS
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
    FROM [sample].[BusRoute] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

DROP TRIGGER IF EXISTS [sample].[sample_StudentGraduationPlanAssociation_TR_UpdateChangeVersion]
GO

CREATE TRIGGER [sample].[sample_StudentGraduationPlanAssociation_TR_UpdateChangeVersion] ON [sample].[StudentGraduationPlanAssociation] AFTER UPDATE AS
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
    FROM [sample].[StudentGraduationPlanAssociation] u
    INNER JOIN inserted i ON i.Id = u.Id
    INNER JOIN deleted d ON d.Id = u.Id;
END	
GO

