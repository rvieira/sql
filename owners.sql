-- Lists users that own objects and number of objects owned
set lines 200 pages 100

select 
    owner,
    count(*)
from 
    dba_objects
group by 
    owner 
order by 
    owner;