select 
    'execute dbms_system.set_sql_trace_in_session('||SID||','||SERIAL#||',true);' 
from  
    v$session
where 
    machine like '%&machine%';=
