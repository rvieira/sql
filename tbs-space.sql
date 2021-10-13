set pages 100 lines 265
col tablespace_name for a20
col file_name for a55

select
    df.tablespace_name,
    df.file_name,
    df.size_mb,
    f.free_mb,
    df.max_size_mb,
    f.free_mb + (df.max_size_mb - df.size_mb) as max_free_mb,
    (df.max_size_mb - (f.free_mb + (df.max_size_mb - df.size_mb)))/max_size_mb*100 as used_pct,
    100-(df.max_size_mb - (f.free_mb + (df.max_size_mb - df.size_mb)))/max_size_mb*100 as free_pct
from
    (
        select
            file_id,
            file_name,
            tablespace_name,
            trunc(bytes/1024/1024) as size_mb,
            trunc(greatest(bytes,maxbytes)/1024/1024) as max_size_mb
        from    
            dba_data_files
    ) df,
    (
        select 
            trunc(sum(bytes)/1024/1024) as free_mb,
            file_id
        from
            dba_free_space
        group by
            file_id
    ) f
where
    df.file_id = f.file_id (+)
order by
    df.tablespace_name,
    df.file_name
/
