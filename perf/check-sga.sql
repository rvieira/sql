select value/1024/1024 shared_pool_size
from v$parameter
where name = 'shared_pool_size';

select * From v$sgastat;

select 'Memory Allocation' " "
, round(s.sgasize/1024/1024,2) "Total SGA (Mb)"
, round(f.bytes/1024/1024,2) " Free (Mb)"
, round(f.bytes*100/s.sgasize,2) " Free (%)"
from (select sum(bytes) sgasize from sys.v_$sgastat) s
, sys.v_$sgastat f
where f.name = 'free memory'
/


select round(used.bytes /1024/1024 ,2) used_mb
, round(free.bytes /1024/1024 ,2) free_mb
, round(tot.bytes /1024/1024 ,2) total_mb
from (select sum(bytes) bytes
from v$sgastat
where name != 'free memory') used
, (select sum(bytes) bytes
from v$sgastat
where name = 'free memory') free
, (select sum(bytes) bytes
from v$sgastat) tot
/