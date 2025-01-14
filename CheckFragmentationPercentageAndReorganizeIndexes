SELECT 
    OBJECT_NAME(ips.OBJECT_ID) AS TableName,
    i.name AS IndexName,
    ips.index_id,
    ips.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS ips
JOIN sys.indexes AS i ON ips.OBJECT_ID = i.OBJECT_ID AND ips.index_id = i.index_id
WHERE OBJECT_NAME(ips.OBJECT_ID) = 'YOUR_TABLE_NAME'; -- replace by your table name

ALTER INDEX ALL ON AircraftsAvailabilityLocations
REORGANIZE;
