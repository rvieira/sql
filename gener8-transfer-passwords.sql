with t as
  ( select dbms_metadata.get_ddl('USER',username) ddl from dba_users where username like '&username')
  select replace(substr(ddl,1,instr(ddl,'DEFAULT')-1),'CREATE','ALTER')||';'
  from t;
