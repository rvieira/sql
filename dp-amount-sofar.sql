SELECT sl.sid, sl.serial#, sl.sofar, sl.MESSAGE,sl.totalwork, dp.owner_name, dp.state, dp.job_mode
FROM v$session_longops sl, v$datapump_job dp
WHERE sl.opname = dp.job_name;