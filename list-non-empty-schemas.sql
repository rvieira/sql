select replace(DBMS_METADATA.GET_DDL('USER','SCOTT'),'CREATE USER','ALTER USER') from dual;

select username from dba_users where (select count(1) from dba_objects where owner=username) > 0 order by 1;
desc dba_objects;