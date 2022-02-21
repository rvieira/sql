select 
    sysdate,status,error
from 
    gv$archive_dest_status
where 
    type='PHYSICAL' and 
    status!='VALID' or 
    error is not null;