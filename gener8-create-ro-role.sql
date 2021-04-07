select 
  'grant select on "'||owner||'"."'||object_name||'" to &grantee;'
from 
  dba_objects
where 
  owner = upper('&schema') and
  object_type in ('TABLE','VIEW');
  
  desc dba_objects;