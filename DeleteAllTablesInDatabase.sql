DECLARE @sql NVARCHAR(MAX) = N'';
DECLARE @crlf NCHAR(2) = CHAR(13) + CHAR(10);

-- Drop all foreign key constraints
SELECT @sql += N'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) +
              N' DROP CONSTRAINT ' + QUOTENAME(name) + N';' + @crlf
FROM sys.foreign_keys;

-- Execute the generated SQL to drop constraints
EXEC sp_executesql @sql;

-- Reset the @sql variable for dropping tables
SET @sql = N'';

-- Generate DROP TABLE statements for all user-defined tables in the current database
SELECT @sql += N'DROP TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + N'.' + QUOTENAME(name) + N';' + @crlf
FROM sys.tables
WHERE SCHEMA_NAME(schema_id) NOT IN ('sys', 'INFORMATION_SCHEMA');

-- Execute the generated SQL to drop tables
EXEC sp_executesql @sql;