select username
from dba_users
where username like '%&schema%';
show user;

select name from user$;

show parameter os_authent_prefix;

select 
   owner,
   sum(bytes)/1024/1024/1024 schema_size_gig
from 
   dba_segments 
group by owner
order by owner;
