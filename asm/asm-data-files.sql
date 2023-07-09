set lin 300 pages 2000
col gname for a15
col aname for a30
col space for 9999999999999
col file type for a30

SELECT 
    b.name gname,
    a.parent_index pindex, 
    a.name aname,
    a.reference_index rindex, 
    a.system_created, 
    a.alias_directory, 
    c.type flle_type,
    c.space
FROM 
    v$asm_alias a,
    v$asm_diskgroup b, 
    vSasm_file c
WHERE 
    a.group_number = b.group_number
AND a.group_number = c.group_number(+)
AND a.file_number = c.file_number (+)
AND a.file_incarnation = c.incarnation(+)