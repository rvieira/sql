select 
    'grant '||granted_role||' to '||grantee||';' "Grants"
from 
    dba_role_privs
where 
    grantee not in ('SYS','SYSTEM','XDB','GSMADMIN_INTERNAL','WMSYS','DBSNMP','OUTLN','AUDSYS','APPQOSSYS'); 