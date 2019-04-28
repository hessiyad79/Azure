ALTER DATABASE t1
ADD SECONDARY ON SERVER westdbs WITH (ALLOW_CONNECTIONS = ALL);

-- show geo-replicated databases
SELECT database_id, start_date, modify_date, partner_server, partner_database, 
replication_state_desc, role, secondary_allow_connections_desc 
FROM [sys].geo_replication_links;

-- check operation status
SELECT major_resource_id,operation,state_desc,percent_complete,start_time 
FROM sys.dm_operation_status where major_resource_id = 't1'
ORDER BY start_time DESC

-- show replication lag and time (change to database scope)
SELECT link_guid, partner_server, last_replication, replication_lag_sec 
FROM sys.dm_geo_replication_link_status

-- performing Failover (run on the secondary that you want to failover to)
ALTER DATABASE t1 FAILOVER;