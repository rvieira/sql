select
    'grant '||p.privilege||' on '||p.owner||'.'||p.table_name||' to '||p.grantee||';' "Grant Statement"
from
    dba_tab_privs p,
    dba_objects o 
where
    p.owner = o.owner and
    p.table_name = o.object_name;