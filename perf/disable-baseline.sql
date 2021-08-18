begin
  dbms_output.put_line(
  dbms_spm.alter_sql_plan_baseline
  ( sql_handle => 
    'SQL_88f253bc40dfd6f2',
    attribute_name => 'enabled',
    attribute_value => 'NO' )
  );
end;
/