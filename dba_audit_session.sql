--desc dba_audit_session
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select *
from dba_audit_session 
where 
    timestamp > '10-NOV-2018' and
    action_name = 'LOGOFF' and
    username = 'SYSTEM'
order by timestamp desc;