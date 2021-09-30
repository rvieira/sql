------------------------------
-- Anjum, this one is for you
------------------------------
select sql_text
from v$sqltext
where SQL_ID = '&sqlid' 
order by piece asc;