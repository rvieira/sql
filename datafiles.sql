set lines 200 pages 100
col file_name for a80

select
  file_name,
  tablespace_name,
  bytes/1024/1024/1024 GB
from
  dba_data_files
order by
  2,1;
