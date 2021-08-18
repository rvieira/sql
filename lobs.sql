SELECT table_name,retention,compression
FROM   dba_lobs
where compression not like 'NO%';
