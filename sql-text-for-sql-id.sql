------------------------------
-- Anjum, this one is for you
------------------------------
select *
from v$sqltext
where SQL_ID = $sqlid 
order by piece desc;