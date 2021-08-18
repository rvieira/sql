
-- CREATE BASELINE
begin
  dbms_output.put_line(
    dbms_spm.load_plans_from_cursor_cache
    ( sql_id => 'cbjc7quanzgcr' )
  );
end;
