 SELECT c.username,
         a.SAMPLE_TIME,
         a.SQL_OPNAME,
         a.SQL_EXEC_START,
         a.program,
         a.module,
         a.machine,
         b.SQL_TEXT
    FROM v$active_session_history a, dba_hist_sqltext b, dba_users c
   WHERE     a.SQL_ID = b.SQL_ID(+)
         AND a.user_id = c.user_id
         AND upper(a.machine) = '&machine'
ORDER BY a.SQL_EXEC_START ASC;
