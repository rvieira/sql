set lines 200 pages 100
col table_names for a50
col owner for a30

SELECT
    owner,
    table_name,
    object_type,
    last_analyzed
FROM
    dba_tab_statistics
WHERE
    stale_stats='YES'
ORDER BY
    last_analyzed DESC;