select *
 from v$dataguard_status
 where severity in ('Error','Fatal')
 and timestamp > (sysdate -1);