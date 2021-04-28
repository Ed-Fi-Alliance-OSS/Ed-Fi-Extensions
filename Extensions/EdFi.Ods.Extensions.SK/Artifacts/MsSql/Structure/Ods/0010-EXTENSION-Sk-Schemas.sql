IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'sk')
EXEC sys.sp_executesql N'CREATE SCHEMA [sk]'
GO
