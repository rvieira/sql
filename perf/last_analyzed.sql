SELECT
    owner,
    table_name,
    last_analyzed,
FROM
    dba_tables
WHERE
    owner=&owner
ORDER BY
    last_analyzed DESC;