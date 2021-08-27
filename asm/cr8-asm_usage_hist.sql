create table asm_usage_hist 
SELECT 
    name, 
    type, 
    total_mb/1024/1024 "Total TB", 
    free_mb/1024/1024 "Free TB", 
    required_mirror_free_mb,
    usable_file_mb,
    free_mb/total_mb*100 as percentage
FROM 
    V$ASM_DISKGROUP;