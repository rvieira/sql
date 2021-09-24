-- --------------------------------------------------------------------------------------------------------------------
-- File Name    : https://github.com/rvieira/sql/blob/1e9e55a106eea3198652b68aa2c4ee2a4010ff04/extract-pwd-hashes.sql
-- Author       : Ricardo Vieira
-- Description  : Displays the directories defined in the database.
-- Requirements : 
-- Call Syntax  : @extract-pwd-hashes
-- Last Modified: 
-- --------------------------------------------------------------------------------------------------------------------
with t as
  ( select dbms_metadata.get_ddl('USER',username) ddl from dba_users where username like '%&schema%')
  select replace(substr(ddl,1,instr(ddl,'DEFAULT')-1),'CREATE','ALTER')||';'
  from t;

