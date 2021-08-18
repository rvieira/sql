select os_username,userhost,owner,action_name,extended_timestamp
from dba_audit_trail
where timestamp > to_date('03-JUL-19 22.00.00','dd-mon-yy hh24.mi.ss') and current_user='<username>'
/
