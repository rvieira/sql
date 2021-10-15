select 
  sum(df.bytes)/1024/1024/1024 as undo_size_GB 
from 
  v$datafile df, 
  v$tablespace ts, 
  dba_tablespaces dts 
where 
  dts.contents = 'UNDO' and 
  dts.status = 'ONLINE' and 
  ts.name = dts.tablespace_name and 
  df.ts# = ts.ts#;
