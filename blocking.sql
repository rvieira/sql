select * from v$session
where blocking_session is not null;


select * from v$session_blockers;