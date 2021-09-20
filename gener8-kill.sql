select 'ALTER SYSTEM KILL SESSION '''||sid||','||serial#||''';' 
from v$session
where username = '&username';
