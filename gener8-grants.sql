set lines 200 pages 0
select
    'grant '||p.privilege||' on '||p.owner||'.'||p.table_name||' to '||p.grantee||';' "Grant Statement"
from
    dba_tab_privs p,
    dba_objects o 
where
    p.owner = o.owner and
    p.table_name = o.object_name and
    p.owner not in ('SYS','SYSTEM','XDB','GSMADMIN_INTERNAL','WMSYS')
order by 
    p.grantee, 
    p.owner, 
    p.table_name, 
    p.privilege;