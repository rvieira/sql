set pagesize 0
set linesize 200
col full_alias_path format a80
/*+ ----------------------------------------------------------------
    Query will return all the files stored on ASM but not currenlty
    opened by any database client of the diskgroups
    ordered by group number, file type
    ---------------------------------------------------------------*/

select * from (
/*+ -----------------------------------------------------------------
    1st branch returns all the files stored on ASM
    -----------------------------------------------------------------*/
select  x.gnum,x.filnum,x.full_alias_path,f.ftype from (
SELECT gnum,filnum,concat('+'||gname, sys_connect_by_path(aname, '/')) full_alias_path
FROM (SELECT g.name gname, a.parent_index pindex, a.name aname,
            a.reference_index rindex,a.group_number gnum,a.file_number filnum
      FROM v$asm_alias a, v$asm_diskgroup g
      WHERE a.group_number = g.group_number)
START WITH (mod(pindex, power(2, 24))) = 0 CONNECT BY PRIOR rindex = pindex) x,
(select group_number gnum,file_number filnum, type ftype from v$asm_file order by group_number,file_number) f
where x.filnum != 4294967295
and x.gnum=f.gnum and x.filnum=f.filnum
MINUS
/*+ --------------------------------------------------------------
    2nd branch returns all the files stored on ASM
    and currently opened by any database client of the diskgroups
    -----------------------------------------------------------------*/
select x.gnum,x.filnum,x.full_alias_path,f.ftype
from ( select distinct GROUP_KFFOF gnum, NUMBER_KFFOF filnum from X$KFFOF where NUMBER_KFFOF >= 256) l,
(
SELECT gnum,filnum,concat('+'||gname, sys_connect_by_path(aname, '/')) full_alias_path
FROM (SELECT g.name gname, a.parent_index pindex, a.name aname,
            a.reference_index rindex,a.group_number gnum,a.file_number filnum
      FROM v$asm_alias a, v$asm_diskgroup g
      WHERE a.group_number = g.group_number)
START WITH (mod(pindex, power(2, 24))) = 0 CONNECT BY PRIOR rindex = pindex
) x,
(select group_number gnum,file_number filnum, type ftype from v$asm_file order by group_number,file_number) f
where x.filnum != 4294967295 and
x.gnum=l.gnum
and x.filnum=l.filnum 
and x.gnum=f.gnum and x.filnum=f.filnum) q
order  by q.gnum,q.ftype
;
