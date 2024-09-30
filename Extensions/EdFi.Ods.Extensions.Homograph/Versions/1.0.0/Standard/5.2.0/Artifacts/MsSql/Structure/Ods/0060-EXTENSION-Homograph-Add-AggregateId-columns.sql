-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/* Generated with SSMS using:
------------------------------------------------
    DECLARE @schema NVARCHAR(128) = 'sample'; 

	SELECT 'CREATE SEQUENCE [' + c.TABLE_SCHEMA + '].[' + c.TABLE_NAME + '_AggSeq] START WITH -2147483648 INCREMENT BY 1; ALTER TABLE [' + c.TABLE_SCHEMA + '].[' + c.TABLE_NAME + '] ADD AggregateId int NOT NULL DEFAULT NEXT VALUE FOR [' + c.TABLE_SCHEMA + '].[' + c.TABLE_NAME + '_AggSeq]; CREATE INDEX [IX_' + c.TABLE_NAME + '_AggregateId] ON [' + c.TABLE_SCHEMA + '].[' + c.TABLE_NAME + '] (AggregateId);' AS SqlServer
	FROM INFORMATION_SCHEMA.COLUMNS c
	WHERE c.COLUMN_NAME = 'Id' and c.TABLE_SCHEMA = @schema
	ORDER BY c.TABLE_SCHEMA, c.TABLE_NAME
------------------------------------------------
*/

CREATE SEQUENCE [homograph].[Contact_AggSeq] START WITH -2147483648 INCREMENT BY 1;
GO
ALTER TABLE [homograph].[Contact] ADD AggregateId int NOT NULL DEFAULT NEXT VALUE FOR [homograph].[Contact_AggSeq];
GO
CREATE INDEX [IX_Contact_AggregateId] ON [homograph].[Contact] (AggregateId);
GO

CREATE SEQUENCE [homograph].[Name_AggSeq] START WITH -2147483648 INCREMENT BY 1;
GO
ALTER TABLE [homograph].[Name] ADD AggregateId int NOT NULL DEFAULT NEXT VALUE FOR [homograph].[Name_AggSeq];
GO
CREATE INDEX [IX_Name_AggregateId] ON [homograph].[Name] (AggregateId);
GO

CREATE SEQUENCE [homograph].[School_AggSeq] START WITH -2147483648 INCREMENT BY 1
GO
