select logon_time,'alter system kill session '''||sid||','||SERIAL#||''' immediate;' from v$session
where status='KILLED';

SELECT client_info FROM v$session
WHERE client_info IS NOT NULL;

desc v$session;

select count(*) from v$session;