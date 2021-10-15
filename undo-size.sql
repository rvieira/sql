select 
  sum(df.bytes) as undo_size 
from 
  v$datafile df, 
  v$tablespace ts, 
  dba_tablespaces dts 
where 
  dts.contents = 'UNDO' and 
  dts.status = 'ONLINE' and 
  ts.name = dts.tablespace_name and 
  df.ts# = ts.ts#;