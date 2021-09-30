select * from v$session where status = 'KILLED';
select count(*) from v$session;
select 'alter system kill session '''||sid||','||serial#||''';' from v$session where status = 'KILLED';