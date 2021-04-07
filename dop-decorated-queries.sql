set lines 250
set pages 100
col owner for a30
col table_name for a30
col index_name for a30
col degree for a30

select owner, table_name, index_name, degree from all_indexes where degree > '1';
