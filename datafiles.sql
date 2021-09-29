select
  file_name,
  tablespace_name,
  bytes
from
  dba_data_files
order by
  2,1;
