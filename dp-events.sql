select v.status, v.sid,v.serial#,io.block_changes,event 
from v$sess_io io, v$session v 
where io.sid = v.sid 
and v.saddr in (
    select saddr 
    from dba_datapump_sessions
) order by sid;
