select * from dba_datapump_jobs;

SELECT 
    lops.username, 
    s.sid, 
    lops.opname, 
    lops.target,
    round(lops.SOFAR*100/lops.TOTALWORK,0) || '%' as "%DONE", lops.TIME_REMAINING,
    to_char(lops.start_time,'YYYY/MM/DD HH24:MI:SS') start_time
FROM 
    v$session_longops lops, 
    v$session s
WHERE 
    s.sid = lops.sid and
    lops.username = 'VIEIRA'
ORDER BY 6;

SELECT 
    sl.sid, 
    sl.serial#, 
    sl.sofar, 
    sl.totalwork, 
    dp.owner_name, 
    dp.state, 
    dp.job_mode
FROM 
    v$session_longops sl, 
    v$datapump_job dp
WHERE 
    sl.opname = dp.job_name and
    sl.sofar != sl.totalwork;