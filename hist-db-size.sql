-- Historically daily tablespace size from dba_hist_tbspc_space_usage (AWR table)
SELECT TO_CHAR(end_interval_time,'dd-mm-yyyy') snap_time,
ROUND(SUM(tablespace_size) * 8192 / 1024 / 1024 / 1024, 1) size_gb,
ROUND(SUM(tablespace_usedsize) * 8192 / 1024 / 1024 / 1024, 1) usedsize_gb
FROM sys.dba_hist_tbspc_space_usage tsu,
sys.dba_hist_snapshot s
WHERE tsu.snap_id = s.snap_id
AND s.snap_id IN
(SELECT snap_id
FROM sys.dba_hist_snapshot
WHERE TO_CHAR(end_interval_time, 'HH24') = '00' )
GROUP BY end_interval_time
ORDER BY end_interval_time;
 
-- Space added to the datafiles per month
SELECT TO_CHAR(creation_time, 'YYYY Month') "Month",
ROUND(SUM(bytes)/1024/1024/1024) "Growth in GBytes"
FROM sys.v_$datafile
GROUP BY TO_CHAR(creation_time, 'YYYY Month')
ORDER BY TO_DATE(TO_CHAR(creation_time, 'YYYY Month'),'YYYY Month');

desc sys.dba_hist_tbspc_space_usage;