select 
    sum(bytes)/1024/1024/1024 Free_GB 
from 
    dba_free_space 
where 
    tablespace_name ='UNDO';