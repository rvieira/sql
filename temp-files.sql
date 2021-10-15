SELECT
   tablespace_name,
   file_name,
   bytes/1024/1024 MB,
   status,
   autoextensible,
   maxbytes/1024/1024 Max_MB,
   increment_by
FROM
   dba_temp_files
ORDER BY
   tablespace_name;