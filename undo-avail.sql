select 
    tablespace_name, sum(blocks)*8/(1024) reusable_space 
from 
    dba_undo_extents 
where 
    status='EXPIRED' 
group by 
    tablespace_name;