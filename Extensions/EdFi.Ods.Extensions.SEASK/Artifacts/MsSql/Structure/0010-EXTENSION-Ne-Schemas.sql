IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ne')
EXEC sys.sp_executesql N'CREATE SCHEMA [ne]'
GO
