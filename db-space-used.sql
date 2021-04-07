select sum(bytes)/1024/1024/1024/1024 size_in_Tb from dba_data_files;

select sum(bytes)/1024/1024/1024/1024 size_in_Tb from dba_segments;
