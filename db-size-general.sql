-- Database space (total): size of the data files
select sum(bytes)/1024/1024 size_in_mb from dba_data_files;

-- Database allocated/used space: bytes in segments
select sum(bytes)/1024/1024 size_in_mb from dba_segments;

-- Used space grouped by schema
select owner, sum(bytes)/1024/1024 Size_MB 
from dba_segments
group  by owner
order by owner;