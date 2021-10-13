set lines 200 pages 100
col file_name for a80

select
  file_name,
  tablespace_name,
  bytes
from
  dba_data_files
order by
  2,1;