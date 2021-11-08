accept schema prompt 'Owner: '
accept tabname prompt 'Table: '
select 
    (
        select 
            sum(s.bytes)
        from 
            dba_segments schema
        where 
            s.owner=upper('&schema') and 
            s.segment_name=upper('&tabname')
    ) +
    (
        select
            sum(s.bytes)
        from
            dba_segments s, 
            dba_lobs l
        where
            s.owner = upper('&schema') and
                (
                    l.segment_name = s.segment_name and
                    l.table_name = upper('&tabname') and
                    l.owner = upper('&schema')
                ) 

    ) +
    (
        select 
            sum(s.bytes)
        from
            dba_segments s,
            dba_indexes i 
        where s.owner = upper('&schema') and
            (
                i.index_name = s.segment_name and
                i.table_name = upper('&tabname') and
                index_type = 'LOB' and
                i.owner = upper('&schema')
            )    

    )
    "Total table size"
    from dual;