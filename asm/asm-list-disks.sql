set pages 100
col path for a30

select disk_number, group_number, total_mb, name, path, create_date, mount_date, header_status
from v$asm_disk
order by create_date;

select * from v$asm_disk;

select * from v$asm_diskgroup;