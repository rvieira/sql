select 
    owner,
    count(*)
from 
    dba_objects
group by 
    owner;