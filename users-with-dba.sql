select p.grantee, u.account_status
from dba_role_privs p inner join dba_users u
on p.grantee = u.username
where granted_role='DBA';
