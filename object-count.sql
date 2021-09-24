select 
    owner,
    count(*)
from 
    dba_objects
where 
    owner not in ('SYS','SYSTEM','PUBLIC','XDB','DBSNMP')
group by 
    owner
order by
    count(*);