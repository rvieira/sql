-- ------------------------------------------------------------------------------------------------------------
-- File Name    : https://github.com/rvieira/sql/blob/1e9e55a106eea3198652b68aa2c4ee2a4010ff04/directories.sql
-- Author       : Ricardo Vieira
-- Description  : Displays the directories defined in the database.
-- Requirements : Access to DBA views.
-- Call Syntax  : @directories
-- Last Modified: 
-- ------------------------------------------------------------------------------------------------------------
set lines 200 pages 100
col directory_path for a10

select * from dba_directories;