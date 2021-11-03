set lines 200
set pages 100
col name for a50
col network_name for a80

select 
    name,
    network_name
from
    dba_services
order by
    1;