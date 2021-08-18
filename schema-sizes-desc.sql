select 
   owner,
   sum(bytes)/1024/1024/1024 schema_size_gig
from 
   dba_segments
where 
    upper(owner) like upper('%&owner%')
group by 
   owner
order by schema_size_gig desc;