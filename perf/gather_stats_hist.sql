set lines 300 pages 100
col operation for a50

select 
    id,
    operation,
    to_char(start_time,'dd-mm-yyyy hh24:mi:ss'),
    to_char(end_time,'dd-mm-yyyy hh24:mi:ss'),
    status,
    job_name
from 
    dba_optstat_operations
order by 
    start_time desc;
