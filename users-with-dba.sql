set lines 200 pages 100
col grantee for a20
col account_status for a20
select p.grantee, u.account_status
from dba_role_privs p inner join dba_users u
on p.grantee = u.username
where granted_role='DBA';
