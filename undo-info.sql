with 
    free_sz as 
    ( 
        select 
            tablespace_name, 
            sum(f.bytes)/1048576/1024 free_gb 
        from 
            dba_free_space f 
        group by tablespace_name 
    ), 
    a as 
    ( 
        select 
            tablespace_name, 
            sum( case when status = 'EXPIRED' then blocks end)*8/1048576 reusable_space_gb , sum(case when status in ('ACTIVE', 'UNEXPIRED') then blocks end)*8/1048576 allocated_gb 
        from 
            dba_undo_extents 
        where 
            status in ('ACTIVE', 'EXPIRED', 'UNEXPIRED') 
        group by 
            tablespace_name 
    ), 
    undo_sz as 
    ( 
        select 
            tablespace_name, 
            df.user_bytes/1048576/1024 user_sz_gb 
        from 
            dba_tablespaces ts join 
            dba_data_files df 
        using (tablespace_name) 
        where 
            ts.contents = 'UNDO' and 
            ts.status = 'ONLINE' 
    ) 
select 
    tablespace_name, 
    user_sz_gb, 
    free_gb, 
    reusable_space_gb, 
    allocated_gb , 
    free_gb + reusable_space_gb + allocated_gb total 
from 
    undo_sz join free_sz using (tablespace_name) join a using (tablespace_name);
