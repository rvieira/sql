select *
from v$sql_monitor
where px_servers_requested <> px_servers_allocated
and module not in ('SQL Developer')
order by elapsed_time desc;