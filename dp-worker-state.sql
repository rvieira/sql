select s.sid, s.module, s.state, 
       substr(s.event, 1, 21) as event,
       s.seconds_in_wait as secs, 
       substr(sql.sql_text, 1, 30) as sql_text
from v$session s
join v$sql sql on sql.sql_id = s.sql_id
where s.module like 'Data Pump%'
order by s.module, s.sid;
